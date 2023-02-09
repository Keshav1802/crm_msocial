import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late InAppWebViewController _webViewController;
  final url = "http://leads.mothering.in";
  double progress = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          mediaPlaybackRequiresUserGesture: false, javaScriptEnabled: true,
          useOnDownloadStart: true,),
      ios: IOSInAppWebViewOptions(
          allowsInlineMediaPlayback: true,
          allowsAirPlayForMediaPlayback: true));

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            elevation: 24,
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: const Text(
              'Are you sure?',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            content: const Text('Do you want to exit the App',
                style: TextStyle(fontWeight: FontWeight.w400)),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No',
                    style: TextStyle(fontWeight: FontWeight.w400)),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Yes',
                    style: TextStyle(fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
        child:
        Scaffold(
            // appBar: AppBar(
            //   toolbarHeight: 0,
            //   backgroundColor: Colors.white,
            //     systemOverlayStyle: SystemUiOverlayStyle.light
            // ),
            body: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: SafeArea(
                  child: Column(children: <Widget>[
                Expanded(
                    child: Stack(children: [
                  InAppWebView(
                    // key: webViewKey,
                    initialUrlRequest: URLRequest(url: Uri.parse(url)),
                    initialOptions: options,
                    androidOnPermissionRequest:
                        (InAppWebViewController controller, String origin,
                            List<String> resources) async {
                      return PermissionRequestResponse(
                          resources: resources,
                          action: PermissionRequestResponseAction.GRANT);
                    },
                    onWebViewCreated: (controller) async {
                      _webViewController = controller;
                    },
                    onProgressChanged: (InAppWebViewController controller, int progress) {
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                  ),
                      Align(
                          alignment: Alignment.center,
                          child: _buildProgressBar()
                      ),
                ]))
              ])),
            )),
    );
  }
  Widget _buildProgressBar() {
    if (progress != 1.0) {
      return CircularProgressIndicator(
        color: Color.fromRGBO(78, 94, 106,10),
      );
// You can use LinearProgressIndicator also
//      return LinearProgressIndicator(
//        value: progress,
//        valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
//        backgroundColor: Colors.blue,
//      );
    }
    return Container();
  }
}
