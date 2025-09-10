import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/bloc/theme_bloc.dart';
import '../../../../core/theme/bloc/theme_event.dart';
import '../../../../core/theme/bloc/theme_state.dart';
import '../../../../core/localization/bloc/localization_bloc.dart';
import '../../../../core/localization/bloc/localization_event.dart';
import '../../../../core/localization/bloc/localization_state.dart';
import '../../../../generated/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.signIn),
        actions: [
          // Theme toggle
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: () {
                  context.read<ThemeBloc>().add(
                    ThemeChanged(
                      state.isDarkMode ? ThemeType.light : ThemeType.dark,
                    ),
                  );
                },
              );
            },
          ),
          // Language toggle
          BlocBuilder<LocalizationBloc, LocalizationState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.language),
                onPressed: () {
                  final newLocale = context
                      .read<LocalizationBloc>()
                      .toggleLocale();
                  context.read<LocalizationBloc>().add(
                    LocaleChanged(newLocale),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.signIn,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Login screen placeholder',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
