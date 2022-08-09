import 'package:flutter/widgets.dart';

class DemoLocalizations {
  DemoLocalizations(this._locale);

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  static const List<Locale> supportedLanguages = [
    Locale('en', ''),
    Locale('ru', ''),
  ];

  Locale _locale;

  set locale(Locale locale) {
    if (isSupported(locale)) {
      _locale = locale;
    } else {
      _locale = const Locale.fromSubtags(languageCode: 'en');
    }
  }

  Locale get locale => _locale;

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'title': 'Attractions',
      'name': 'Bolshoi Theatre',
      'description' : "Lavish neoclassical repertory theater housing "
      "Russia's world-famous Bolshoi Ballet & Bolshoi Opera.",
      'action_next' : 'Next',
      'action_back' : 'Previous',
    },
    'ru': {
      'title': 'Достопримечательности',
      'name': 'Большой театр',
      'description' : 'Один из крупнейших в России и один из самых '
      'значительных в мире театров оперы и балета',
      'action_next' : 'Вперёд',
      'action_back' : 'Назад',
    },    
  };

  String get title {
    return _localizedValues[locale.languageCode]!['title']!;
  }

  String get(String key) {
    return _localizedValues[locale.languageCode]![key]!;
  }

  static bool isSupported(Locale locale) => supportedLanguages.contains(locale);
}
