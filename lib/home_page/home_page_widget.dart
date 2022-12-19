import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_PAGE_LOAD');
      logFirebaseEvent('HomePage_update_local_state');
      setState(() {
        FFAppState().newEventDate = null;
        FFAppState().NewEventDateDay = '';
      });
      logFirebaseEvent('HomePage_update_local_state');
      setState(() {
        FFAppState().NewEventDateMonth = '';
        FFAppState().NewEventDateDoW = '';
      });
      logFirebaseEvent('HomePage_update_local_state');
      setState(() {
        FFAppState().NewEventDateTime = '';
      });
      logFirebaseEvent('HomePage_custom_action');
      await actions.lockOrientation();
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).alternate,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 160,
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/hb_4.png',
                                      ).image,
                                    ),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 30, 20, 20),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Stack(
                                                  children: [
                                                    AuthUserStreamWidget(
                                                      child: Container(
                                                        width: 86,
                                                        height: 86,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              currentUserPhoto,
                                                            ).image,
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFFEF99E),
                                                            width: 2,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                AuthUserStreamWidget(
                                                  child: SelectionArea(
                                                      child: Text(
                                                    currentUserDisplayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                        ),
                                                  )),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                AuthUserStreamWidget(
                                                  child: SelectionArea(
                                                      child: Text(
                                                    functions.organiserRank(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.eventCount,
                                                            0)),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .buttonBackground,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: StreamBuilder<List<EventsRecord>>(
                                    stream: queryEventsRecord(
                                      queryBuilder:
                                          (eventsRecord) =>
                                              eventsRecord
                                                  .where('event_date',
                                                      isGreaterThanOrEqualTo:
                                                          getCurrentTimestamp)
                                                  .where('event_host',
                                                      isEqualTo:
                                                          currentUserReference)
                                                  .orderBy('event_date'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitSquareCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<EventsRecord>
                                          listViewEventsRecordList =
                                          snapshot.data!;
                                      if (listViewEventsRecordList.isEmpty) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/getstarted.jpg',
                                          ),
                                        );
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewEventsRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewEventsRecord =
                                              listViewEventsRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 20),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                height: 300,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.network(
                                                      '',
                                                    ).image,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryColor,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0, -1),
                                                    end: AlignmentDirectional(
                                                        0, 1),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'HOME_PAGE_PAGE_Column_xo37gzft_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Column_navigate_to');

                                                    context.pushNamed(
                                                      'EventDetails',
                                                      queryParams: {
                                                        'selectedEventID':
                                                            serializeParam(
                                                          listViewEventsRecord
                                                              .eventId,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    16, 16, 16),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 60,
                                                                  height: 60,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            functions.eventMonth(listViewEventsRecord.eventDate!)!,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12,
                                                                                ),
                                                                          )),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            functions.eventDay(listViewEventsRecord.eventDate!).toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).buttonBackground,
                                                                                  fontSize: 22,
                                                                                ),
                                                                          )),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        SelectionArea(
                                                                            child:
                                                                                AutoSizeText(
                                                                          listViewEventsRecord
                                                                              .eventTitle!
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                18,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title3
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        )),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          functions
                                                                              .daysTillEvent(listViewEventsRecord.eventDate!),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Colors.white,
                                                                              ),
                                                                        )),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'HOME_PAGE_PAGE_Icon_yavpnjsn_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_share');
                                                                    await Share
                                                                        .share(
                                                                            '${FFAppState().shareURL}${listViewEventsRecord.eventId}');
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .ios_share,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 32,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    16, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: 100,
                                                                height: 190,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          10,
                                                                          10,
                                                                          10),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: SelectionArea(
                                                                                    child: AutoSizeText(
                                                                                  listViewEventsRecord.eventDescription!,
                                                                                  maxLines: 4,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                )),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            5),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.location_pin,
                                                                              color: FlutterFlowTheme.of(context).buttonBackground,
                                                                              size: 24,
                                                                            ),
                                                                            Expanded(
                                                                              child: SelectionArea(
                                                                                  child: Text(
                                                                                listViewEventsRecord.eventLocation!,
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            10),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      width: MediaQuery.of(context).size.width,
                                                                                      height: 60,
                                                                                      decoration: BoxDecoration(
                                                                                        gradient: LinearGradient(
                                                                                          colors: [
                                                                                            Color(0xFFEDD8FB),
                                                                                            Color(0xFFFEEFEC)
                                                                                          ],
                                                                                          stops: [0, 1],
                                                                                          begin: AlignmentDirectional(1, -1),
                                                                                          end: AlignmentDirectional(-1, 1),
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                            children: [
                                                                                                              SelectionArea(
                                                                                                                  child: Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  listViewEventsRecord.runningCountAccepted?.toString(),
                                                                                                                  '0',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).buttonBackground,
                                                                                                                    ),
                                                                                                              )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                                children: [
                                                                                                                  SelectionArea(
                                                                                                                      child: Text(
                                                                                                                    'Guests',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                                  )),
                                                                                                                ],
                                                                                                              ),
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    'Confirmed',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              SelectionArea(
                                                                                                                  child: Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  listViewEventsRecord.runningCountDeclined?.toString(),
                                                                                                                  '0',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).buttonBackground,
                                                                                                                    ),
                                                                                                              )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                                children: [
                                                                                                                  SelectionArea(
                                                                                                                      child: Text(
                                                                                                                    'Guests',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                                  )),
                                                                                                                ],
                                                                                                              ),
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                                children: [
                                                                                                                  SelectionArea(
                                                                                                                      child: Text(
                                                                                                                    'Declined',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                                  )),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (!(isWeb
                    ? MediaQuery.of(context).viewInsets.bottom > 0
                    : _isKeyboardVisible))
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 2,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 1, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 15, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'HOME_PAGE_PAGE_Icon_60ykhra5_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_haptic_feedback');
                                                    HapticFeedback
                                                        .selectionClick();
                                                  },
                                                  child: Icon(
                                                    Icons.house_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .selected,
                                                    size: 32,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 1, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 2,
                                                  shape: const CircleBorder(),
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      borderWidth: 1,
                                                      buttonSize: 60,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bigRoundButton,
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 30,
                                                      ),
                                                      showLoadingIndicator:
                                                          true,
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'HOME_PAGE_PAGE_add_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_haptic_feedback');
                                                        HapticFeedback
                                                            .selectionClick();
                                                        logFirebaseEvent(
                                                            'IconButton_navigate_to');

                                                        context.pushNamed(
                                                            'CreateEvent');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 15, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'HOME_PAGE_PAGE_Icon_ae36udfb_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_haptic_feedback');
                                                    HapticFeedback
                                                        .selectionClick();
                                                    logFirebaseEvent(
                                                        'Icon_navigate_to');

                                                    context.pushNamed(
                                                        'EditProfile');
                                                  },
                                                  child: Icon(
                                                    Icons.tag_faces_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .unselected,
                                                    size: 32,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
