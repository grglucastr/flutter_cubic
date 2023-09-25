import 'package:bloc/bloc.dart';
import 'package:flutter_cubic/cubic/app_cubit_state.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits(): super(InitialState()){
    emit(WelcomeState());
  }
}