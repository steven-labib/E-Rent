import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_profile2_widget.dart' show EditProfile2Widget;
import 'package:flutter/material.dart';

class EditProfile2Model extends FlutterFlowModel<EditProfile2Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for ssn widget.
  FocusNode? ssnFocusNode;
  TextEditingController? ssnTextController;
  String? Function(BuildContext, String?)? ssnTextControllerValidator;
  // State field(s) for college widget.
  FocusNode? collegeFocusNode;
  TextEditingController? collegeTextController;
  String? Function(BuildContext, String?)? collegeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

    ssnFocusNode?.dispose();
    ssnTextController?.dispose();

    collegeFocusNode?.dispose();
    collegeTextController?.dispose();
  }
}
