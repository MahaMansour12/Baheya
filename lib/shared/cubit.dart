import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/shared/states.dart';

import '../ui/home/account/account.dart';
import '../ui/home/awerence/awareness .dart';
import '../ui/home/event/event.dart';
import '../ui/home/support/support.dart';


class AppCubit extends Cubit<HomeStates>{
  AppCubit():super(AppInitialStates());
  static AppCubit get(context)=>BlocProvider.of(context);
 int currentIndex=0;
 List<Widget>buttomNavBar=[
   awareness(),
   event(),
   support(),
   Account()
 ];
  void ButtomNavBar (int index){
    currentIndex =index;
    emit(BottomNavigationBarChang());

  }


}