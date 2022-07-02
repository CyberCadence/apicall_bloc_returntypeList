import 'package:apicall/Model/model/model.dart';
import 'package:apicall/network/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'model_event.dart';
part 'model_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
  final Repo repo;
  ModelBloc({required this.repo}) : super(ModelInitialstate()) {
    on<ModelEvent>((event, emit) async {
      if (event is Loadevent) {
        emit(ModelLoadingstate());

        List<Modelclass>? modelclass = await repo.getdata();
        if (modelclass == null) {
          emit(Errorstate());
        } else {
          emit(LoadedState(modelclass: modelclass));
        }
      }
    });
  }
}
