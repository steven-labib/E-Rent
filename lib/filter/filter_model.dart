import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'filter_widget.dart' show FilterWidget;
import 'package:flutter/material.dart';

class FilterModel extends FlutterFlowModel<FilterWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  // State field(s) for minprice widget.
  FocusNode? minpriceFocusNode;
  TextEditingController? minpriceTextController;
  String? Function(BuildContext, String?)? minpriceTextControllerValidator;
  // State field(s) for maxPrice widget.
  FocusNode? maxPriceFocusNode;
  TextEditingController? maxPriceTextController;
  String? Function(BuildContext, String?)? maxPriceTextControllerValidator;
  // State field(s) for Rooms widget.
  int? roomsValue;
  // State field(s) for Beds widget.
  int? bedsValue;
  // State field(s) for Baths widget.
  int? bathsValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    minpriceFocusNode?.dispose();
    minpriceTextController?.dispose();

    maxPriceFocusNode?.dispose();
    maxPriceTextController?.dispose();
  }
}
