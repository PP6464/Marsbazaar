import 'package:flutter/material.dart';
import 'package:marsbazaar/util/theme.dart';
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
        focusColor: theme.teal.colour,
        colorScheme: ColorScheme(
          primary: theme.teal.colour,
          background: theme.white.colour,
          brightness: Brightness.light,
          error: theme.red.colour,
          onBackground: theme.black.colour,
          onPrimary: theme.white.colour,
          onError: theme.white.colour,
          secondary: theme.darkBlue.colour,
          onSecondary: theme.white.colour,
          surface: theme.white.colour,
          onSurface: theme.black.colour,
        ),
        fontFamily: "Maven Pro"
      ),
      home: const WelcomeUserPage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
