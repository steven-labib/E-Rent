import '/flutter_flow/flutter_flow_util.dart';
import 'ppayy_widget.dart' show PpayyWidget;
import 'package:flutter/material.dart';

class PpayyModel extends FlutterFlowModel<PpayyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Bankaccount widget.
  FocusNode? bankaccountFocusNode;
  TextEditingController? bankaccountTextController;
  String? Function(BuildContext, String?)? bankaccountTextControllerValidator;
  // State field(s) for Code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bankaccountFocusNode?.dispose();
    bankaccountTextController?.dispose();

    codeFocusNode?.dispose();
    codeTextController?.dispose();
  }
}
