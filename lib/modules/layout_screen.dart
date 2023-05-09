// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/shared/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class LayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            // leading: Icon(cubit.appBarIcons[cubit.currentIndex]),
            title:Text('News App'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: ()
                {
                  navigateTo(context, SearchScreen(),);
                },
              ),
              IconButton(

                icon: Icon(
                  Icons.brightness_6_outlined ,
                  // color:Colors.black87 ,
                ),
                onPressed: (){
                cubit.changeMode();
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business' ),
              BottomNavigationBarItem(icon: Icon(Icons.science_sharp), label: 'Science' ),
              BottomNavigationBarItem(icon: Icon(Icons.sports_baseball), label: 'Sports' ),
            ],
            currentIndex:cubit.currentIndex,
            onTap: (index){
              cubit.changeNavBarScreen(index);
            }

          ),
          body: cubit.navBarScreens[cubit.currentIndex],


        );
      }
    );
  }
}
