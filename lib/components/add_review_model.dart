import '/flutter_flow/flutter_flow_util.dart';
import 'add_review_widget.dart' show AddReviewWidget;
import 'package:flutter/material.dart';

class AddReviewModel extends FlutterFlowModel<AddReviewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for inputReview widget.
  FocusNode? inputReviewFocusNode;
  TextEditingController? inputReviewTextController;
  String? Function(BuildContext, String?)? inputReviewTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputReviewFocusNode?.dispose();
    inputReviewTextController?.dispose();
  }
}
