// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marsbazaar/provider/default_provider.dart';
import 'package:marsbazaar/util/elements.dart';
import 'package:marsbazaar/util/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'attendance.dart';
import 'internal_lead.dart';

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
      body: SingleChildScrollView(
        child: Stack(
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
                        elevation: 0.0,
                        backgroundColor: theme.teal.colour,
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
                              style: TextStyle(
                                color: theme.white.colour,
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
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.darkBlue.colour,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 356.0,
                  width: MediaQuery.of(context).size.width,
                ),
                loginOverlayBR,
              ],
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 85.0),
                  logoExpanded,
                  const SizedBox(height: 50.0),
                  Text(
                    AppLocalizations.of(context)!.welcomeTo,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: theme.white.colour,
                    ),
                  ),
                  Text(
                    "MarsBazaar.com",
                    style: TextStyle(
                      color: theme.white.colour,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key: loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.email,
                            style: TextStyle(
                              color: theme.white.colour,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          SizedBox(
                            height: 56.0,
                            child: Stack(
                              children: [
                                Container(
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    color: theme.white.colour,
                                    borderRadius: BorderRadius.circular(7.5),
                                  ),
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.5),
                                    ),
                                    hintText: AppLocalizations.of(context)!.exampleEmail,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 38.0),
                          Text(
                            AppLocalizations.of(context)!.password,
                            style: TextStyle(
                              color: theme.white.colour,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          SizedBox(
                            height: 56.0,
                            child: Stack(
                              children: [
                                Container(
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    color: theme.white.colour,
                                    borderRadius: BorderRadius.circular(7.5),
                                  ),
                                ),
                                TextFormField(
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.5),
                                    ),
                                    hintText: AppLocalizations.of(context)!.enterPassword,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 13.0),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              AppLocalizations.of(context)!.forgotPassword,
                              style: TextStyle(
                                color: theme.white.colour,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 50.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: theme.teal.colour,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                            onPressed: () async {
                              // TODO: Login user
                              // Stub: Push to welcome user page
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const WelcomeUserPage(),
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
                                    style: TextStyle(
                                      color: theme.white.colour,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                              ],
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
  bool setAsDefaultOption = false;

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  void initPlatformState() async {
    if (defaultProvider(context).redirectToDefaultOption) {
      defaultProvider(context).updateRedirectToDefaultOption();
      SharedPreferences sp = await SharedPreferences.getInstance();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => sp.getString("defaultLoginOption") == "internalLead" ? const InternalLeadPage() : const AttendancePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.darkBlue.colour,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 356.0,
                  width: MediaQuery.of(context).size.width,
                ),
                loginOverlayBR,
              ],
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 100.0),
                  logoExpanded,
                  const SizedBox(height: 52.0),
                  FutureBuilder(
                    future: SharedPreferences.getInstance(),
                    builder: (BuildContext context, AsyncSnapshot<SharedPreferences> sp) {
                      if (sp.hasData) {
                        return Text(
                          AppLocalizations.of(context)!.helloDefaultUserName(sp.data!.getString("defaultUserName") ?? defaultUserName),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: theme.white.colour,
                          ),
                        );
                      } else if (sp.hasError) {
                        return errorText(context);
                      } else {
                        return loadingIndicator;
                      }
                    },
                  ),
                  Text(
                    AppLocalizations.of(context)!.welcomeToMarsBazaar,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: theme.white.colour,
                    ),
                  ),
                  const SizedBox(height: 52.0),
                  Text(
                    AppLocalizations.of(context)!.chooseAnyOne,
                    style: TextStyle(
                      color: theme.white.colour,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: theme.teal.colour,
                    ),
                    onPressed: () async {
                      // Store as default option if selected
                      if (setAsDefaultOption) {
                        SharedPreferences sp = await SharedPreferences.getInstance();
                        sp.setString("defaultLoginOption", "attendance");
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AttendancePage(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 80.0,
                      width: 300.0,
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            attendanceIcon,
                            const SizedBox(width: 16.0),
                            Text(
                              AppLocalizations.of(context)!.attendance,
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: theme.lightBlue.colour,
                    ),
                    onPressed: () async {
                      // Store as default option if selected
                      if (setAsDefaultOption) {
                        SharedPreferences sp = await SharedPreferences.getInstance();
                        sp.setString("defaultLoginOption", "internalLead");
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const InternalLeadPage(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 80.0,
                      width: 300.0,
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            internalLeadIcon,
                            const SizedBox(width: 16.0),
                            Text(
                              AppLocalizations.of(context)!.internalLead,
                              style: TextStyle(
                                color: theme.darkBlue.colour,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: setAsDefaultOption,
                        onChanged: (bool? value) {
                          if (value == null) return;
                          setState(() {
                            setAsDefaultOption = value;
                          });
                        },
                        activeColor: theme.teal.colour,
                        side: BorderSide(
                          color: theme.white.colour,
                          width: 2.0,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.setAsDefaultOption,
                        style: TextStyle(
                          color: theme.white.colour,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
