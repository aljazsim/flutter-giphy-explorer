import "dart:async";

import "package:flutter/widgets.dart";
import "package:giphy_explorer/services/routing/route_configuration.dart";
import "package:go_router/go_router.dart";

abstract class RouterBase {
  RouteConfig? _activeRoute;
  GoRouter? _router;
  Map<String, RouteConfig> _routesByPath = <String, RouteConfig>{};

  FutureOr<String?> Function(String? routeName, Map<String, String>? routeParameters)? onRouteChanging;
  void Function()? onRouteNotFound;

  String? get activeRouteName => _activeRoute?.name;

  GoRouter configure(ModelType Function<ModelType extends Object>() modelFactory) {
    var routes = getRoutes(modelFactory);
    var routeConfigurations = routes.map((r) => _toRoute(r)).toList();
    var errorRoute = routes.firstWhere((r) => r.isErrorRoute);

    _routesByPath = {for (var route in routes) route.path: route};

    _router = GoRouter(
      restorationScopeId: "...",
      initialLocation: getInitialRoute(),
      routes: routeConfigurations,
      redirect: (_, state) async => await _onRouteChanging(_routesByPath[state.fullPath], state.pathParameters),
      errorBuilder: (_, state) => errorRoute.getWidget(errorRoute.getModel()),
    );

    return _router!;
  }

  String getInitialRoute();

  List<RouteConfig> getRoutes(ModelType Function<ModelType extends Object>() modelFactory);

  void goBack() {
    _router!.pop();
  }

  void goTo(String routeName, {Map<String, String>? routeParameters}) {
    if (routeParameters != null) {
      _router!.goNamed(routeName, pathParameters: routeParameters);
    } else {
      _router!.goNamed(routeName);
    }
  }

  int parseInt(String value) {
    return int.parse(value);
  }

  Future<String?> _onRouteChanging(RouteConfig? routeConfiguration, Map<String, String> routeParameters) async {
    var redirectedRoute = await onRouteChanging?.call(routeConfiguration?.name, routeParameters);

    if (redirectedRoute == null) {
      if (_activeRoute != null) {
        await _activeRoute!.getModel().deactivate();
      }

      _activeRoute = routeConfiguration;

      if (_activeRoute != null) {
        _activeRoute!.setParameters?.call(_activeRoute!.getModel(), routeParameters);
        await _activeRoute!.getModel().activate();
      }
    }

    return redirectedRoute;
  }

  GoRoute _toRoute(RouteConfig routeConfig) {
    return GoRoute(
      name: routeConfig.name,
      path: routeConfig.path,
      // configure page transition
      pageBuilder: (_, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: routeConfig.getWidget(routeConfig.getModel()),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    );
  }
}
