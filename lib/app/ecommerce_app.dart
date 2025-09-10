import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/localization/bloc/localization_bloc.dart';
import '../core/localization/bloc/localization_event.dart';
import '../core/localization/bloc/localization_state.dart';
import '../core/router/app_router.dart';
import '../core/theme/bloc/theme_bloc.dart';
import '../core/theme/bloc/theme_state.dart';
import '../generated/app_localizations.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Standard design size (iPhone X / 375x812)
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ThemeBloc()),
            BlocProvider(create: (_) => LocalizationBloc()),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return BlocBuilder<LocalizationBloc, LocalizationState>(
                builder: (context, localizationState) {
                  return MaterialApp.router(
                    title: 'QuickCart',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeBloc.lightTheme,
                    darkTheme: ThemeBloc.darkTheme,
                    themeMode: themeState.themeMode,
                    locale: localizationState.locale,

                    // Use GoRouter for navigation
                    routerConfig: AppRouter.router,

                    // Localization setup
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: LocalizationBloc.supportedLocales,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
