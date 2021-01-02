import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/page/splash_page.dart';
import 'package:flutter_shop/provider/home_rovider.dart';
import 'package:flutter_shop/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // 第一种通过create参数创建provider，create必须是直接创建
      ChangeNotifierProvider(
          create: (ctx) => ThemeProvider(),
          child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: Size(1080, 720),
      child: MaterialApp(
        title: 'Flutter Shop',
        theme: ThemeData(
          primarySwatch: context.watch<ThemeProvider>().primarySwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashPage(),
      ),
    );
  }
}
