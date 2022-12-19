// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:to_csv/to_csv.dart' as exportCSV;

Future exportRSVP() async {
  List<String> header = [];
  header.add('Guest Name');
  header.add('Attending');
  header.add('Comments');
  header.add('Coount');

  QuerySnapshot responses = await FirebaseFirestore.instance
      .collection('invitation_responses')
      .where('eventid', isEqualTo: FFAppState().currentEventReference)
      .get();

  List<List<String>> listOfLists = [];

  var rsvps = responses.docs.map((doc) => doc.data()).toList();

  for (var i = 0; i < rsvps.length; i++) {
    QueryDocumentSnapshot rsvp = responses.docs.elementAt(i);
    List<String> data = [
      rsvp.get('Guest_Name'),
      rsvp.get('attending'),
      rsvp.get('comments'),
      rsvp.get('headcount')
    ];
    listOfLists.add(data);
  }

  exportCSV.myCSV(header, listOfLists);
}
