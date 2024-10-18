import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  bool isEnable;
  double slider;

  SwitchState({this.isEnable = false, this.slider = 0.1});

  SwitchState copyWith({bool? isEnable, double? slider}) {
    return SwitchState(
        isEnable: isEnable ?? this.isEnable, slider: slider ?? this.slider);
  }

  @override
  List<Object> get props => [isEnable, slider];
}
