import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/settings/view_model/language.dart';
import 'package:news_app/settings/view_model/settings_view_model.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar')
  ];
  @override
  Widget build(BuildContext context) {
    SettingsViewModel settingsViewModel =
        Provider.of<SettingsViewModel>(context);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppTheme.primary,
              width: 1.5,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Language>(
              padding: EdgeInsets.symmetric(horizontal: 22),
              value: languages.firstWhere(
                (language) => language.code == settingsViewModel.languageCode,
              ),
              items: languages
                  .map(
                    (language) => DropdownMenuItem(
                      value: language,
                      child: Text(
                        language.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                settingsViewModel.changeLanguage(value!.code);
              },
              iconEnabledColor: AppTheme.primary,
              icon: Icon(Icons.arrow_drop_down_rounded),
              iconSize: 42,
              dropdownColor: AppTheme.white,
            ),
          ),
        ),
      ),
    );
  }
}
