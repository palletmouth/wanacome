import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'wana_come_suggestions_record.g.dart';

abstract class WanaComeSuggestionsRecord
    implements
        Built<WanaComeSuggestionsRecord, WanaComeSuggestionsRecordBuilder> {
  static Serializer<WanaComeSuggestionsRecord> get serializer =>
      _$wanaComeSuggestionsRecordSerializer;

  DocumentReference? get userID;

  String? get suggestion;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(WanaComeSuggestionsRecordBuilder builder) =>
      builder..suggestion = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('WanaComeSuggestions');

  static Stream<WanaComeSuggestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<WanaComeSuggestionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  WanaComeSuggestionsRecord._();
  factory WanaComeSuggestionsRecord(
          [void Function(WanaComeSuggestionsRecordBuilder) updates]) =
      _$WanaComeSuggestionsRecord;

  static WanaComeSuggestionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createWanaComeSuggestionsRecordData({
  DocumentReference? userID,
  String? suggestion,
}) {
  final firestoreData = serializers.toFirestore(
    WanaComeSuggestionsRecord.serializer,
    WanaComeSuggestionsRecord(
      (w) => w
        ..userID = userID
        ..suggestion = suggestion,
    ),
  );

  return firestoreData;
}
