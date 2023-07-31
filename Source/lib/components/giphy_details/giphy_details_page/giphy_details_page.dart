import "package:file_picker/file_picker.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:giphy_explorer/components/giphy_details/giphy_details_page/giphy_details_page_model.dart";
import "package:provider/provider.dart";
import "package:url_launcher/url_launcher.dart";

class GiphyDetailsPage extends StatelessWidget {
  final GiphyDetailsPageModel _model;

  const GiphyDetailsPage(this._model, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<GiphyDetailsPageModel>(
      create: (_) => _model,
      child: Consumer<GiphyDetailsPageModel>(builder: (context, _, __) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => _model.goBack(),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // title
                  Text(
                    context.select((GiphyDetailsPageModel model) => model.giph?.title ?? ""),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // image
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 300,
                        maxHeight: 300,
                      ),
                      child: Image.network(
                        context.select((GiphyDetailsPageModel model) => model.giph?.url ?? ""),
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, e) {
                          // loading indicator
                          if (e == null) {
                            return child;
                          } else {
                            return Container(
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  width: 1,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    value: e.cumulativeBytesLoaded / (e.expectedTotalBytes ?? 1),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.save,
                        size: 16,
                      ),
                      label: const Text("Download"),
                      onPressed: () async {
                        var filePath = await FilePicker.platform.saveFile();

                        if (filePath != null) {
                          await _model.downloadImage(filePath, _model.giph!.url);

                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Row(
                                children: [
                                  Icon(
                                    Icons.download_done,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text("Image Downloaded"),
                                ],
                              ),
                            ));
                          }
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // properties
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 200,
                      maxWidth: 500,
                    ),
                    child: Table(
                      columnWidths: const <int, TableColumnWidth>{
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        const TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "Giph Information",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(""),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Title:"),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(context.select((GiphyDetailsPageModel model) => model.giph?.title ?? "")),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("ID:"),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(context.select((GiphyDetailsPageModel model) => model.giph?.id ?? "")),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Dimensions:"),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(context.select((GiphyDetailsPageModel model) => "${model.giph?.width} x ${model.giph?.height}")),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Size:"),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(context.select((GiphyDetailsPageModel model) => model.formatBytes(model.giph?.size))),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Created:"),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(context.select((GiphyDetailsPageModel model) => model.giph?.created ?? "")),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("URL:"),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: RichText(
                                  text: TextSpan(
                                      text: context.select((GiphyDetailsPageModel model) => model.giph?.url ?? ""),
                                      style: const TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()..onTap = () async => await launchUrl(Uri.parse(_model.giph!.url))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
