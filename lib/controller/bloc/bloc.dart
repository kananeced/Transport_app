import 'package:bloc/bloc.dart';

import 'package:transport_app/controller/bloc/event.dart';
import 'package:transport_app/controller/bloc/state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(INITIALSTATE()) {
    on<CHANGEMENU>((event, emit) {
      emit(SUCCESS(value: event.index));
    });
  }
}
