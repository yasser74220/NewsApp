import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/shared/dio.dart';

import '../../modules/science_screen.dart';
import '../../modules/settings_screen.dart';
import '../../modules/sports_screen.dart';

class AppCubit extends Cubit<NewsStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];
  List<Widget> screens = [
    BusniessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  void changeNavBar(value) {
    currentIndex = value;
    emit(AppBottomNavBarState());
  }
  List<dynamic> business =[];
  void getBusniess() {
    dioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
       business = value?.data['articles'];
       emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      emit(NewsGetBusinessErrorState(error.toString()));

    });
  }
  List<dynamic> Sports =[];
  void getSports() {
    dioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
        }).then((value) {
      Sports = value?.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      emit(NewsGetSportsErrorState(error.toString()));

    });
  }
  List <dynamic> Science = [];
  void getScience() {
    dioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
        }).then((value) {
      Science = value?.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      emit(NewsGetScienceErrorState(error.toString()));

    });
  }
}
