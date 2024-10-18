import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/switch/switch_event.dart';
import 'package:flutter_bloc_state_management/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotification>(enableOrDisableNotification);
    on<SliderEvent>(changeSliderValue);
  }

  void enableOrDisableNotification(
      EnableOrDisableNotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isEnable: !state.isEnable));
  }

  void changeSliderValue(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
