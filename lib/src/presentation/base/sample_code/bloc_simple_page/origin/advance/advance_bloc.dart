import 'advance_bloc_event.dart';
import 'advance_bloc_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AdvanceBloc extends Bloc<AdvanceBlocEvent, AdvanceBlocState> {
  int counter = 0;

  final blocType = BlocType.builder;

  @factoryMethod
  AdvanceBloc() : super(AdvanceBlocState().init()) {
    on<InitEvent>(init);
    on<IncreaseEvent>(increase);
  }

  void init(InitEvent event, Emitter<AdvanceBlocState> emit) async {
    emit(state.clone());
  }

  void increase(IncreaseEvent event, Emitter<AdvanceBlocState> emit) async {
    counter++;

    emit(state.clone());
  }
}

enum BlocType {builder, selector, listener, consumer}