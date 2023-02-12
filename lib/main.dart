
import 'package:crm_msocial/HomePage.dart';
import 'package:crm_msocial/provider/navigationBarProvider.dart';
import 'package:crm_msocial/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize(
  //     debug: true // optional: set false to disable printing logs to console
  // );
  int counter = 0;
  SharedPreferences.getInstance().then((prefs) {
    prefs.setInt('counter', counter);
    var isDarkTheme =
    prefs.getBool("isDarkTheme") ?? ThemeMode.system == ThemeMode.dark
        ? true
        : false;
    return runApp(
      ChangeNotifierProvider<ThemeProvider>(
        child: App(),
        create: (BuildContext context) {
          return ThemeProvider(isDarkTheme);
        },
      ),
    );
  });
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      /* start--commnet  below 2 lines to enable landscape mode */
      DeviceOrientation
          .landscapeLeft,
      DeviceOrientation
          .landscapeRight
      /*end */
    ]);
     return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationBarProvider>(
            create: (_) => NavigationBarProvider())
      ],
      child: Consumer<ThemeProvider>(builder: (context, value, child) {
        return  MaterialApp(
          theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffEEF1F9)),
          debugShowCheckedModeBanner: false,
          home: SafeArea(child: HomePage()),
          title: "Mothering Leads",
        );
      }),
    );
      MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffEEF1F9)),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "Mothering Leads",
    );
  }
}
