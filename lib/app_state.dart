import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  DateTime? _startDate = DateTime.fromMillisecondsSinceEpoch(1741038300000);
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
  }

  DateTime? _endDate = DateTime.fromMillisecondsSinceEpoch(1741643100000);
  DateTime? get endDate => _endDate;
  set endDate(DateTime? value) {
    _endDate = value;
  }

  String _choic = '';
  String get choic => _choic;
  set choic(String value) {
    _choic = value;
  }

  List<String> _filterElectronics = [];
  List<String> get filterElectronics => _filterElectronics;
  set filterElectronics(List<String> value) {
    _filterElectronics = value;
  }

  void addToFilterElectronics(String value) {
    filterElectronics.add(value);
  }

  void removeFromFilterElectronics(String value) {
    filterElectronics.remove(value);
  }

  void removeAtIndexFromFilterElectronics(int index) {
    filterElectronics.removeAt(index);
  }

  void updateFilterElectronicsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filterElectronics[index] = updateFn(_filterElectronics[index]);
  }

  void insertAtIndexInFilterElectronics(int index, String value) {
    filterElectronics.insert(index, value);
  }

  int _MinPrice = 0;
  int get MinPrice => _MinPrice;
  set MinPrice(int value) {
    _MinPrice = value;
  }

  int _FilterRooms = 0;
  int get FilterRooms => _FilterRooms;
  set FilterRooms(int value) {
    _FilterRooms = value;
  }

  int _filterBeds = 0;
  int get filterBeds => _filterBeds;
  set filterBeds(int value) {
    _filterBeds = value;
  }

  int _fillterBaths = 0;
  int get fillterBaths => _fillterBaths;
  set fillterBaths(int value) {
    _fillterBaths = value;
  }

  int _MaxPrice = 0;
  int get MaxPrice => _MaxPrice;
  set MaxPrice(int value) {
    _MaxPrice = value;
  }

  bool _filterResult = false;
  bool get filterResult => _filterResult;
  set filterResult(bool value) {
    _filterResult = value;
  }

  bool _home = false;
  bool get home => _home;
  set home(bool value) {
    _home = value;
  }

  bool _map = false;
  bool get map => _map;
  set map(bool value) {
    _map = value;
  }

  bool _favorite = false;
  bool get favorite => _favorite;
  set favorite(bool value) {
    _favorite = value;
  }

  bool _trip = false;
  bool get trip => _trip;
  set trip(bool value) {
    _trip = value;
  }

  bool _profile = false;
  bool get profile => _profile;
  set profile(bool value) {
    _profile = value;
  }

  bool _addPlace = false;
  bool get addPlace => _addPlace;
  set addPlace(bool value) {
    _addPlace = value;
  }
}
