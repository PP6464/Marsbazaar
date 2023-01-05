import 'package:flutter/material.dart';
import 'package:marsbazaar/provider/app_state.dart';
import 'package:provider/provider.dart';

AppState defaultProvider(BuildContext context, [bool listen = false]) => Provider.of<AppState>(context, listen: listen);
String defaultUserName = "Dhruv";
String defaultUserEmail = "dhruvgohel@marsbazaar.com";
String defaultUserPhotoURL = "https://eu.ui-avatars.com/api/?background=18AD84&size=128&name=Dhruv+Gohel&color=FFFFFF&rounded=true&bold=true";
bool defaultUserAdmin = true;