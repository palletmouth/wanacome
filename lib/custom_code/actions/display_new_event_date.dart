// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DateTime> displayNewEventDate(
  DateTime eventDateTime,
) async {
  DateTime neweventdate = eventDateTime;

  switch (neweventdate.month) {
    case 1:
      FFAppState().NewEventDateMonth = 'Jan';
      break;
    case 2:
      FFAppState().NewEventDateMonth = 'Feb';
      break;
    case 3:
      FFAppState().NewEventDateMonth = 'Mar';
      break;
    case 4:
      FFAppState().NewEventDateMonth = 'Apr';
      break;
    case 5:
      FFAppState().NewEventDateMonth = 'May';
      break;
    case 6:
      FFAppState().NewEventDateMonth = 'Jun';
      break;
    case 7:
      FFAppState().NewEventDateMonth = 'Jul';
      break;
    case 8:
      FFAppState().NewEventDateMonth = 'Aug';
      break;
    case 9:
      FFAppState().NewEventDateMonth = 'Sep';
      break;
    case 10:
      FFAppState().NewEventDateMonth = 'Oct';
      break;
    case 11:
      FFAppState().NewEventDateMonth = 'Nov';
      break;
    case 12:
      FFAppState().NewEventDateMonth = 'Dec';
      break;
  }

  switch (neweventdate.weekday) {
    case 1:
      FFAppState().NewEventDateDoW = 'Monday';
      break;
    case 2:
      FFAppState().NewEventDateDoW = 'Tuesday';
      break;
    case 3:
      FFAppState().NewEventDateDoW = 'Wednesday';
      break;
    case 4:
      FFAppState().NewEventDateDoW = 'Thursday';
      break;
    case 5:
      FFAppState().NewEventDateDoW = 'Friday';
      break;
    case 6:
      FFAppState().NewEventDateDoW = 'Saturday';
      break;
    case 7:
      FFAppState().NewEventDateDoW = 'Sunday';
      break;
  }

  String hour = neweventdate.hour.toString();
  String minute = neweventdate.minute.toString();

  if (neweventdate.hour < 9) {
    hour = "0$hour";
  }
  if (neweventdate.minute < 9) {
    minute = "0$minute";
  }

  FFAppState().NewEventDateDay = neweventdate.day.toString();
  FFAppState().NewEventDateTime = "$hour:$minute";
  FFAppState().newEventDate = neweventdate;
  return eventDateTime;
}
