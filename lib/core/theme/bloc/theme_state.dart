import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ThemeType { light, dark, system }

class ThemeState extends Equatable {
  final ThemeType themeType;

  const ThemeState({this.themeType = ThemeType.system});

  bool get isDarkMode => themeType == ThemeType.dark;

  ThemeMode get themeMode {
    switch (themeType) {
      case ThemeType.light:
        return ThemeMode.light;
      case ThemeType.dark:
        return ThemeMode.dark;
      case ThemeType.system:
        return ThemeMode.system;
    }
  }

  @override
  List<Object?> get props => [themeType];

  ThemeState copyWith({ThemeType? themeType}) {
    return ThemeState(themeType: themeType ?? this.themeType);
  }
}
