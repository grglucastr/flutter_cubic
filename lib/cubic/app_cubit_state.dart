import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];

}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];

}

class HomeState extends CubitStates{
  @override
  List<Object> get props => [];
}

class DetailState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates{
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates{

  late final places;
  LoadedState(this.places);

  @override
  List<Object?> get props => [places];
}