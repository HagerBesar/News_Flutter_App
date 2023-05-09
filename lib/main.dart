// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/layout_screen.dart';
import 'package:news_app/shared/cubit/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/styles.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getMode(key: 'isDark');

  DioHelper.init();

  BlocOverrides.runZoned(
        () {
      runApp(MyApp(isDark??false));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)
      => NewsCubit()
        ..changeMode(fromShared: isDark)
        ..getBusiness()
        ..getScience()
        ..getSports()
        ,
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {} ,
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return MaterialApp(
            title: 'News APP',
            debugShowCheckedModeBanner: false,
            theme: lightMood,
            darkTheme: darkMood,
            themeMode: cubit.isDark? ThemeMode.dark : ThemeMode.light,
            home: LayoutScreen(),
          );
        }
      ),

    );
  }
}

