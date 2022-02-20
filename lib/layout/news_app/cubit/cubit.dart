import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news_app/cubit/states.dart';
import 'package:udemy_flutter/modules/news_app/business/business_screen.dart';
import 'package:udemy_flutter/modules/news_app/science/science_screen.dart';
import 'package:udemy_flutter/modules/news_app/sports/sports_screen.dart';

import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context)=> BlocProvider.of(context);

  List<BottomNavigationBarItem>bottomItems=
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];
  List<Widget>screen=
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<dynamic>business=[];
  List<dynamic>sports=[];
  List<dynamic>science=[];
  List<dynamic>search=[];

  int currentIndex=0;
  void changeBottomNavBar(int index)
  {
    currentIndex=index;
    emit(NewsBottomNavState());
  }

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'94669a8f971045c6bfffcbcab4f1221a',
      },
    ).then((value){
      // print(value.data['articles'][0]['title']);
      business=value.data['articles'];
      emit(NewsGetBusinessSuccessState());
      print(value.data['articles'][0]);
      }).catchError((error){
        emit(NewsGetBusinessErrorState(error));
      print("error is $error");
    });
  }

   void getSports()
  {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'sports',
        'apiKey':'94669a8f971045c6bfffcbcab4f1221a',
      },
    ).then((value){
      // print(value.data['articles'][0]['title']);
      sports=value.data['articles'];
      emit(NewsGetSportsSuccessState());
      print(value.data['articles'][0]);
      }).catchError((error){
        emit(NewsGetSportsErrorState(error));
      print("error is $error");
    });
  }

   void getScience()
  {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'science',
        'apiKey':'94669a8f971045c6bfffcbcab4f1221a',
      },
    ).then((value){
      // print(value.data['articles'][0]['title']);
      science=value.data['articles'];
      emit(NewsGetScienceSuccessState());
      print(value.data['articles'][0]);
      }).catchError((error){
        emit(NewsGetScienceErrorState(error));
      print("error is $error");
    });
  }
void getSearch(String value)
  {
    search=[];
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'94669a8f971045c6bfffcbcab4f1221a',
      },
    ).then((value){
      // print(value.data['articles'][0]['title']);
      search=value.data['articles'];
      emit(NewsGetSearchSuccessState());
      print(value.data['articles'][0]);
      }).catchError((error){
        emit(NewsGetSearchErrorState(error));
      print("error is $error");
    });
  }


}
