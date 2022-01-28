import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticaleScreen extends StatelessWidget {
  final String url;
  const ArticaleScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
