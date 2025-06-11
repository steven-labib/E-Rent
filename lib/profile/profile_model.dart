import '/components/notificationowner1_widget.dart';
import '/components/notificationstudent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for notificationstudent component.
  late NotificationstudentModel notificationstudentModel;
  // Model for notificationowner1 component.
  late Notificationowner1Model notificationowner1Model;

  @override
  void initState(BuildContext context) {
    notificationstudentModel =
        createModel(context, () => NotificationstudentModel());
    notificationowner1Model =
        createModel(context, () => Notificationowner1Model());
  }

  @override
  void dispose() {
    notificationstudentModel.dispose();
    notificationowner1Model.dispose();
  }
}
