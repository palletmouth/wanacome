// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_response_count_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InvitationResponseCountRecord>
    _$invitationResponseCountRecordSerializer =
    new _$InvitationResponseCountRecordSerializer();

class _$InvitationResponseCountRecordSerializer
    implements StructuredSerializer<InvitationResponseCountRecord> {
  @override
  final Iterable<Type> types = const [
    InvitationResponseCountRecord,
    _$InvitationResponseCountRecord
  ];
  @override
  final String wireName = 'InvitationResponseCountRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, InvitationResponseCountRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.eventID;
    if (value != null) {
      result
        ..add('eventID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.attending;
    if (value != null) {
      result
        ..add('attending')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.runningCountAccepted;
    if (value != null) {
      result
        ..add('running_count_accepted')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.runningCoundDeclined;
    if (value != null) {
      result
        ..add('running_cound_declined')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  InvitationResponseCountRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InvitationResponseCountRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'eventID':
          result.eventID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'attending':
          result.attending = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'running_count_accepted':
          result.runningCountAccepted = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'running_cound_declined':
          result.runningCoundDeclined = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$InvitationResponseCountRecord extends InvitationResponseCountRecord {
  @override
  final DocumentReference<Object?>? eventID;
  @override
  final bool? attending;
  @override
  final int? runningCountAccepted;
  @override
  final int? runningCoundDeclined;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$InvitationResponseCountRecord(
          [void Function(InvitationResponseCountRecordBuilder)? updates]) =>
      (new InvitationResponseCountRecordBuilder()..update(updates))._build();

  _$InvitationResponseCountRecord._(
      {this.eventID,
      this.attending,
      this.runningCountAccepted,
      this.runningCoundDeclined,
      this.ffRef})
      : super._();

  @override
  InvitationResponseCountRecord rebuild(
          void Function(InvitationResponseCountRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvitationResponseCountRecordBuilder toBuilder() =>
      new InvitationResponseCountRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvitationResponseCountRecord &&
        eventID == other.eventID &&
        attending == other.attending &&
        runningCountAccepted == other.runningCountAccepted &&
        runningCoundDeclined == other.runningCoundDeclined &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, eventID.hashCode), attending.hashCode),
                runningCountAccepted.hashCode),
            runningCoundDeclined.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvitationResponseCountRecord')
          ..add('eventID', eventID)
          ..add('attending', attending)
          ..add('runningCountAccepted', runningCountAccepted)
          ..add('runningCoundDeclined', runningCoundDeclined)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class InvitationResponseCountRecordBuilder
    implements
        Builder<InvitationResponseCountRecord,
            InvitationResponseCountRecordBuilder> {
  _$InvitationResponseCountRecord? _$v;

  DocumentReference<Object?>? _eventID;
  DocumentReference<Object?>? get eventID => _$this._eventID;
  set eventID(DocumentReference<Object?>? eventID) => _$this._eventID = eventID;

  bool? _attending;
  bool? get attending => _$this._attending;
  set attending(bool? attending) => _$this._attending = attending;

  int? _runningCountAccepted;
  int? get runningCountAccepted => _$this._runningCountAccepted;
  set runningCountAccepted(int? runningCountAccepted) =>
      _$this._runningCountAccepted = runningCountAccepted;

  int? _runningCoundDeclined;
  int? get runningCoundDeclined => _$this._runningCoundDeclined;
  set runningCoundDeclined(int? runningCoundDeclined) =>
      _$this._runningCoundDeclined = runningCoundDeclined;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  InvitationResponseCountRecordBuilder() {
    InvitationResponseCountRecord._initializeBuilder(this);
  }

  InvitationResponseCountRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eventID = $v.eventID;
      _attending = $v.attending;
      _runningCountAccepted = $v.runningCountAccepted;
      _runningCoundDeclined = $v.runningCoundDeclined;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvitationResponseCountRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InvitationResponseCountRecord;
  }

  @override
  void update(void Function(InvitationResponseCountRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvitationResponseCountRecord build() => _build();

  _$InvitationResponseCountRecord _build() {
    final _$result = _$v ??
        new _$InvitationResponseCountRecord._(
            eventID: eventID,
            attending: attending,
            runningCountAccepted: runningCountAccepted,
            runningCoundDeclined: runningCoundDeclined,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
