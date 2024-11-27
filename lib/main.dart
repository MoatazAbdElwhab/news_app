import 'package:flutter/material.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/settings/view_model/settings_view_model.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/home/view/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NewsViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => SettingsViewModel(),
      ),
    ],
    child: const NewsApp(),
  ));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsViewModel settingsViewModel =
        Provider.of<SettingsViewModel>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsViewModel.languageCode),
    );
  }
}
