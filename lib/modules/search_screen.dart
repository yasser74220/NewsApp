import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';

import '../shared/cubit/states.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return BlocConsumer<AppCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defualtInput(
                  controller: searchController ,
                  inputType: TextInputType.text,
                  change: (value) {
                    AppCubit.get(context).getSearch(value);
                  },
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  text: 'Search',
                  iconPre: Icons.search,
                ),
              ),
              Expanded(
                child: articleBuilder(
                  list,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
