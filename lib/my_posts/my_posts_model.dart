import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_posts_widget.dart' show MyPostsWidget;
import 'package:flutter/material.dart';

class MyPostsModel extends FlutterFlowModel<MyPostsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
