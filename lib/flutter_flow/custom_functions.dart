import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String organiserRank(int eventCount) {
  var rankStatus = '';

  if (eventCount < 5) {
    rankStatus = 'Event Novice';
  } else if (eventCount >= 5 || eventCount < 10) {
    rankStatus = 'Party Amateur';
  } else if (eventCount >= 10) {
    rankStatus = 'Expert Host';
  }

  return rankStatus;
}

String daysTillEvent(DateTime eventDate) {
  DateTime from = DateTime.now();

  from = DateTime(from.year, from.month, from.day);
  eventDate = DateTime(eventDate.year, eventDate.month, eventDate.day);
  int tildays = (eventDate.difference(from).inHours / 24).round();

  String retStr = "";

  if (tildays > 1) {
    retStr = "${tildays.toString()} days away";
  }
  if (tildays == 1) {
    retStr = "${tildays.toString()} day away";
  }
  if (tildays == 0) {
    retStr = "It's today, let's party";
  }

  return retStr;
}

String? eventMonth(DateTime eventDate) {
  switch (eventDate.month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
  }
}

int eventDay(DateTime eventDate) {
  return eventDate.day;
}

int stringToNum(String inputStr) {
  if (inputStr == "") {
    inputStr == "1";
  }

  int n = 0;

  try {
    n = int.parse(inputStr);
    // etc.
  } on FormatException {
    n = 1;
  }
  return n;
}

String returnICS(
  String eventName,
  String description,
  String host,
  String location,
  DateTime startTime,
) {
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

bool showPanic(
  int accCount,
  int decCount,
) {
  bool rV = false;

  if ((accCount == 0) & (decCount == 0)) {
    rV = true;
  }

  return rV;
}

int panicYet(
  DateTime eventSetDate,
  DateTime today,
) {
  int daycount = 0;

  daycount = (today.difference(eventSetDate).inHours / 24).round();
  return daycount;
}

bool canSaveLocation(
  String addressLocation,
  bool useDefaultLocation,
) {
  bool canSave = true;

  if ((useDefaultLocation == false) & (addressLocation == "")) {
    canSave = false;
  } else {
    canSave = true;
  }

  return canSave;
}

String returnDocumentString(DocumentReference ref) {
  return ref.path;
}
