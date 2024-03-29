import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../shared/components/components.dart';

class BusniessScreen extends StatelessWidget {
  const BusniessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = AppCubit.get(context).business;

        return articleBuilder(list,context);
      },
    );
  }
}
