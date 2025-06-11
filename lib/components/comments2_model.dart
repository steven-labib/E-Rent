import '/flutter_flow/flutter_flow_util.dart';
import 'comments2_widget.dart' show Comments2Widget;
import 'package:flutter/material.dart';

class Comments2Model extends FlutterFlowModel<Comments2Widget> {
  ///  State fields for stateful widgets in this component.

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
