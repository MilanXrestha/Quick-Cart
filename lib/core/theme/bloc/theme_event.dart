import 'package:equatable/equatable.dart';
import 'theme_state.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final ThemeType themeType;

  const ThemeChanged(this.themeType);

  @override
  List<Object?> get props => [themeType];
}