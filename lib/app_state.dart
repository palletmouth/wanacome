import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _GooglePlayURL = prefs.getString('ff_GooglePlayURL') ?? _GooglePlayURL;
  }

  late SharedPreferences prefs;

  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _location = _value;
  }

  DateTime? _newEventDate;
  DateTime? get newEventDate => _newEventDate;
  set newEventDate(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _newEventDate = _value;
  }

  String _NewEventDateDay = '';
  String get NewEventDateDay => _NewEventDateDay;
  set NewEventDateDay(String _value) {
    notifyListeners();

    _NewEventDateDay = _value;
  }

  String _NewEventDateMonth = '';
  String get NewEventDateMonth => _NewEventDateMonth;
  set NewEventDateMonth(String _value) {
    notifyListeners();

    _NewEventDateMonth = _value;
  }

  String _NewEventDateDoW = '';
  String get NewEventDateDoW => _NewEventDateDoW;
  set NewEventDateDoW(String _value) {
    notifyListeners();

    _NewEventDateDoW = _value;
  }

  String _NewEventDateTime = '';
  String get NewEventDateTime => _NewEventDateTime;
  set NewEventDateTime(String _value) {
    notifyListeners();

    _NewEventDateTime = _value;
  }

  String _NewEventID = '';
  String get NewEventID => _NewEventID;
  set NewEventID(String _value) {
    notifyListeners();

    _NewEventID = _value;
  }

  int _RSVPHeadecount = 0;
  int get RSVPHeadecount => _RSVPHeadecount;
  set RSVPHeadecount(int _value) {
    notifyListeners();

    _RSVPHeadecount = _value;
  }

  String _iscString = '';
  String get iscString => _iscString;
  set iscString(String _value) {
    notifyListeners();

    _iscString = _value;
  }

  String _eventhostname = '';
  String get eventhostname => _eventhostname;
  set eventhostname(String _value) {
    notifyListeners();

    _eventhostname = _value;
  }

  String _AppleAppStoreURL = 'https://www.apple.com/uk/app-store/';
  String get AppleAppStoreURL => _AppleAppStoreURL;
  set AppleAppStoreURL(String _value) {
    notifyListeners();

    _AppleAppStoreURL = _value;
  }

  String _GooglePlayURL = 'https://play.google.com/';
  String get GooglePlayURL => _GooglePlayURL;
  set GooglePlayURL(String _value) {
    notifyListeners();

    _GooglePlayURL = _value;
    prefs.setString('ff_GooglePlayURL', _value);
  }

  String _rsvpButtonText = 'Accept';
  String get rsvpButtonText => _rsvpButtonText;
  set rsvpButtonText(String _value) {
    notifyListeners();

    _rsvpButtonText = _value;
  }

  String _avatarurl = '';
  String get avatarurl => _avatarurl;
  set avatarurl(String _value) {
    notifyListeners();

    _avatarurl = _value;
  }

  String _shareURL = 'https://we.wanacome.com/?id=';
  String get shareURL => _shareURL;
  set shareURL(String _value) {
    notifyListeners();

    _shareURL = _value;
  }

  String _defaultLocation = '';
  String get defaultLocation => _defaultLocation;
  set defaultLocation(String _value) {
    notifyListeners();

    _defaultLocation = _value;
  }

  String _hostStatus1 = 'Event Novice';
  String get hostStatus1 => _hostStatus1;
  set hostStatus1(String _value) {
    notifyListeners();

    _hostStatus1 = _value;
  }

  String _hostStatus2 = 'Party Amateur';
  String get hostStatus2 => _hostStatus2;
  set hostStatus2(String _value) {
    notifyListeners();

    _hostStatus2 = _value;
  }

  String _hostStatus3 = 'Expert Host';
  String get hostStatus3 => _hostStatus3;
  set hostStatus3(String _value) {
    notifyListeners();

    _hostStatus3 = _value;
  }

  bool _useDefaultAddress = false;
  bool get useDefaultAddress => _useDefaultAddress;
  set useDefaultAddress(bool _value) {
    notifyListeners();

    _useDefaultAddress = _value;
  }

  bool _eventSaved = false;
  bool get eventSaved => _eventSaved;
  set eventSaved(bool _value) {
    notifyListeners();

    _eventSaved = _value;
  }

  DocumentReference? _currentEventReference;
  DocumentReference? get currentEventReference => _currentEventReference;
  set currentEventReference(DocumentReference? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _currentEventReference = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
