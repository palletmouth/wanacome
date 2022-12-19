import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'events_record.g.dart';

abstract class EventsRecord
    implements Built<EventsRecord, EventsRecordBuilder> {
  static Serializer<EventsRecord> get serializer => _$eventsRecordSerializer;

  @BuiltValueField(wireName: 'event_title')
  String? get eventTitle;

  @BuiltValueField(wireName: 'event_date')
  DateTime? get eventDate;

  @BuiltValueField(wireName: 'event_description')
  String? get eventDescription;

  @BuiltValueField(wireName: 'event_location')
  String? get eventLocation;

  @BuiltValueField(wireName: 'dress_code')
  String? get dressCode;

  @BuiltValueField(wireName: 'event_host')
  DocumentReference? get eventHost;

  @BuiltValueField(wireName: 'event_id')
  String? get eventId;

  @BuiltValueField(wireName: 'running_count_accepted')
  int? get runningCountAccepted;

  @BuiltValueField(wireName: 'running_count_declined')
  int? get runningCountDeclined;

  @BuiltValueField(wireName: 'attending_message')
  String? get attendingMessage;

  @BuiltValueField(wireName: 'not_attending_message')
  String? get notAttendingMessage;

  @BuiltValueField(wireName: 'event_create_date')
  DateTime? get eventCreateDate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EventsRecordBuilder builder) => builder
    ..eventTitle = ''
    ..eventDescription = ''
    ..eventLocation = ''
    ..dressCode = ''
    ..eventId = ''
    ..runningCountAccepted = 0
    ..runningCountDeclined = 0
    ..attendingMessage = ''
    ..notAttendingMessage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EventsRecord._();
  factory EventsRecord([void Function(EventsRecordBuilder) updates]) =
      _$EventsRecord;

  static EventsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEventsRecordData({
  String? eventTitle,
  DateTime? eventDate,
  String? eventDescription,
  String? eventLocation,
  String? dressCode,
  DocumentReference? eventHost,
  String? eventId,
  int? runningCountAccepted,
  int? runningCountDeclined,
  String? attendingMessage,
  String? notAttendingMessage,
  DateTime? eventCreateDate,
}) {
  final firestoreData = serializers.toFirestore(
    EventsRecord.serializer,
    EventsRecord(
      (e) => e
        ..eventTitle = eventTitle
        ..eventDate = eventDate
        ..eventDescription = eventDescription
        ..eventLocation = eventLocation
        ..dressCode = dressCode
        ..eventHost = eventHost
        ..eventId = eventId
        ..runningCountAccepted = runningCountAccepted
        ..runningCountDeclined = runningCountDeclined
        ..attendingMessage = attendingMessage
        ..notAttendingMessage = notAttendingMessage
        ..eventCreateDate = eventCreateDate,
    ),
  );

  return firestoreData;
}
