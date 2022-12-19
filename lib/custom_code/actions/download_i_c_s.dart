// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future downloadICS(
  String eventName,
  String description,
  String host,
  String location,
  DateTime startTime,
) async {
  String isoDateStart = startTime.toIso8601String();
  DateTime endTime = startTime.add(const Duration(hours: 2));
  String isoDateEnd = endTime.toIso8601String();

  String icsURL = "https://ics.agical.io/";
  String icsSubject = "?subject=${Uri.encodeComponent(eventName)}";
  String icsDescription = "&description=${Uri.encodeComponent(description)}";
  String icsOrganiser = "&organizer=${Uri.encodeComponent(host)}";
  String icsLocation = "&location=${Uri.encodeComponent(location)}";
  String iscDtstart = "&dtstart=${Uri.encodeComponent(isoDateStart)}";
  String iscDtend = "&dtend=${Uri.encodeComponent(isoDateEnd)}";

  return "$icsURL$icsSubject$icsDescription$icsOrganiser$icsLocation&reminder=45$iscDtstart$iscDtend";
}

///?
//subject=Meet%20{{company.Account%20Owner%20First%20Name}}&organizer=Sandy&reminder=45&location=Sandy%27s%20Desk&dts//tart=2021-11-27T15:00:00-04:00&dtend=2021-11-27T16:00:00-04:00&attach=http://www.example.com/
