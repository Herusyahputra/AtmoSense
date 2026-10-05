import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

dynamic latestReading(List<SensorReadingsRecord> sensorReadings) {
  return sensorReadings.isNotEmpty ? sensorReadings.last : {};
}

dynamic latestPrediction(List<PredictionsRecord> predictions) {
  return predictions.isNotEmpty ? predictions.last : {};
}

LatLng? createLatLng(
  double? lat,
  double? lng,
) {
  return LatLng(lat!, lng!);
}
