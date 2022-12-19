import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'invitation_response_count_record.g.dart';

abstract class InvitationResponseCountRecord
    implements
        Built<InvitationResponseCountRecord,
            InvitationResponseCountRecordBuilder> {
  static Serializer<InvitationResponseCountRecord> get serializer =>
      _$invitationResponseCountRecordSerializer;

  DocumentReference? get eventID;

  bool? get attending;

  @BuiltValueField(wireName: 'running_count_accepted')
  int? get runningCountAccepted;

  @BuiltValueField(wireName: 'running_cound_declined')
  int? get runningCoundDeclined;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(
          InvitationResponseCountRecordBuilder builder) =>
      builder
        ..attending = false
        ..runningCountAccepted = 0
        ..runningCoundDeclined = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('invitation_response_count');

  static Stream<InvitationResponseCountRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<InvitationResponseCountRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  InvitationResponseCountRecord._();
  factory InvitationResponseCountRecord(
          [void Function(InvitationResponseCountRecordBuilder) updates]) =
      _$InvitationResponseCountRecord;

  static InvitationResponseCountRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createInvitationResponseCountRecordData({
  DocumentReference? eventID,
  bool? attending,
  int? runningCountAccepted,
  int? runningCoundDeclined,
}) {
  final firestoreData = serializers.toFirestore(
    InvitationResponseCountRecord.serializer,
    InvitationResponseCountRecord(
      (i) => i
        ..eventID = eventID
        ..attending = attending
        ..runningCountAccepted = runningCountAccepted
        ..runningCoundDeclined = runningCoundDeclined,
    ),
  );

  return firestoreData;
}
