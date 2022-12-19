import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/created_event_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class CreateEventWidget extends StatefulWidget {
  const CreateEventWidget({Key? key}) : super(key: key);

  @override
  _CreateEventWidgetState createState() => _CreateEventWidgetState();
}

class _CreateEventWidgetState extends State<CreateEventWidget> {
  AudioPlayer? soundPlayer;
  TextEditingController? attendingMessageFieldController;
  TextEditingController? eventDescController;
  TextEditingController? eventNameController;
  TextEditingController? eventLocationController;
  TextEditingController? eventLocationDefaultController;
  TextEditingController? notAttendingMessageFieldController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  ScrollController? columnController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATE_EVENT_CreateEvent_ON_LOAD');
      logFirebaseEvent('CreateEvent_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('CreateEvent_update_local_state');
      setState(() {
        FFAppState().newEventDate = getCurrentTimestamp;
        FFAppState().eventSaved = false;
      });
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CreateEvent'});
    attendingMessageFieldController = TextEditingController(
        text: 'Thankyou for letting us know, we hope you have a great event.');
    eventDescController = TextEditingController();
    eventNameController = TextEditingController();
    eventLocationController = TextEditingController();
    eventLocationDefaultController = TextEditingController(
        text: valueOrDefault(currentUserDocument?.address, ''));
    notAttendingMessageFieldController = TextEditingController(
        text:
            'Thankyou for letting us know, gutted you won\'t be able to make it.');
    columnController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    attendingMessageFieldController?.dispose();
    eventDescController?.dispose();
    eventNameController?.dispose();
    eventLocationController?.dispose();
    eventLocationDefaultController?.dispose();
    notAttendingMessageFieldController?.dispose();
    columnController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'CreateEvent',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).alternate,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/hb_4.png',
                            ).image,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 60, 0, 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CREATE_EVENT_PAGE_Icon_kz7zlvre_ON_TAP');
                                      if (FFAppState().eventSaved == true) {
                                        logFirebaseEvent('Icon_navigate_to');

                                        context.pushNamed('HomePage');

                                        logFirebaseEvent('Icon_custom_action');
                                        await actions.displayNewEventDate(
                                          datePicked2!,
                                        );
                                        return;
                                      } else {
                                        logFirebaseEvent('Icon_alert_dialog');
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'continue without saving?'),
                                                      content: Text(
                                                          'Are you sure you want to continue without saving?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text(
                                                              'No, keep editing'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text(
                                                              'Yes, Forget Changes'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          logFirebaseEvent('Icon_navigate_to');

                                          context.pushNamed('HomePage');

                                          logFirebaseEvent(
                                              'Icon_custom_action');
                                          await actions.displayNewEventDate(
                                            datePicked2!,
                                          );
                                          return;
                                        } else {
                                          logFirebaseEvent('Icon_scroll_to');
                                          await columnController?.animateTo(
                                            columnController!
                                                .position.maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );
                                          logFirebaseEvent(
                                              'Icon_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Click \"Create Event\" To Save',
                                                style: GoogleFonts.getFont(
                                                  'Poppins',
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .bigRoundButton,
                                            ),
                                          );
                                          return;
                                        }
                                      }
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 50, 20, 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SelectionArea(
                                            child: Text(
                                          'Create New Event',
                                          style: FlutterFlowTheme.of(context)
                                              .title2
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SelectionArea(
                                            child: Text(
                                          'Time To Start The Fun',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .buttonBackground,
                                              ),
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      controller: columnController,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFFEDD8FB),
                                                          Color(0xFFFEEFEC)
                                                        ],
                                                        stops: [0, 1],
                                                        begin:
                                                            AlignmentDirectional(
                                                                1, -1),
                                                        end:
                                                            AlignmentDirectional(
                                                                -1, 1),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            if (FFAppState().NewEventDateDay != null &&
                                                                                FFAppState().NewEventDateDay != '')
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.7,
                                                                                height: 70,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  FFAppState().NewEventDateMonth,
                                                                                                  'Dec',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                    ),
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                FFAppState().NewEventDateDay,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).buttonBackground,
                                                                                                      fontSize: 20,
                                                                                                    ),
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 1,
                                                                                          height: 40,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFF6F6E6E),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    FFAppState().NewEventDateDoW,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: Colors.white,
                                                                                                          fontSize: 16,
                                                                                                        ),
                                                                                                  )),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    FFAppState().NewEventDateTime,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                  )),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            if (FFAppState().NewEventDateDay == null ||
                                                                                FFAppState().NewEventDateDay == '')
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.7,
                                                                                height: 70,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                                                                                        child: InkWell(
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('CREATE_EVENT_PAGE_Column_v29x4f6d_ON_TAP');
                                                                                            logFirebaseEvent('Column_date_time_picker');
                                                                                            if (kIsWeb) {
                                                                                              final _datePicked1Date = await showDatePicker(
                                                                                                context: context,
                                                                                                initialDate: FFAppState().newEventDate!,
                                                                                                firstDate: FFAppState().newEventDate!,
                                                                                                lastDate: DateTime(2050),
                                                                                              );

                                                                                              TimeOfDay? _datePicked1Time;
                                                                                              if (_datePicked1Date != null) {
                                                                                                _datePicked1Time = await showTimePicker(
                                                                                                  context: context,
                                                                                                  initialTime: TimeOfDay.fromDateTime(FFAppState().newEventDate!),
                                                                                                );
                                                                                              }

                                                                                              if (_datePicked1Date != null && _datePicked1Time != null) {
                                                                                                setState(
                                                                                                  () => datePicked1 = DateTime(
                                                                                                    _datePicked1Date.year,
                                                                                                    _datePicked1Date.month,
                                                                                                    _datePicked1Date.day,
                                                                                                    _datePicked1Time!.hour,
                                                                                                    _datePicked1Time.minute,
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                            } else {
                                                                                              await DatePicker.showDateTimePicker(
                                                                                                context,
                                                                                                showTitleActions: true,
                                                                                                onConfirm: (date) {
                                                                                                  setState(() => datePicked1 = date);
                                                                                                },
                                                                                                currentTime: FFAppState().newEventDate!,
                                                                                                minTime: FFAppState().newEventDate!,
                                                                                              );
                                                                                            }

                                                                                            logFirebaseEvent('Column_custom_action');
                                                                                            await actions.displayNewEventDate(
                                                                                              datePicked1!,
                                                                                            );
                                                                                          },
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    'Tap To Set Event Date',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).buttonBackground,
                                                                                                          fontSize: 20,
                                                                                                        ),
                                                                                                  )),
                                                                                                ],
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
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('CREATE_EVENT_PAGE_Icon_yq6zojt2_ON_TAP');
                                                                                logFirebaseEvent('Icon_date_time_picker');
                                                                                if (kIsWeb) {
                                                                                  final _datePicked2Date = await showDatePicker(
                                                                                    context: context,
                                                                                    initialDate: FFAppState().newEventDate!,
                                                                                    firstDate: FFAppState().newEventDate!,
                                                                                    lastDate: DateTime(2050),
                                                                                  );

                                                                                  TimeOfDay? _datePicked2Time;
                                                                                  if (_datePicked2Date != null) {
                                                                                    _datePicked2Time = await showTimePicker(
                                                                                      context: context,
                                                                                      initialTime: TimeOfDay.fromDateTime(FFAppState().newEventDate!),
                                                                                    );
                                                                                  }

                                                                                  if (_datePicked2Date != null && _datePicked2Time != null) {
                                                                                    setState(
                                                                                      () => datePicked2 = DateTime(
                                                                                        _datePicked2Date.year,
                                                                                        _datePicked2Date.month,
                                                                                        _datePicked2Date.day,
                                                                                        _datePicked2Time!.hour,
                                                                                        _datePicked2Time.minute,
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                } else {
                                                                                  await DatePicker.showDateTimePicker(
                                                                                    context,
                                                                                    showTitleActions: true,
                                                                                    onConfirm: (date) {
                                                                                      setState(() => datePicked2 = date);
                                                                                    },
                                                                                    currentTime: FFAppState().newEventDate!,
                                                                                    minTime: FFAppState().newEventDate!,
                                                                                  );
                                                                                }

                                                                                logFirebaseEvent('Icon_custom_action');
                                                                                await actions.displayNewEventDate(
                                                                                  datePicked2!,
                                                                                );
                                                                              },
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.edit,
                                                                                color: Colors.black,
                                                                                size: 32,
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Form(
                                                key: formKey,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 10,
                                                                  20, 20),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  eventNameController,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Name of Event',
                                                                labelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).buttonBackground,
                                                                        ),
                                                                hintText:
                                                                    'Give your event a name',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFF636363),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFF636363),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .buttonBackground,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .buttonBackground,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                              validator: (val) {
                                                                if (val ==
                                                                        null ||
                                                                    val.isEmpty) {
                                                                  return 'Give The Event A Name';
                                                                }

                                                                if (val.length <
                                                                    5) {
                                                                  return 'Requires at least 5 characters.';
                                                                }

                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 10,
                                                                  20, 20),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  eventDescController,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Event Details',
                                                                labelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).buttonBackground,
                                                                        ),
                                                                hintText:
                                                                    'Tell your guests all about it',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFF636363),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFF636363),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .buttonBackground,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .buttonBackground,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                              validator: (val) {
                                                                if (val ==
                                                                        null ||
                                                                    val.isEmpty) {
                                                                  return 'Tell Your Guests About It';
                                                                }

                                                                if (val.length <
                                                                    5) {
                                                                  return 'Requires at least 5 characters.';
                                                                }

                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (!FFAppState()
                                                        .useDefaultAddress)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    10, 20, 20),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    eventLocationController,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Location',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .buttonBackground,
                                                                      ),
                                                                  hintText:
                                                                      'Let them know how to find it',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFF636363),
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFF636363),
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .buttonBackground,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .buttonBackground,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .streetAddress,
                                                                validator:
                                                                    (val) {
                                                                  if (val ==
                                                                          null ||
                                                                      val.isEmpty) {
                                                                    return 'Make Sure They Know Where It Is';
                                                                  }

                                                                  if (val.length <
                                                                      5) {
                                                                    return 'Requires at least 5 characters.';
                                                                  }

                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 50,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .buttonBackground,
                                                                icon: Icon(
                                                                  Icons
                                                                      .add_business,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'CREATE_EVENT_add_business_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_update_local_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .useDefaultAddress =
                                                                        true;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                        .useDefaultAddress)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    10, 20, 20),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      eventLocationDefaultController,
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Location',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).buttonBackground,
                                                                        ),
                                                                    hintText:
                                                                        'Let them know how to find it',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFF636363),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFF636363),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .buttonBackground,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .buttonBackground,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .streetAddress,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 50,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bigRoundButton,
                                                                icon: Icon(
                                                                  Icons
                                                                      .edit_outlined,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'CREATE_EVENT_edit_outlined_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_update_local_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .useDefaultAddress =
                                                                        false;
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'IconButton_clear_text_fields');
                                                                  setState(() {
                                                                    eventLocationController
                                                                        ?.clear();
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 10,
                                                                  20, 20),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  attendingMessageFieldController,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Guests Attending Message',
                                                                labelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).buttonBackground,
                                                                        ),
                                                                hintText:
                                                                    'Message After RSVP Accepted',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFF636363),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFF636363),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .buttonBackground,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .buttonBackground,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                              validator: (val) {
                                                                if (val ==
                                                                        null ||
                                                                    val.isEmpty) {
                                                                  return 'Field is required';
                                                                }

                                                                if (val.length <
                                                                    5) {
                                                                  return 'Requires at least 5 characters.';
                                                                }

                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 10,
                                                                  20, 20),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  notAttendingMessageFieldController,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Guest Declined Message',
                                                                labelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).buttonBackground,
                                                                        ),
                                                                hintText:
                                                                    'Message After RSVP Declined',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFF636363),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFF636363),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .buttonBackground,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .buttonBackground,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                              validator: (val) {
                                                                if (val ==
                                                                        null ||
                                                                    val.isEmpty) {
                                                                  return 'Field is required';
                                                                }

                                                                if (val.length <
                                                                    5) {
                                                                  return 'Requires at least 5 characters.';
                                                                }

                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 10,
                                                                  20, 20),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'CREATE_EVENT_PAGE_ButtonUpdate_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'ButtonUpdate_update_local_state');
                                                              setState(() {
                                                                FFAppState()
                                                                        .NewEventID =
                                                                    random_data
                                                                        .randomString(
                                                                  10,
                                                                  10,
                                                                  true,
                                                                  true,
                                                                  true,
                                                                );
                                                              });
                                                              if (eventNameController!
                                                                          .text !=
                                                                      null &&
                                                                  eventNameController!
                                                                          .text !=
                                                                      '') {
                                                                if (FFAppState()
                                                                        .newEventDate! >=
                                                                    getCurrentTimestamp) {
                                                                  if (eventDescController!
                                                                              .text !=
                                                                          null &&
                                                                      eventDescController!
                                                                              .text !=
                                                                          '') {
                                                                    if (functions.canSaveLocation(
                                                                        eventLocationController!
                                                                            .text,
                                                                        FFAppState()
                                                                            .useDefaultAddress)) {
                                                                      if (FFAppState()
                                                                          .useDefaultAddress) {
                                                                        logFirebaseEvent(
                                                                            'ButtonUpdate_update_local_state');
                                                                        setState(
                                                                            () {
                                                                          FFAppState().defaultLocation =
                                                                              eventLocationDefaultController!.text;
                                                                        });
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'ButtonUpdate_update_local_state');
                                                                        setState(
                                                                            () {
                                                                          FFAppState().defaultLocation =
                                                                              eventLocationController!.text;
                                                                        });
                                                                      }

                                                                      logFirebaseEvent(
                                                                          'ButtonUpdate_backend_call');

                                                                      final eventsCreateData =
                                                                          createEventsRecordData(
                                                                        eventTitle:
                                                                            eventNameController!.text,
                                                                        eventDate:
                                                                            FFAppState().newEventDate,
                                                                        eventDescription:
                                                                            eventDescController!.text,
                                                                        eventLocation:
                                                                            FFAppState().defaultLocation,
                                                                        eventHost:
                                                                            currentUserReference,
                                                                        eventId:
                                                                            FFAppState().NewEventID,
                                                                        runningCountAccepted:
                                                                            0,
                                                                        runningCountDeclined:
                                                                            0,
                                                                        attendingMessage:
                                                                            attendingMessageFieldController!.text,
                                                                        notAttendingMessage:
                                                                            notAttendingMessageFieldController!.text,
                                                                        eventCreateDate:
                                                                            getCurrentTimestamp,
                                                                      );
                                                                      await EventsRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              eventsCreateData);
                                                                      logFirebaseEvent(
                                                                          'ButtonUpdate_backend_call');

                                                                      final usersUpdateData =
                                                                          {
                                                                        'event_count':
                                                                            FieldValue.increment(1),
                                                                      };
                                                                      await currentUserReference!
                                                                          .update(
                                                                              usersUpdateData);
                                                                      logFirebaseEvent(
                                                                          'ButtonUpdate_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                CreatedEventWidget(
                                                                              eventID: FFAppState().NewEventID,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));

                                                                      logFirebaseEvent(
                                                                          'ButtonUpdate_play_sound');
                                                                      soundPlayer ??=
                                                                          AudioPlayer();
                                                                      if (soundPlayer!
                                                                          .playing) {
                                                                        await soundPlayer!
                                                                            .stop();
                                                                      }

                                                                      await soundPlayer!
                                                                          .setUrl(
                                                                              'https://www.wanacome.com/sounds/cheer.wav')
                                                                          .then((_) =>
                                                                              soundPlayer!.play());

                                                                      logFirebaseEvent(
                                                                          'ButtonUpdate_update_local_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().eventSaved =
                                                                            true;
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'ButtonUpdate_wait__delay');
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              1000));
                                                                      logFirebaseEvent(
                                                                          'ButtonUpdate_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'EventDetails',
                                                                        queryParams:
                                                                            {
                                                                          'selectedEventID':
                                                                              serializeParam(
                                                                            FFAppState().NewEventID,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.bottomToTop,
                                                                          ),
                                                                        },
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'ButtonUpdate_show_snack_bar');
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Make Sure You Tell Them Where It\'s Happening',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).bigRoundButton,
                                                                        ),
                                                                      );
                                                                      return;
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'ButtonUpdate_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Make Sure You Tell Them About The Event',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).bigRoundButton,
                                                                      ),
                                                                    );
                                                                    return;
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'ButtonUpdate_show_snack_bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Make Sure You Set The Event Date',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bigRoundButton,
                                                                    ),
                                                                  );
                                                                  return;
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'ButtonUpdate_show_snack_bar');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Make Sure You Give The Event A Name',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bigRoundButton,
                                                                  ),
                                                                );
                                                                return;
                                                              }
                                                            },
                                                            text:
                                                                'Create Event',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 160,
                                                              height: 50,
                                                              color: Color(
                                                                  0xFF3D2072),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 2,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
        ));
  }
}
