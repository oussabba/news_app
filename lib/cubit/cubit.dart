import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/sciences_screen.dart';
import 'package:news_app/modules/settings_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    SciencesScreen(),
    // SettingsScreen()
  ];
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  bool isDark = false;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavBar());
  }

  void getBusiness() {
    emit(BusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "ma",
      "category": "business",
      "apiKey": "4e9632ec0d244ac99e3db92b7896cfb5"
    }).then((value) {
      business = value.data["articles"];
      print(business[0]['title']);
      emit(GetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(SportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "ma",
      "category": "sports",
      "apiKey": "4e9632ec0d244ac99e3db92b7896cfb5"
    }).then((value) {
      sports = value.data["articles"];
      print(sports[0]['title']);
      emit(GetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSportsErrorState(error.toString()));
    });
  }

  void getScience() {
    emit(ScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "ma",
      "category": "science",
      "apiKey": "4e9632ec0d244ac99e3db92b7896cfb5"
    }).then((value) {
      science = value.data["articles"];
      print(science[0]['title']);
      emit(GetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetScienceErrorState(error.toString()));
    });
  }

  void changeMode() {
    isDark = !isDark;
    emit(ChangeModeState());
  }
}
