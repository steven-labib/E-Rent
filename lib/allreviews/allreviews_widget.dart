import '/backend/backend.dart';
import '/components/show_review_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'allreviews_model.dart';
export 'allreviews_model.dart';

class AllreviewsWidget extends StatefulWidget {
  const AllreviewsWidget({
    super.key,
    required this.reviews,
    required this.placeRef,
  });

  final ReviewsRecord? reviews;
  final PlacesRecord? placeRef;

  static String routeName = 'allreviews';
  static String routePath = '/allreviews';

  @override
  State<AllreviewsWidget> createState() => _AllreviewsWidgetState();
}

class _AllreviewsWidgetState extends State<AllreviewsWidget> {
  late AllreviewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllreviewsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF57636C),
            size: 25.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<ReviewsRecord>>(
                stream: queryReviewsRecord(
                  parent: widget.placeRef?.reference,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<ReviewsRecord> listViewReviewsRecordList =
                      snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewReviewsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewReviewsRecord =
                          listViewReviewsRecordList[listViewIndex];
                      return StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(
                            listViewReviewsRecord.userRef!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }

                          final showReviewUsersRecord = snapshot.data!;

                          return wrapWithModel(
                            model: _model.showReviewModels.getModel(
                              widget.placeRef!.reference.id,
                              listViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: ShowReviewWidget(
                              key: Key(
                                'Keyfbf_${widget.placeRef!.reference.id}',
                              ),
                              userimage: showReviewUsersRecord.photoUrl,
                              username: showReviewUsersRecord.displayName,
                              rating: listViewReviewsRecord.rating,
                              review: listViewReviewsRecord.review,
                              timeReview: listViewReviewsRecord.timeReview!,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ].divide(SizedBox(height: 12.0)).addToStart(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
