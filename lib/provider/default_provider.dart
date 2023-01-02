import 'package:flutter/material.dart';
import 'package:marsbazaar/provider/app_state.dart';
import 'package:provider/provider.dart';

AppState defaultProvider(BuildContext context, [bool listen = false]) => Provider.of<AppState>(context, listen: listen);
String defaultUserName = "Dhruv";