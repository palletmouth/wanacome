// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wana_come_suggestions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WanaComeSuggestionsRecord> _$wanaComeSuggestionsRecordSerializer =
    new _$WanaComeSuggestionsRecordSerializer();

class _$WanaComeSuggestionsRecordSerializer
    implements StructuredSerializer<WanaComeSuggestionsRecord> {
  @override
  final Iterable<Type> types = const [
    WanaComeSuggestionsRecord,
    _$WanaComeSuggestionsRecord
  ];
  @override
  final String wireName = 'WanaComeSuggestionsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WanaComeSuggestionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userID;
    if (value != null) {
      result
        ..add('userID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.suggestion;
    if (value != null) {
      result
        ..add('suggestion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  WanaComeSuggestionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WanaComeSuggestionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userID':
          result.userID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'suggestion':
          result.suggestion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$WanaComeSuggestionsRecord extends WanaComeSuggestionsRecord {
  @override
  final DocumentReference<Object?>? userID;
  @override
  final String? suggestion;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$WanaComeSuggestionsRecord(
          [void Function(WanaComeSuggestionsRecordBuilder)? updates]) =>
      (new WanaComeSuggestionsRecordBuilder()..update(updates))._build();

  _$WanaComeSuggestionsRecord._({this.userID, this.suggestion, this.ffRef})
      : super._();

  @override
  WanaComeSuggestionsRecord rebuild(
          void Function(WanaComeSuggestionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WanaComeSuggestionsRecordBuilder toBuilder() =>
      new WanaComeSuggestionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WanaComeSuggestionsRecord &&
        userID == other.userID &&
        suggestion == other.suggestion &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, userID.hashCode), suggestion.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WanaComeSuggestionsRecord')
          ..add('userID', userID)
          ..add('suggestion', suggestion)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class WanaComeSuggestionsRecordBuilder
    implements
        Builder<WanaComeSuggestionsRecord, WanaComeSuggestionsRecordBuilder> {
  _$WanaComeSuggestionsRecord? _$v;

  DocumentReference<Object?>? _userID;
  DocumentReference<Object?>? get userID => _$this._userID;
  set userID(DocumentReference<Object?>? userID) => _$this._userID = userID;

  String? _suggestion;
  String? get suggestion => _$this._suggestion;
  set suggestion(String? suggestion) => _$this._suggestion = suggestion;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  WanaComeSuggestionsRecordBuilder() {
    WanaComeSuggestionsRecord._initializeBuilder(this);
  }

  WanaComeSuggestionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userID = $v.userID;
      _suggestion = $v.suggestion;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WanaComeSuggestionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WanaComeSuggestionsRecord;
  }

  @override
  void update(void Function(WanaComeSuggestionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WanaComeSuggestionsRecord build() => _build();

  _$WanaComeSuggestionsRecord _build() {
    final _$result = _$v ??
        new _$WanaComeSuggestionsRecord._(
            userID: userID, suggestion: suggestion, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
