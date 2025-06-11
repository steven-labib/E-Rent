import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              1.0,
            ),
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  HomeWidget.routeName,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );

                FFAppState().home = true;
                FFAppState().map = false;
                FFAppState().favorite = false;
                FFAppState().trip = false;
                FFAppState().profile = false;
                FFAppState().addPlace = false;
                safeSetState(() {});
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      if (FFAppState().home == true)
                        Icon(
                          Icons.home_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      if (FFAppState().home == false)
                        Icon(
                          Icons.home_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  FavoritesWidget.routeName,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );

                FFAppState().home = false;
                FFAppState().map = false;
                FFAppState().favorite = true;
                FFAppState().trip = false;
                FFAppState().profile = false;
                FFAppState().addPlace = false;
                safeSetState(() {});
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      if (FFAppState().favorite == true)
                        Icon(
                          Icons.favorite_sharp,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      if (FFAppState().favorite == false)
                        Icon(
                          Icons.favorite_sharp,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (valueOrDefault<bool>(currentUserDocument?.admin, false) == true)
              AuthUserStreamWidget(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(AddPlaceWidget.routeName);

                    FFAppState().home = false;
                    FFAppState().map = false;
                    FFAppState().favorite = false;
                    FFAppState().trip = false;
                    FFAppState().profile = false;
                    FFAppState().addPlace = true;
                    safeSetState(() {});
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          if (FFAppState().addPlace == true)
                            Icon(
                              Icons.add_circle,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 42.0,
                            ),
                          if (FFAppState().addPlace == false)
                            Icon(
                              Icons.add_circle,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 42.0,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            Stack(
              children: [
                if (valueOrDefault<bool>(currentUserDocument?.admin, false) ==
                    true)
                  AuthUserStreamWidget(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          MyPostsWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );

                        FFAppState().home = false;
                        FFAppState().map = false;
                        FFAppState().favorite = false;
                        FFAppState().trip = true;
                        FFAppState().profile = false;
                        FFAppState().addPlace = false;
                        safeSetState(() {});
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              if (FFAppState().trip == true)
                                Icon(
                                  Icons.bookmark_added_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              if (FFAppState().trip == false)
                                Icon(
                                  Icons.bookmark_added_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (valueOrDefault<bool>(currentUserDocument?.admin, false) ==
                    false)
                  AuthUserStreamWidget(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          BookingWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );

                        FFAppState().home = false;
                        FFAppState().map = false;
                        FFAppState().favorite = false;
                        FFAppState().trip = true;
                        FFAppState().profile = false;
                        FFAppState().addPlace = false;
                        safeSetState(() {});
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              if (FFAppState().trip == true)
                                Icon(
                                  Icons.photo_album,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              if (FFAppState().trip == false)
                                Icon(
                                  Icons.photo_album,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  ProfileWidget.routeName,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );

                FFAppState().home = false;
                FFAppState().map = false;
                FFAppState().favorite = false;
                FFAppState().trip = false;
                FFAppState().profile = true;
                FFAppState().addPlace = false;
                safeSetState(() {});
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      if (FFAppState().profile == true)
                        Icon(
                          Icons.person,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      if (FFAppState().profile == false)
                        Icon(
                          Icons.person,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
