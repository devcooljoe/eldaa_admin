import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        if (contraints.maxWidth < 1440) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.black,
              body: const Center(
                child: Text(
                  'PLEASE USE A DESKTOP OR LAPTOP SCREEN!',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          );
        }
        return ScreenUtilInit(
          designSize: const Size(1440, 900),
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: 'ELDAA ADMIN',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Urbanist',
                primaryColor: Colors.black,
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.blueGrey,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
              ),
              routerConfig: router,
            );
          },
        );
      },
    );
  }
}
