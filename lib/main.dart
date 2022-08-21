import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/Layout/news_layout.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/observer.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  dioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolen(key: 'isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
  var isDark;

  
   MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusniess()..getScience()..getSports()..darkMode(fromshared: isDark),



        child: BlocConsumer<AppCubit , NewsStates>(
          listener: (context, state) {
          },
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);

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
                  type: BottomNavigationBarType.shifting,

                   selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.black,
                ),
              ),
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: HexColor('333739'),
                  appBarTheme: AppBarTheme(
                    color: HexColor('333739'),
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(

                    type: BottomNavigationBarType.shifting,

                     selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.black,
                    backgroundColor:  HexColor('333739'),
                   ),
                  textTheme: TextTheme(
                    bodyText1: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )),
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: NewsLayout(),
            );
          },


      ),
    );
  }
}
