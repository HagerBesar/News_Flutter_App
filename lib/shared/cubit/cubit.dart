// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<IconData> appBarIcons = [
    Icons.business,
    Icons.science_sharp,
    Icons.sports_baseball
  ];
  List<Widget> navBarScreens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen()
  ];

  void changeNavBarScreen(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  bool isDark = false;
  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putMode(key: 'isDark', value: isDark).then((value) {
        emit(ChangeModeState());
      });
    }
  }

  List<dynamic> business = [];
  void getBusiness() {
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '3d69cb865fd642bcbdca2c19a2d7a605'
    }).then((value) {
      business = value.data['articles'];
      emit(GetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '3d69cb865fd642bcbdca2c19a2d7a605'
    }).then((value) {
      science = value.data['articles'];
      emit(GetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetScienceErrorState(error.toString()));
    });
  }


  List<dynamic> sports = [];
  void getSports() {
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '3d69cb865fd642bcbdca2c19a2d7a605'
    }).then((value) {
      sports = value.data['articles'];
      emit(GetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSportsErrorState(error.toString()));
    });
  }


  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      path: 'v2/everything',
      query:
      {
        'q':value,
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

}
