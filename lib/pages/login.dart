import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marsbazaar/util/colours.dart';
import 'package:marsbazaar/util/elements.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginOnboard extends StatefulWidget {
  const LoginOnboard({Key? key}) : super(key: key);

  @override
  State<LoginOnboard> createState() => _LoginOnboardState();
}

class _LoginOnboardState extends State<LoginOnboard> {
  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  void initPlatformState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("defaultUserName")?.isNotEmpty ?? false) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const WelcomeUserPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.darkBlue.colour,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: loginOverlayTR,
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 100.0),
                logoExpandedBig,
                const SizedBox(height: 38.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          AppLocalizations.of(context)!.loginOnboardNormal,
                          style: TextStyle(
                            fontSize: 24.0,
                            color: theme.white.colour,
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 20.0),
                              Container(
                                height: 9.0,
                                width: 17.0 * 11.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: theme.teal.colour,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              AppLocalizations.of(context)!.loginOnboardUnderline,
                              style: TextStyle(
                                fontSize: 24.0,
                                color: theme.white.colour,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 38.0),
                loginOnboard,
                const SizedBox(height: 38.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: theme.teal.colour,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.darkBlue.colour,
      body: Center(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.welcomeTo,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class WelcomeUserPage extends StatefulWidget {
  const WelcomeUserPage({Key? key}) : super(key: key);

  @override
  State<WelcomeUserPage> createState() => _WelcomeUserPageState();
}

class _WelcomeUserPageState extends State<WelcomeUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.darkBlue.colour,
      body: Center(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.welcomeToMarsBazaar,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

