import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/components/show_place_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for inputSearch widget.
  FocusNode? inputSearchFocusNode;
  TextEditingController? inputSearchTextController;
  String? Function(BuildContext, String?)? inputSearchTextControllerValidator;
  List<PlacesRecord> simpleSearchResults = [];
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Models for showPlace dynamic component.
  late FlutterFlowDynamicModels<ShowPlaceModel> showPlaceModels1;
  // Models for showPlace dynamic component.
  late FlutterFlowDynamicModels<ShowPlaceModel> showPlaceModels2;
  // Models for showPlace dynamic component.
  late FlutterFlowDynamicModels<ShowPlaceModel> showPlaceModels3;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    showPlaceModels1 = FlutterFlowDynamicModels(() => ShowPlaceModel());
    showPlaceModels2 = FlutterFlowDynamicModels(() => ShowPlaceModel());
    showPlaceModels3 = FlutterFlowDynamicModels(() => ShowPlaceModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    inputSearchFocusNode?.dispose();
    inputSearchTextController?.dispose();

    showPlaceModels1.dispose();
    showPlaceModels2.dispose();
    showPlaceModels3.dispose();
    navBarModel.dispose();
  }
}
