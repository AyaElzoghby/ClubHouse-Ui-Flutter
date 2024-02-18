import 'package:club_house_ui/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "clubHouseUI",
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: Color.fromRGBO(255, 147, 64, 1)),
          scaffoldBackgroundColor: Color.fromRGBO(255, 223, 190, 1),
          primaryColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Color(0xFFFF9340),
          )),
      home: SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
