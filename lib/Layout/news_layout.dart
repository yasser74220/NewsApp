import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';

 import '../shared/cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              AppCubit.get(context).darkMode();
            },
            icon: Icon(
              Icons.dark_mode,
              size: 30,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
        items: AppCubit.get(context).items,
        currentIndex: AppCubit.get(context).currentIndex,
        onTap: (value) {
          AppCubit.get(context).changeNavBar(value);
        },

      ),
      body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],

    );
  }
}
