
import 'package:crm_msocial/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize(
  //     debug: true // optional: set false to disable printing logs to console
  // );
  await Permission.storage.request();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffEEF1F9)),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "Mothering Leads",
    );
  }
}
