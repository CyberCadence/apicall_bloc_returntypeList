part of 'model_bloc.dart';

@immutable
class ModelState {}

class ModelInitialstate extends ModelState {}

class ModelLoadingstate extends ModelState {}

class LoadedState extends ModelState {
  List <Modelclass> modelclass;

  LoadedState({required this.modelclass});
}

class Errorstate extends ModelState {}
