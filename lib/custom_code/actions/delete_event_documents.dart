// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteEventDocuments(
  String collectionName,
  String fieldName,
  DocumentReference dataName,
) async {
  WriteBatch batch = FirebaseFirestore.instance.batch();
  FirebaseFirestore.instance
      .collection(collectionName)
      .where(fieldName, isEqualTo: dataName)
      .get()
      .then((QuerySnapshot) {
    QuerySnapshot.docs.forEach((document) {
      batch.delete(document.reference);
    });
    return batch.commit();
  });
}
