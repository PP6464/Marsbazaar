import 'package:flutter/material.dart';
import 'package:marsbazaar/util/colours.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      supportedLocales: const [
        Locale("en"),
      ],
      theme: ThemeData(
        primaryColor: theme.teal.colour,
        fontFamily: "Maven Pro"
      ),
      home: const LoginOnboard(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
