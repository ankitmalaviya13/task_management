import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/providers/auth_provider.dart';
import 'package:task_management/providers/splash_provider.dart';
import 'package:task_management/screens/bottomBar_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey,
        ),
        themeMode: ThemeMode.system,
        // theme: lightTheme,
        // darkTheme: darkTheme,
        // themeMode: ThemeMode.system,
        // // theme: ThemeData(
        // //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // //   useMaterial3: true,
        // // ),
        home: const BottomBarScreen(),
      ),
    );
  }
}
