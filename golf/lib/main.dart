import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:golf/authentication/Splashscreen.dart';
import 'package:golf/authentication/login.dart';
import 'package:golf/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp()); //
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          //ChangeNotifierProvider(create: (context) => googlesignin()),
          ChangeNotifierProvider(
              create: (context) => NavigationProvider()), //for navigationBar
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: LoginPage(),
        ),
      );
}
