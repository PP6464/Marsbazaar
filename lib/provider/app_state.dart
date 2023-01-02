import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool redirectToDefaultOption = true;
  bool clockedIn = false;
  DateTime? clockIn;
  DateTime? clockOut;

  void updateRedirectToDefaultOption() => redirectToDefaultOption = !redirectToDefaultOption;
  void updateClockedIn() => clockedIn = !clockedIn;
  void updateClockIn(DateTime? newClockIn) => clockIn = newClockIn;
  void updateClockOut(DateTime? newClockOut) => clockOut = newClockOut;
}