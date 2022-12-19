// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventsRecord> _$eventsRecordSerializer =
    new _$EventsRecordSerializer();

class _$EventsRecordSerializer implements StructuredSerializer<EventsRecord> {
  @override
  final Iterable<Type> types = const [EventsRecord, _$EventsRecord];
  @override
  final String wireName = 'EventsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, EventsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.eventTitle;
    if (value != null) {
      result
        ..add('event_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventDate;
    if (value != null) {
      result
        ..add('event_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.eventDescription;
    if (value != null) {
      result
        ..add('event_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventLocation;
    if (value != null) {
      result
        ..add('event_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dressCode;
    if (value != null) {
      result
        ..add('dress_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventHost;
    if (value != null) {
      result
        ..add('event_host')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.eventId;
    if (value != null) {
      result
        ..add('event_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.runningCountAccepted;
    if (value != null) {
      result
        ..add('running_count_accepted')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.runningCountDeclined;
    if (value != null) {
      result
        ..add('running_count_declined')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.attendingMessage;
    if (value != null) {
      result
        ..add('attending_message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notAttendingMessage;
    if (value != null) {
      result
        ..add('not_attending_message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventCreateDate;
    if (value != null) {
      result
        ..add('event_create_date')
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
  EventsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'event_title':
          result.eventTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'event_date':
          result.eventDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'event_description':
          result.eventDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'event_location':
          result.eventLocation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dress_code':
          result.dressCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'event_host':
          result.eventHost = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'event_id':
          result.eventId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'running_count_accepted':
          result.runningCountAccepted = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'running_count_declined':
          result.runningCountDeclined = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'attending_message':
          result.attendingMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'not_attending_message':
          result.notAttendingMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'event_create_date':
          result.eventCreateDate = serializers.deserialize(value,
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

class _$EventsRecord extends EventsRecord {
  @override
  final String? eventTitle;
  @override
  final DateTime? eventDate;
  @override
  final String? eventDescription;
  @override
  final String? eventLocation;
  @override
  final String? dressCode;
  @override
  final DocumentReference<Object?>? eventHost;
  @override
  final String? eventId;
  @override
  final int? runningCountAccepted;
  @override
  final int? runningCountDeclined;
  @override
  final String? attendingMessage;
  @override
  final String? notAttendingMessage;
  @override
  final DateTime? eventCreateDate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EventsRecord([void Function(EventsRecordBuilder)? updates]) =>
      (new EventsRecordBuilder()..update(updates))._build();

  _$EventsRecord._(
      {this.eventTitle,
      this.eventDate,
      this.eventDescription,
      this.eventLocation,
      this.dressCode,
      this.eventHost,
      this.eventId,
      this.runningCountAccepted,
      this.runningCountDeclined,
      this.attendingMessage,
      this.notAttendingMessage,
      this.eventCreateDate,
      this.ffRef})
      : super._();

  @override
  EventsRecord rebuild(void Function(EventsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsRecordBuilder toBuilder() => new EventsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsRecord &&
        eventTitle == other.eventTitle &&
        eventDate == other.eventDate &&
        eventDescription == other.eventDescription &&
        eventLocation == other.eventLocation &&
        dressCode == other.dressCode &&
        eventHost == other.eventHost &&
        eventId == other.eventId &&
        runningCountAccepted == other.runningCountAccepted &&
        runningCountDeclined == other.runningCountDeclined &&
        attendingMessage == other.attendingMessage &&
        notAttendingMessage == other.notAttendingMessage &&
        eventCreateDate == other.eventCreateDate &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, eventTitle.hashCode),
                                                    eventDate.hashCode),
                                                eventDescription.hashCode),
                                            eventLocation.hashCode),
                                        dressCode.hashCode),
                                    eventHost.hashCode),
                                eventId.hashCode),
                            runningCountAccepted.hashCode),
                        runningCountDeclined.hashCode),
                    attendingMessage.hashCode),
                notAttendingMessage.hashCode),
            eventCreateDate.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventsRecord')
          ..add('eventTitle', eventTitle)
          ..add('eventDate', eventDate)
          ..add('eventDescription', eventDescription)
          ..add('eventLocation', eventLocation)
          ..add('dressCode', dressCode)
          ..add('eventHost', eventHost)
          ..add('eventId', eventId)
          ..add('runningCountAccepted', runningCountAccepted)
          ..add('runningCountDeclined', runningCountDeclined)
          ..add('attendingMessage', attendingMessage)
          ..add('notAttendingMessage', notAttendingMessage)
          ..add('eventCreateDate', eventCreateDate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EventsRecordBuilder
    implements Builder<EventsRecord, EventsRecordBuilder> {
  _$EventsRecord? _$v;

  String? _eventTitle;
  String? get eventTitle => _$this._eventTitle;
  set eventTitle(String? eventTitle) => _$this._eventTitle = eventTitle;

  DateTime? _eventDate;
  DateTime? get eventDate => _$this._eventDate;
  set eventDate(DateTime? eventDate) => _$this._eventDate = eventDate;

  String? _eventDescription;
  String? get eventDescription => _$this._eventDescription;
  set eventDescription(String? eventDescription) =>
      _$this._eventDescription = eventDescription;

  String? _eventLocation;
  String? get eventLocation => _$this._eventLocation;
  set eventLocation(String? eventLocation) =>
      _$this._eventLocation = eventLocation;

  String? _dressCode;
  String? get dressCode => _$this._dressCode;
  set dressCode(String? dressCode) => _$this._dressCode = dressCode;

  DocumentReference<Object?>? _eventHost;
  DocumentReference<Object?>? get eventHost => _$this._eventHost;
  set eventHost(DocumentReference<Object?>? eventHost) =>
      _$this._eventHost = eventHost;

  String? _eventId;
  String? get eventId => _$this._eventId;
  set eventId(String? eventId) => _$this._eventId = eventId;

  int? _runningCountAccepted;
  int? get runningCountAccepted => _$this._runningCountAccepted;
  set runningCountAccepted(int? runningCountAccepted) =>
      _$this._runningCountAccepted = runningCountAccepted;

  int? _runningCountDeclined;
  int? get runningCountDeclined => _$this._runningCountDeclined;
  set runningCountDeclined(int? runningCountDeclined) =>
      _$this._runningCountDeclined = runningCountDeclined;

  String? _attendingMessage;
  String? get attendingMessage => _$this._attendingMessage;
  set attendingMessage(String? attendingMessage) =>
      _$this._attendingMessage = attendingMessage;

  String? _notAttendingMessage;
  String? get notAttendingMessage => _$this._notAttendingMessage;
  set notAttendingMessage(String? notAttendingMessage) =>
      _$this._notAttendingMessage = notAttendingMessage;

  DateTime? _eventCreateDate;
  DateTime? get eventCreateDate => _$this._eventCreateDate;
  set eventCreateDate(DateTime? eventCreateDate) =>
      _$this._eventCreateDate = eventCreateDate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EventsRecordBuilder() {
    EventsRecord._initializeBuilder(this);
  }

  EventsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eventTitle = $v.eventTitle;
      _eventDate = $v.eventDate;
      _eventDescription = $v.eventDescription;
      _eventLocation = $v.eventLocation;
      _dressCode = $v.dressCode;
      _eventHost = $v.eventHost;
      _eventId = $v.eventId;
      _runningCountAccepted = $v.runningCountAccepted;
      _runningCountDeclined = $v.runningCountDeclined;
      _attendingMessage = $v.attendingMessage;
      _notAttendingMessage = $v.notAttendingMessage;
      _eventCreateDate = $v.eventCreateDate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventsRecord;
  }

  @override
  void update(void Function(EventsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventsRecord build() => _build();

  _$EventsRecord _build() {
    final _$result = _$v ??
        new _$EventsRecord._(
            eventTitle: eventTitle,
            eventDate: eventDate,
            eventDescription: eventDescription,
            eventLocation: eventLocation,
            dressCode: dressCode,
            eventHost: eventHost,
            eventId: eventId,
            runningCountAccepted: runningCountAccepted,
            runningCountDeclined: runningCountDeclined,
            attendingMessage: attendingMessage,
            notAttendingMessage: notAttendingMessage,
            eventCreateDate: eventCreateDate,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
