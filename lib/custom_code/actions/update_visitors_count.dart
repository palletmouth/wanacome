// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future updateVisitorsCount(
  bool accepted,
  String eventID,
  int guestCount,
) async {
  if (guestCount == 0) {
    guestCount = 1;
  }

  QuerySnapshot events = await FirebaseFirestore.instance
      .collection('events')
      .where('event_id', isEqualTo: eventID)
      .get();

  if (events.docs.isNotEmpty) {
    if (accepted == true) {
      await events.docs[0].reference
          .update({'running_count_accepted': FieldValue.increment(guestCount)});
    } else if (accepted == false) {
      await events.docs[0].reference
          .update({'running_count_declined': FieldValue.increment(guestCount)});
    }
  }
}
