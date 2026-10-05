import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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

  String _historyPeriod = '24 Hours';
  String get historyPeriod => _historyPeriod;
  set historyPeriod(String value) {
    _historyPeriod = value;
  }

  bool _pushEnabled = true;
  bool get pushEnabled => _pushEnabled;
  set pushEnabled(bool value) {
    _pushEnabled = value;
  }

  bool _emailEnabled = false;
  bool get emailEnabled => _emailEnabled;
  set emailEnabled(bool value) {
    _emailEnabled = value;
  }

  bool _soundEnabled = true;
  bool get soundEnabled => _soundEnabled;
  set soundEnabled(bool value) {
    _soundEnabled = value;
  }

  int _thresholdAqi = 150;
  int get thresholdAqi => _thresholdAqi;
  set thresholdAqi(int value) {
    _thresholdAqi = value;
  }

  double _thresholdPm25 = 35.0;
  double get thresholdPm25 => _thresholdPm25;
  set thresholdPm25(double value) {
    _thresholdPm25 = value;
  }

  double _thresholdCo = 9.0;
  double get thresholdCo => _thresholdCo;
  set thresholdCo(double value) {
    _thresholdCo = value;
  }
}
