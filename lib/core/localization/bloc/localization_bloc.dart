import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'localization_event.dart';
import 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationState()) {
    on<LocaleChanged>(_onLocaleChanged);
    on<InitializeLocale>(_onInitializeLocale);

    // Initialize locale from saved preferences
    add(InitializeLocale());
  }

  Future<void> _onLocaleChanged(
    LocaleChanged event,
    Emitter<LocalizationState> emit,
  ) async {
    // Save the selected locale to preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_locale', event.locale.languageCode);

    emit(state.copyWith(locale: event.locale));
  }

  Future<void> _onInitializeLocale(
    InitializeLocale event,
    Emitter<LocalizationState> emit,
  ) async {
    // Load saved locale if available
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString('app_locale');

    if (savedLocale != null) {
      emit(state.copyWith(locale: Locale(savedLocale)));
    }
  }

  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('ne'), // Nepali
  ];

  Locale toggleLocale() {
    final currentLocale = state.locale;
    return currentLocale.languageCode == 'en'
        ? const Locale('ne')
        : const Locale('en');
  }
}
