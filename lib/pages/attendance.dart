import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marsbazaar/util/elements.dart';
import 'package:marsbazaar/util/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/default_provider.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  late Timer timer;
  String currentTime = "";
  String currentDate = "";
  String bottomText = "";
  int pageIndex = 0;
  bool editingProfile = false;

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          updateCurrentTime();
          updateCurrentDate();
        });
      },
    );
  }

  void updateCurrentTime() {
    currentTime = DateTime.now().hour.toString().padLeft(2, "0") + ":" + DateTime.now().minute.toString().padLeft(2, "0");
  }

  void updateCurrentDate() {
    currentDate = getWeekdayString(DateTime.now().weekday) + " " + DateTime.now().day.toString() + " " + getMonthString(DateTime.now().month);
  }

  String getWeekdayString(int weekDay) {
    switch (weekDay) {
      case 1:
        return AppLocalizations.of(context)!.mon;
      case 2:
        return AppLocalizations.of(context)!.tue;
      case 3:
        return AppLocalizations.of(context)!.wed;
      case 4:
        return AppLocalizations.of(context)!.thu;
      case 5:
        return AppLocalizations.of(context)!.fri;
      case 6:
        return AppLocalizations.of(context)!.sat;
      case 7:
        return AppLocalizations.of(context)!.sun;
      default:
        return "";
    }
  }

  String getMonthString(int month) {
    switch (month) {
      case 1:
        return AppLocalizations.of(context)!.jan;
      case 2:
        return AppLocalizations.of(context)!.feb;
      case 3:
        return AppLocalizations.of(context)!.mar;
      case 4:
        return AppLocalizations.of(context)!.apr;
      case 5:
        return AppLocalizations.of(context)!.may;
      case 6:
        return AppLocalizations.of(context)!.jun;
      case 7:
        return AppLocalizations.of(context)!.jul;
      case 8:
        return AppLocalizations.of(context)!.aug;
      case 9:
        return AppLocalizations.of(context)!.sep;
      case 10:
        return AppLocalizations.of(context)!.oct;
      case 11:
        return AppLocalizations.of(context)!.nov;
      case 12:
        return AppLocalizations.of(context)!.dec;
      default:
        return "";
    }
  }

  String getCurrentTime() => currentTime;

  String getCurrentDate() => currentDate;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: theme.black.colour,
          ),
          backgroundColor: theme.white.colour,
          title: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FutureBuilder(
                  future: SharedPreferences.getInstance(),
                  builder: (BuildContext context, AsyncSnapshot<SharedPreferences> sp) {
                    if (sp.hasData) {
                      return Text(
                        AppLocalizations.of(context)!.helloDefaultUserName(sp.data!.getString("defaultUserName") ?? defaultUserName),
                        style: TextStyle(
                          color: theme.black.colour,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (sp.hasError) {
                      return errorText(context);
                    } else {
                      return loadingIndicator;
                    }
                  },
                ),
                const SizedBox(width: 35.0),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 8.0),
            Text(
              AppLocalizations.of(context)!.startMarkingAttendance,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 42.0),
            Text(
              getCurrentTime(),
              style: const TextStyle(
                fontSize: 72.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              getCurrentDate(),
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 42.0),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 240.0,
                  width: 240.0,
                  decoration: BoxDecoration(
                    color: theme.white.colour,
                    shape: BoxShape.circle,
                    border: const Border(
                      left: BorderSide(
                        color: Color(0x19E4E7FF),
                      ),
                      right: BorderSide(
                        color: Color(0x19E4E7FF),
                      ),
                      top: BorderSide(
                        color: Color(0x19E4E7FF),
                      ),
                      bottom: BorderSide(
                        color: Color(0x19E4E7FF),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 230.0,
                  width: 230.0,
                  decoration: BoxDecoration(
                    color: theme.white.colour,
                    shape: BoxShape.circle,
                    border: const Border(
                      left: BorderSide(
                        color: Color(0x40E4E7FF),
                      ),
                      right: BorderSide(
                        color: Color(0x40E4E7FF),
                      ),
                      top: BorderSide(
                        color: Color(0x40E4E7FF),
                      ),
                      bottom: BorderSide(
                        color: Color(0x40E4E7FF),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 220.0,
                  width: 220.0,
                  decoration: BoxDecoration(
                    color: theme.white.colour,
                    shape: BoxShape.circle,
                    border: const Border(
                      left: BorderSide(
                        color: Color(0xC0E4E7FF),
                      ),
                      right: BorderSide(
                        color: Color(0xC0E4E7FF),
                      ),
                      top: BorderSide(
                        color: Color(0xC0E4E7FF),
                      ),
                      bottom: BorderSide(
                        color: Color(0xC0E4E7FF),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 210.0,
                  width: 210.0,
                  decoration: BoxDecoration(
                    color: theme.white.colour,
                    shape: BoxShape.circle,
                    border: const Border(
                      left: BorderSide(
                        color: Color(0xFFE4E7FF),
                      ),
                      right: BorderSide(
                        color: Color(0xFFE4E7FF),
                      ),
                      top: BorderSide(
                        color: Color(0xFFE4E7FF),
                      ),
                      bottom: BorderSide(
                        color: Color(0xFFE4E7FF),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 205.0,
                  width: 205.0,
                  decoration: BoxDecoration(
                    color: theme.white.colour,
                    shape: BoxShape.circle,
                    border: const Border(
                      left: BorderSide(
                        color: Color(0xFFE4E7FF),
                      ),
                      right: BorderSide(
                        color: Color(0xFFE4E7FF),
                      ),
                      top: BorderSide(
                        color: Color(0xFFE4E7FF),
                      ),
                      bottom: BorderSide(
                        color: Color(0xFFE4E7FF),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: defaultProvider(context).clockedIn ? theme.red.colour : theme.teal.colour,
                    shape: const CircleBorder(),
                    splashFactory: InkRipple.splashFactory,
                  ),
                  onPressed: () async {
                    // TODO: Register attendance via API
                    bool clockedIn = defaultProvider(context).clockedIn;
                    defaultProvider(context).updateClockedIn();
                    if (clockedIn) {
                      defaultProvider(context).updateClockOut(DateTime.now());
                      setState(() {
                        bottomText = AppLocalizations.of(context)!.successfullyClockedOut;
                      });
                    } else {
                      defaultProvider(context).updateClockIn(DateTime.now());
                      defaultProvider(context).updateClockOut(null);
                      setState(() {
                        bottomText = AppLocalizations.of(context)!.successfullyClockedIn;
                      });
                    }
                  },
                  child: SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        handClickIcon,
                        const SizedBox(height: 16.0),
                        Text(
                          defaultProvider(context).clockedIn ? AppLocalizations.of(context)!.clockOut.toUpperCase() : AppLocalizations.of(context)!.clockIn.toUpperCase(),
                          style: TextStyle(
                            color: theme.white.colour,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              bottomText,
              style: TextStyle(
                fontSize: 12.0,
                color: defaultProvider(context).clockedIn ? theme.teal.colour : theme.red.colour,
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    clockInIcon,
                    const SizedBox(height: 8.0),
                    Text(
                      defaultProvider(context).clockIn == null ? "--:--" : defaultProvider(context).clockIn!.hour.toString().padLeft(2, "0") + ":" + defaultProvider(context).clockIn!.minute.toString().padLeft(2, "0"),
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      AppLocalizations.of(context)!.clockIn,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    clockOutIcon,
                    const SizedBox(height: 8.0),
                    Text(
                      defaultProvider(context).clockOut == null ? "--:--" : defaultProvider(context).clockIn!.hour.toString().padLeft(2, "0") + ":" + defaultProvider(context).clockOut!.minute.toString().padLeft(2, "0"),
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      AppLocalizations.of(context)!.clockOut,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    clockHoursIcon,
                    const SizedBox(height: 8.0),
                    Text(
                      (defaultProvider(context).clockIn == null || defaultProvider(context).clockOut == null) ? "--h --m" : (defaultProvider(context).clockOut!.difference(defaultProvider(context).clockIn!)).inHours.toString().padLeft(2, "0") + "h " + ((defaultProvider(context).clockOut!.difference(defaultProvider(context).clockIn!)).inMinutes % 60).toString().padLeft(2, "0") + "m",
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      AppLocalizations.of(context)!.clockHours,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      Text(AppLocalizations.of(context)!.records),
      Text(AppLocalizations.of(context)!.timeSheet),
      Scaffold(
        appBar: AppBar(
          title: Text(
            editingProfile ? AppLocalizations.of(context)!.editProfile : AppLocalizations.of(context)!.viewProfile,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 1.0,
                color: const Color(0xFF000000),
              ),
              const SizedBox(height: 56.0),
              FutureBuilder(
                future: SharedPreferences.getInstance(),
                builder: (BuildContext context, AsyncSnapshot<SharedPreferences> sp) {
                  if (sp.hasData) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 65.0,
                          backgroundImage: NetworkImage(sp.data!.getString("defaultUserPhotoURL") ?? defaultUserPhotoURL),
                        ),
                        const SizedBox(width: 24.0),
                      ],
                    );
                  } else if (sp.hasError) {
                    return errorText(context);
                  } else {
                    return loadingIndicator;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1.0,
            decoration: const BoxDecoration(
              color: Color(0x40000000),
            ),
          ),
          BottomNavigationBar(
            currentIndex: pageIndex,
            backgroundColor: theme.white.colour,
            onTap: (int newIndex) => setState(() {
              pageIndex = newIndex;
            }),
            selectedItemColor: theme.teal.colour,
            unselectedItemColor: const Color(0xFF9C9C9C),
            selectedLabelStyle: const TextStyle(fontSize: 10.0),
            unselectedLabelStyle: const TextStyle(fontSize: 10.0),
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.compare_arrows),
                label: AppLocalizations.of(context)!.inOut,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.monitor),
                label: AppLocalizations.of(context)!.records,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.assignment),
                label: AppLocalizations.of(context)!.timeSheet,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: AppLocalizations.of(context)!.profile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
