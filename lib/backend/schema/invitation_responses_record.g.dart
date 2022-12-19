// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_responses_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InvitationResponsesRecord> _$invitationResponsesRecordSerializer =
    new _$InvitationResponsesRecordSerializer();

class _$InvitationResponsesRecordSerializer
    implements StructuredSerializer<InvitationResponsesRecord> {
  @override
  final Iterable<Type> types = const [
    InvitationResponsesRecord,
    _$InvitationResponsesRecord
  ];
  @override
  final String wireName = 'InvitationResponsesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, InvitationResponsesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.eventid;
    if (value != null) {
      result
        ..add('eventid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.guestName;
    if (value != null) {
      result
        ..add('Guest_Name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.attending;
    if (value != null) {
      result
        ..add('attending')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.headcount;
    if (value != null) {
      result
        ..add('headcount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rsvpDate;
    if (value != null) {
      result
        ..add('rsvp_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  InvitationResponsesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InvitationResponsesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'eventid':
          result.eventid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Guest_Name':
          result.guestName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'attending':
          result.attending = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'headcount':
          result.headcount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'comments':
          result.comments = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rsvp_date':
          result.rsvpDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$InvitationResponsesRecord extends InvitationResponsesRecord {
  @override
  final DocumentReference<Object?>? eventid;
  @override
  final String? guestName;
  @override
  final bool? attending;
  @override
  final int? headcount;
  @override
  final String? comments;
  @override
  final DateTime? rsvpDate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$InvitationResponsesRecord(
          [void Function(InvitationResponsesRecordBuilder)? updates]) =>
      (new InvitationResponsesRecordBuilder()..update(updates))._build();

  _$InvitationResponsesRecord._(
      {this.eventid,
      this.guestName,
      this.attending,
      this.headcount,
      this.comments,
      this.rsvpDate,
      this.ffRef})
      : super._();

  @override
  InvitationResponsesRecord rebuild(
          void Function(InvitationResponsesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvitationResponsesRecordBuilder toBuilder() =>
      new InvitationResponsesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvitationResponsesRecord &&
        eventid == other.eventid &&
        guestName == other.guestName &&
        attending == other.attending &&
        headcount == other.headcount &&
        comments == other.comments &&
        rsvpDate == other.rsvpDate &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, eventid.hashCode), guestName.hashCode),
                        attending.hashCode),
                    headcount.hashCode),
                comments.hashCode),
            rsvpDate.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvitationResponsesRecord')
          ..add('eventid', eventid)
          ..add('guestName', guestName)
          ..add('attending', attending)
          ..add('headcount', headcount)
          ..add('comments', comments)
          ..add('rsvpDate', rsvpDate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class InvitationResponsesRecordBuilder
    implements
        Builder<InvitationResponsesRecord, InvitationResponsesRecordBuilder> {
  _$InvitationResponsesRecord? _$v;

  DocumentReference<Object?>? _eventid;
  DocumentReference<Object?>? get eventid => _$this._eventid;
  set eventid(DocumentReference<Object?>? eventid) => _$this._eventid = eventid;

  String? _guestName;
  String? get guestName => _$this._guestName;
  set guestName(String? guestName) => _$this._guestName = guestName;

  bool? _attending;
  bool? get attending => _$this._attending;
  set attending(bool? attending) => _$this._attending = attending;

  int? _headcount;
  int? get headcount => _$this._headcount;
  set headcount(int? headcount) => _$this._headcount = headcount;

  String? _comments;
  String? get comments => _$this._comments;
  set comments(String? comments) => _$this._comments = comments;

  DateTime? _rsvpDate;
  DateTime? get rsvpDate => _$this._rsvpDate;
  set rsvpDate(DateTime? rsvpDate) => _$this._rsvpDate = rsvpDate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  InvitationResponsesRecordBuilder() {
    InvitationResponsesRecord._initializeBuilder(this);
  }

  InvitationResponsesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eventid = $v.eventid;
      _guestName = $v.guestName;
      _attending = $v.attending;
      _headcount = $v.headcount;
      _comments = $v.comments;
      _rsvpDate = $v.rsvpDate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvitationResponsesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InvitationResponsesRecord;
  }

  @override
  void update(void Function(InvitationResponsesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvitationResponsesRecord build() => _build();

  _$InvitationResponsesRecord _build() {
    final _$result = _$v ??
        new _$InvitationResponsesRecord._(
            eventid: eventid,
            guestName: guestName,
            attending: attending,
            headcount: headcount,
            comments: comments,
            rsvpDate: rsvpDate,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
