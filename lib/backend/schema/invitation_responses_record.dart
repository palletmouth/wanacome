import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'invitation_responses_record.g.dart';

abstract class InvitationResponsesRecord
    implements
        Built<InvitationResponsesRecord, InvitationResponsesRecordBuilder> {
  static Serializer<InvitationResponsesRecord> get serializer =>
      _$invitationResponsesRecordSerializer;

  DocumentReference? get eventid;

  @BuiltValueField(wireName: 'Guest_Name')
  String? get guestName;

  bool? get attending;

  int? get headcount;

  String? get comments;

  @BuiltValueField(wireName: 'rsvp_date')
  DateTime? get rsvpDate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(InvitationResponsesRecordBuilder builder) =>
      builder
        ..guestName = ''
        ..attending = false
        ..headcount = 0
        ..comments = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('invitation_responses');

  static Stream<InvitationResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<InvitationResponsesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  InvitationResponsesRecord._();
  factory InvitationResponsesRecord(
          [void Function(InvitationResponsesRecordBuilder) updates]) =
      _$InvitationResponsesRecord;

  static InvitationResponsesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createInvitationResponsesRecordData({
  DocumentReference? eventid,
  String? guestName,
  bool? attending,
  int? headcount,
  String? comments,
  DateTime? rsvpDate,
}) {
  final firestoreData = serializers.toFirestore(
    InvitationResponsesRecord.serializer,
    InvitationResponsesRecord(
      (i) => i
        ..eventid = eventid
        ..guestName = guestName
        ..attending = attending
        ..headcount = headcount
        ..comments = comments
        ..rsvpDate = rsvpDate,
    ),
  );

  return firestoreData;
}
