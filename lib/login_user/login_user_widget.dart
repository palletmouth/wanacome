import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginUserWidget extends StatefulWidget {
  const LoginUserWidget({Key? key}) : super(key: key);

  @override
  _LoginUserWidgetState createState() => _LoginUserWidgetState();
}

class _LoginUserWidgetState extends State<LoginUserWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_USER_PAGE_LoginUser_ON_PAGE_LOAD');
      logFirebaseEvent('LoginUser_custom_action');
      await actions.lockOrientation();
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LoginUser'});
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'LoginUser',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 1),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Wanacome_logo-01.png',
                              width: 240,
                              height: 60,
                              fit: BoxFit.fitWidth,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation']!),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Who\'s Come To Your Get-togethers?',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/login_background.png',
                        width: 270,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x24000000),
                              offset: Offset(0, -1),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Welcome Back,',
                                      style:
                                          FlutterFlowTheme.of(context).title1,
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 44,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.phone_enabled,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: emailAddressController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                        hintText: 'Enter your email here...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16, 24, 0, 24),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                      maxLines: null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: passwordController,
                                      obscureText: !passwordVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                        hintText: 'Enter your password here...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16, 24, 0, 24),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => passwordVisibility =
                                                !passwordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF95A1AC),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                      minLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 12, 20, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () {
                                      print('ButtonForgotPassword pressed ...');
                                    },
                                    text: 'Forgot Password?',
                                    options: FFButtonOptions(
                                      width: 170,
                                      height: 50,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'LOGIN_USER_PAGE_ButtonLogin_ON_TAP');
                                      logFirebaseEvent('ButtonLogin_auth');
                                      GoRouter.of(context).prepareAuthEvent();

                                      final user = await signInWithEmail(
                                        context,
                                        emailAddressController!.text,
                                        passwordController!.text,
                                      );
                                      if (user == null) {
                                        return;
                                      }

                                      context.goNamedAuth('HomePage', mounted);
                                    },
                                    text: 'Login',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 50,
                                      color: Color(0xFF4E376B),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 2,
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
                            Divider(
                              height: 2,
                              thickness: 2,
                              indent: 20,
                              endIndent: 20,
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 44),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LOGIN_USER_ButtonCreateAccount_ON_TAP');
                                  logFirebaseEvent(
                                      'ButtonCreateAccount_navigate_to');

                                  context.pushNamed('RegisterUser');
                                },
                                text: 'Create Account',
                                options: FFButtonOptions(
                                  width: 170,
                                  height: 40,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
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
          ),
        ));
  }
}
