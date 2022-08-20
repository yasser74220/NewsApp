import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Layout/news_layout.dart';
import 'package:news_app/shared/cubit/observer.dart';
import 'package:news_app/shared/shared/dio.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  dioHelper.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type:BottomNavigationBarType.shifting ,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black,

        ),
      ),
      home: NewsLayout(),
    );
  }
}
