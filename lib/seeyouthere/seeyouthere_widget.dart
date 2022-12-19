import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SeeyouthereWidget extends StatefulWidget {
  const SeeyouthereWidget({
    Key? key,
    this.attending,
    this.message,
  }) : super(key: key);

  final bool? attending;
  final String? message;

  @override
  _SeeyouthereWidgetState createState() => _SeeyouthereWidgetState();
}

class _SeeyouthereWidgetState extends State<SeeyouthereWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SEEYOUTHERE_Seeyouthere_ON_LOAD');
      logFirebaseEvent('Seeyouthere_custom_action');
      await actions.lockOrientation();
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Seeyouthere'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'See You At The Party',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      if (widget.attending ?? true)
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          child: custom_widgets.ConfettiOverlay(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            loop: true,
                            particleCount: 10,
                            gravity: 1.0,
                          ),
                        ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(50, 50, 50, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/Wanacome_logo-02.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 60, 20, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.message!,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF3D2072),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 60, 20, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'If you\'d like to use Wanacome to help organise your events, download it from the appstores below.',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SEEYOUTHERE_PAGE_Image_44egw6rz_ON_TAP');
                                              logFirebaseEvent(
                                                  'Image_launch_u_r_l');
                                              await launchURL(FFAppState()
                                                  .AppleAppStoreURL);
                                            },
                                            child: Image.asset(
                                              'assets/images/apple_appstore.png',
                                              fit: BoxFit.fill,
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
                                                'SEEYOUTHERE_PAGE_Image_o4tmkr25_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_launch_u_r_l');
                                            await launchURL(
                                                FFAppState().GooglePlayURL);
                                          },
                                          child: Image.asset(
                                            'assets/images/google_play.png',
                                            fit: BoxFit.fill,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
