import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marsbazaar/util/theme.dart';

Widget logoExpanded = Image.asset("assets/logo_expanded.png");
Widget logoExpandedBig = Image.asset("assets/logo_expanded_big.png");
Widget loginOverlayBR = Image.asset("assets/login_overlay_br.png");
Widget loginOverlayTR = Image.asset("assets/login_overlay_tr.png");
Widget loginOnboard = Image.asset("assets/login_onboard.png");
const Widget blank = SizedBox(width: 0.0, height: 0.0);
Text errorText(BuildContext context) => Text(AppLocalizations.of(context)!.error);
Widget loadingIndicator = CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(theme.teal.colour), backgroundColor: Colors.teal[700]!,);
Widget internalLeadIcon = Image.asset("assets/internal_lead_icon.png");
Widget attendanceIcon = Image.asset("assets/attendance_icon.png");
Widget handClickIcon = Image.asset("assets/hand_click_icon.png");
Widget clockInIcon = Image.asset("assets/clock_in_icon.png");
Widget clockOutIcon = Image.asset("assets/clock_out_icon.png");
Widget clockHoursIcon = Image.asset("assets/clock_hours_icon.png");