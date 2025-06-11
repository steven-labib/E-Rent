import '/backend/backend.dart';
import '/components/show_review_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_widget.dart' show DetailWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DetailModel extends FlutterFlowModel<DetailWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for amentities widget.
  FormFieldController<List<String>>? amentitiesValueController;
  String? get amentitiesValue => amentitiesValueController?.value?.firstOrNull;
  set amentitiesValue(String? val) =>
      amentitiesValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ReviewsRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Models for showReview dynamic component.
  late FlutterFlowDynamicModels<ShowReviewModel> showReviewModels;

  @override
  void initState(BuildContext context) {
    showReviewModels = FlutterFlowDynamicModels(() => ShowReviewModel());
  }

  @override
  void dispose() {
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    showReviewModels.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ReviewsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ReviewsRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ReviewsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryReviewsRecordPage(
          parent: parent,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
