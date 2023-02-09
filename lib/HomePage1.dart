// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
//
// void main() => runApp(MaterialApp(home: MyApp()));
//
// class MyApp extends StatelessWidget {
//
//   static Future<String> get _url async {
//     await Future.delayed(Duration(seconds: 1));
//     return 'https://flutter.dev/';
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: Center(
//       child:FutureBuilder(
//           future: _url,
//           builder: (BuildContext context, AsyncSnapshot snapshot) => snapshot.hasData
//               ? WebViewWidget(url: snapshot.data,)
//               : CircularProgressIndicator()),
//     ),);
// }
//
// class WebViewWidget extends StatefulWidget {
//   final String url;
//   WebViewWidget({required this.url});
//
//   @override
//   _WebViewWidget createState() => _WebViewWidget();
// }
//
// class _WebViewWidget extends State<WebViewWidget> {
//   WebView _webView;
//   @override
//   void initState() {
//     super.initState();
//     _webView = WebView(
//       initialUrl: widget.url,
//       javascriptMode: JavascriptMode.unrestricted,
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _webView = null;
//   }
//
//   @override
//   Widget build(BuildContext context) => _webView;
// }