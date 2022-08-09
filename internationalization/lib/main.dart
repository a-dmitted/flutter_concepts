import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internationalization/home_page.dart';
import 'package:internationalization/localization/localizations.dart';
import 'package:internationalization/localization/localizations_delegate.dart';

class InternatiolizationApp extends StatelessWidget {
  const InternatiolizationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => DemoLocalizations.of(context).title,
      localizationsDelegates: const [
        DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: DemoLocalizations.supportedLanguages,
      home: const InternationalizationHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const InternatiolizationApp());
}
