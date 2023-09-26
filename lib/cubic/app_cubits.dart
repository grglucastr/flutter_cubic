import 'package:bloc/bloc.dart';
import 'package:flutter_cubic/cubic/app_cubit_state.dart';
import 'package:flutter_cubic/model/data_model.dart';
import 'package:flutter_cubic/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{

  final DataServices dataServices;
  late final places;

  AppCubits(this.dataServices): super(InitialState()){
    emit(WelcomeState());
  }

  void getData() async {
    try{
      emit(LoadingState());
      places = await dataServices.getInfo();

      emit(LoadedState(places));
    }catch(e){
      print(e);
    }
  }


  void detailPage(DataModel dataModel){
    emit(DetailState(dataModel));
  }



}