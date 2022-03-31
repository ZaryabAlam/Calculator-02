import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenUtilInit(
          designSize: Size(360, 740),
          builder: () => MaterialApp(
                debugShowCheckedModeBanner: true,
                home: Scaffold(
                  body: Home(),
                ),
              ));
    });
  }
}
