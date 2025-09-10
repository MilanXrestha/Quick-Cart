import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object?> get props => [];
}

class LocaleChanged extends LocalizationEvent {
  final Locale locale;

  const LocaleChanged(this.locale);

  @override
  List<Object?> get props => [locale];
}

class InitializeLocale extends LocalizationEvent {}
