import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RsWidget extends StatefulWidget {
  const RsWidget({
    Key? key,
    this.vp,
  }) : super(key: key);

  final String? vp;

  @override
  _RsWidgetState createState() => _RsWidgetState();
}

class _RsWidgetState extends State<RsWidget> {
  String? newISCstring;
  TextEditingController? commentsController;
  TextEditingController? guestNameController;
  TextEditingController? headCountController;
  bool? attendingValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('RS_PAGE_rs_ON_PAGE_LOAD');
      logFirebaseEvent('rs_custom_action');
      await actions.lockOrientation();
      if (widget.vp == null || widget.vp == '') {
        logFirebaseEvent('rs_launch_u_r_l');
        await launchURL('https://www.wanacome.com/');
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'rs'});
    commentsController = TextEditingController();
    guestNameController = TextEditingController();
    headCountController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    commentsController?.dispose();
    guestNameController?.dispose();
    headCountController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<EventsRecord>>(
      stream: queryEventsRecord(
        queryBuilder: (eventsRecord) =>
            eventsRecord.where('event_id', isEqualTo: widget.vp),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitSquareCircle(
                color: FlutterFlowTheme.of(context).secondaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<EventsRecord> rsEventsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final rsEventsRecord =
            rsEventsRecordList.isNotEmpty ? rsEventsRecordList.first : null;
        return Title(
            title: 'Wanacome Invitation',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              body: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: FutureBuilder<UsersRecord>(
                    future:
                        UsersRecord.getDocumentOnce(rsEventsRecord!.eventHost!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitSquareCircle(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      final containerUsersRecord = snapshot.data!;
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        constraints: BoxConstraints(
                          maxWidth: 400,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/invitation_background_1.jpg',
                            ).image,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 210,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 20, 20, 20),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 10),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/logo-02.png',
                                                                width: 200,
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'You\'ve Been Invited To',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .buttonBackground,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    AutoSizeText(
                                                                  rsEventsRecord!
                                                                      .eventTitle!,
                                                                  maxLines: 3,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Hosted By ${containerUsersRecord.displayName}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .buttonBackground,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Event Date: ${dateTimeFormat('MMMEd', rsEventsRecord!.eventDate)}, ${dateTimeFormat('jm', rsEventsRecord!.eventDate)}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_pin,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .buttonBackground,
                                                                size: 24,
                                                              ),
                                                              Text(
                                                                rsEventsRecord!
                                                                    .eventLocation!,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .black,
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
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Event Details',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .buttonBackground,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 20),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: AutoSizeText(
                                                          rsEventsRecord!
                                                              .eventDescription!,
                                                          maxLines: 4,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        ),
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
                              if (rsEventsRecord!.eventDate! >=
                                  getCurrentTimestamp)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 10, 20, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: guestNameController,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Guest Name',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .buttonBackground,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                hintText:
                                                    'Put your full name to avoid confusion',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF727272),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF727272),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 10, 20, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          FlutterFlowDropDown<bool>(
                                            initialOption: attendingValue ??=
                                                true,
                                            options: [true, false],
                                            optionLabels: [
                                              'Yes, I/We Can Come',
                                              'No, I/We Can\'t Come'
                                            ],
                                            onChanged: (val) async {
                                              setState(
                                                  () => attendingValue = val);
                                              logFirebaseEvent(
                                                  'RS_Attending_ON_FORM_WIDGET_SELECTED');
                                              if (attendingValue == true) {
                                                logFirebaseEvent(
                                                    'Attending_update_local_state');
                                                setState(() {
                                                  FFAppState().rsvpButtonText =
                                                      'Accept';
                                                });
                                              } else {
                                                logFirebaseEvent(
                                                    'Attending_update_local_state');
                                                setState(() {
                                                  FFAppState().rsvpButtonText =
                                                      'Decline';
                                                });
                                              }
                                            },
                                            width: 195,
                                            height: 50,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.black,
                                                    ),
                                            fillColor: Colors.white,
                                            elevation: 2,
                                            borderColor: Color(0xFF727272),
                                            borderWidth: 2,
                                            borderRadius: 10,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 4, 12, 4),
                                            hidesUnderline: true,
                                          ),
                                          if (attendingValue ?? true)
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: TextFormField(
                                                  controller:
                                                      headCountController,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Party/Family Size',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .buttonBackground,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    hintText: 'Guests Coming',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF727272),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF727272),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 10, 20, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: commentsController,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Comments',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .buttonBackground,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                hintText:
                                                    'Anything you\'d like to tell the host',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF727272),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF727272),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'RS_PAGE_CONFIRM_BTN_ON_TAP');
                                              var _shouldSetState = false;
                                              if (guestNameController!.text !=
                                                      null &&
                                                  guestNameController!.text !=
                                                      '') {
                                                if (attendingValue!) {
                                                  logFirebaseEvent(
                                                      'Button_update_local_state');
                                                  setState(() {
                                                    FFAppState()
                                                            .RSVPHeadecount =
                                                        functions.stringToNum(
                                                            headCountController!
                                                                .text);
                                                  });
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_update_local_state');
                                                  setState(() {
                                                    FFAppState()
                                                        .RSVPHeadecount = 1;
                                                  });
                                                }

                                                if (FFAppState()
                                                        .RSVPHeadecount >=
                                                    1) {
                                                  logFirebaseEvent(
                                                      'Button_alert_dialog');
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Confirm Invitation RSVP'),
                                                                content: Text(
                                                                    'Is Everything Correct On Your RSVP?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Confirm'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    final invitationResponsesCreateData =
                                                        createInvitationResponsesRecordData(
                                                      eventid: rsEventsRecord!
                                                          .reference,
                                                      guestName:
                                                          guestNameController!
                                                              .text,
                                                      attending: attendingValue,
                                                      headcount: FFAppState()
                                                          .RSVPHeadecount,
                                                      comments:
                                                          commentsController!
                                                              .text,
                                                      rsvpDate:
                                                          getCurrentTimestamp,
                                                    );
                                                    await InvitationResponsesRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            invitationResponsesCreateData);
                                                    logFirebaseEvent(
                                                        'Button_custom_action');
                                                    await actions
                                                        .updateVisitorsCount(
                                                      attendingValue!,
                                                      widget.vp!,
                                                      FFAppState()
                                                          .RSVPHeadecount,
                                                    );
                                                    if (attendingValue ==
                                                        true) {
                                                      logFirebaseEvent(
                                                          'Button_custom_action');
                                                      newISCstring =
                                                          await actions
                                                              .downloadICS(
                                                        rsEventsRecord!
                                                            .eventTitle!,
                                                        rsEventsRecord!
                                                            .eventDescription!,
                                                        containerUsersRecord
                                                            .displayName!,
                                                        rsEventsRecord!
                                                            .eventLocation!,
                                                        rsEventsRecord!
                                                            .eventDate!,
                                                      );
                                                      _shouldSetState = true;
                                                      logFirebaseEvent(
                                                          'Button_trigger_push_notification');
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            'RSVP Acceptance From ${guestNameController!.text}',
                                                        notificationText:
                                                            '${guestNameController!.text} and a party of ${headCountController!.text}have confirmed they are coming.',
                                                        notificationSound:
                                                            'default',
                                                        userRefs: [
                                                          rsEventsRecord!
                                                              .eventHost!
                                                        ],
                                                        initialPageName:
                                                            'EventDetails',
                                                        parameterData: {
                                                          'selectedEventID':
                                                              widget.vp,
                                                        },
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_alert_dialog');
                                                      confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        rsEventsRecord!
                                                                            .eventTitle!),
                                                                    content: Text(
                                                                        'Would you like to download event details to your calendar?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'No'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Yes'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        logFirebaseEvent(
                                                            'Button_launch_u_r_l');
                                                        await launchURL(
                                                            newISCstring!);
                                                      }
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                        'Seeyouthere',
                                                        queryParams: {
                                                          'attending':
                                                              serializeParam(
                                                            true,
                                                            ParamType.bool,
                                                          ),
                                                          'message':
                                                              serializeParam(
                                                            rsEventsRecord!
                                                                .attendingMessage,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .scale,
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                          ),
                                                        },
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_trigger_push_notification');
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            'RSVP Declined From ${guestNameController!.text}',
                                                        notificationText:
                                                            '${guestNameController!.text} have declined the invitation for your event',
                                                        notificationSound:
                                                            'default',
                                                        userRefs: [
                                                          rsEventsRecord!
                                                              .eventHost!
                                                        ],
                                                        initialPageName:
                                                            'EventDetails',
                                                        parameterData: {
                                                          'selectedEventID':
                                                              widget.vp,
                                                        },
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                        'Seeyouthere',
                                                        queryParams: {
                                                          'attending':
                                                              serializeParam(
                                                            true,
                                                            ParamType.bool,
                                                          ),
                                                          'message':
                                                              serializeParam(
                                                            rsEventsRecord!
                                                                .notAttendingMessage,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .scale,
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Please Confirm Guest Count',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2,
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0xFFF37C51),
                                                    ),
                                                  );
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please Confirm Guest Name',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0xFFF37C51),
                                                  ),
                                                );
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                            },
                                            text: FFAppState().rsvpButtonText,
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [],
                                    ),
                                  ],
                                ),
                              if (rsEventsRecord!.eventDate! <
                                  getCurrentTimestamp)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 60, 20, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'You\'ve missed this event, so the details are no longer available.\n\nIf you\'d like to use Wanacome to help organise your next event, download it from the appstores below.',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'RS_PAGE_Image_kg0p0npy_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_launch_u_r_l');
                                            await launchURL(
                                                FFAppState().AppleAppStoreURL);
                                          },
                                          child: Image.asset(
                                            'assets/images/apple_appstore.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'RS_PAGE_Image_2pw5z9tn_ON_TAP');
                                              logFirebaseEvent(
                                                  'Image_launch_u_r_l');
                                              await launchURL(
                                                  FFAppState().GooglePlayURL);
                                            },
                                            child: Image.asset(
                                              'assets/images/google_play.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              if (!isWeb)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'RS_PAGE_BACK_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_navigate_back');
                                          context.pop();
                                        },
                                        text: 'Back',
                                        icon: Icon(
                                          Icons.chevron_left_rounded,
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
