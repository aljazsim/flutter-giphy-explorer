import "dart:async";

abstract interface class IRouterBase {
  FutureOr<String?> Function(String? routeName, Map<String, String>? routeParameters)? onRouteChanging;

  String? get activeRouteName;
}
