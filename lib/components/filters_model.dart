import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filters_widget.dart' show FiltersWidget;
import 'package:flutter/material.dart';

class FiltersModel extends FlutterFlowModel<FiltersWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  List<String>? get choiceChipsValues2 => choiceChipsValueController2?.value;
  set choiceChipsValues2(List<String>? val) =>
      choiceChipsValueController2?.value = val;
  // State field(s) for MinPrice widget.
  FocusNode? minPriceFocusNode;
  TextEditingController? minPriceTextController;
  String? Function(BuildContext, String?)? minPriceTextControllerValidator;
  // State field(s) for MaxPrice widget.
  FocusNode? maxPriceFocusNode;
  TextEditingController? maxPriceTextController;
  String? Function(BuildContext, String?)? maxPriceTextControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // State field(s) for CountController widget.
  int? countControllerValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    minPriceFocusNode?.dispose();
    minPriceTextController?.dispose();

    maxPriceFocusNode?.dispose();
    maxPriceTextController?.dispose();
  }
}
