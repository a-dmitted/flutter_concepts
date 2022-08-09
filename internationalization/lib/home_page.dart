import 'package:flutter/material.dart';
import 'package:internationalization/localization/localizations.dart';

class InternationalizationHome extends StatefulWidget {
  const InternationalizationHome({super.key});

  @override
  State<InternationalizationHome> createState() =>
      _InternationalizationHomeState();
}

class _InternationalizationHomeState extends State<InternationalizationHome> {
  @override
  Widget build(BuildContext context) {
    DemoLocalizations demoLocalizations =
        Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
        actions: [
          const Icon(Icons.file_upload),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: DropdownButton<Locale>(
                underline: const SizedBox(),
                focusColor: Colors.transparent,
                dropdownColor: Theme.of(context).primaryColor,
                value: demoLocalizations.locale,
                iconEnabledColor: Colors.white,
                items: DemoLocalizations.supportedLanguages
                    .map<DropdownMenuItem<Locale>>((Locale value) {
                  return DropdownMenuItem<Locale>(
                    value: value,
                    child: Text(
                      value.languageCode,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    demoLocalizations.locale = value!;
                  });
                },
              ),
            ),
          ),
          const Icon(Icons.more_vert),
        ],
      ),
      body: ListView(children: [
        Center(
          child: SizedBox(
            width: 500,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    leading: const Icon(Icons.arrow_drop_down_circle),
                    title: Text(DemoLocalizations.of(context).get('name')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      DemoLocalizations.of(context).get('description'),
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Perform some action
                        },
                        child: Text(
                            DemoLocalizations.of(context).get('action_next')),
                      ),
                      TextButton(
                        onPressed: () {
                          // Perform some action
                        },
                        child: Text(
                            DemoLocalizations.of(context).get('action_back')),
                      ),
                    ],
                  ),
                  Image.asset(
                    'bolshoi.png',
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
