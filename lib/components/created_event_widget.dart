import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class CreatedEventWidget extends StatefulWidget {
  const CreatedEventWidget({
    Key? key,
    this.eventID,
  }) : super(key: key);

  final String? eventID;

  @override
  _CreatedEventWidgetState createState() => _CreatedEventWidgetState();
}

class _CreatedEventWidgetState extends State<CreatedEventWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 700,
              constraints: BoxConstraints(
                maxHeight: 280,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/invitation_background_1.png',
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
                    FlutterFlowTheme.of(context).secondaryColor,
                    FlutterFlowTheme.of(context).alternate
                  ],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0, -1),
                  end: AlignmentDirectional(0, 1),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Awesome',
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .buttonBackground,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'You\'ve created an event,  now spread the word and invite your guests.',
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CREATED_EVENT_SHARE_YOUR_EVENT_BTN_ON_TA');
                                    logFirebaseEvent('Button_share');
                                    await Share.share(
                                        '${FFAppState().shareURL}${widget.eventID}');
                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);
                                  },
                                  text: 'Share Your Event',
                                  icon: Icon(
                                    Icons.ios_share,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 220,
                                    height: 50,
                                    color: Color(0xFF54BA5A),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CREATED_EVENT_COMP_CANCEL_BTN_ON_TAP');
                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);
                                  },
                                  text: 'Cancel',
                                  options: FFButtonOptions(
                                    width: 140,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .buttonBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
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
            ),
          ),
        ],
      ),
    );
  }
}
