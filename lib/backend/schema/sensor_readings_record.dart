import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SensorReadingsRecord extends FirestoreRecord {
  SensorReadingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "temperature" field.
  double? _temperature;
  double get temperature => _temperature ?? 0.0;
  bool hasTemperature() => _temperature != null;

  // "humidity" field.
  double? _humidity;
  double get humidity => _humidity ?? 0.0;
  bool hasHumidity() => _humidity != null;

  // "mq135" field.
  double? _mq135;
  double get mq135 => _mq135 ?? 0.0;
  bool hasMq135() => _mq135 != null;

  // "mq7" field.
  double? _mq7;
  double get mq7 => _mq7 ?? 0.0;
  bool hasMq7() => _mq7 != null;

  // "pm10" field.
  double? _pm10;
  double get pm10 => _pm10 ?? 0.0;
  bool hasPm10() => _pm10 != null;

  // "pm25" field.
  double? _pm25;
  double get pm25 => _pm25 ?? 0.0;
  bool hasPm25() => _pm25 != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _temperature = castToType<double>(snapshotData['temperature']);
    _humidity = castToType<double>(snapshotData['humidity']);
    _mq135 = castToType<double>(snapshotData['mq135']);
    _mq7 = castToType<double>(snapshotData['mq7']);
    _pm10 = castToType<double>(snapshotData['pm10']);
    _pm25 = castToType<double>(snapshotData['pm25']);
    _timestamp = snapshotData['timestamp'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sensor_readings');

  static Stream<SensorReadingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SensorReadingsRecord.fromSnapshot(s));

  static Future<SensorReadingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SensorReadingsRecord.fromSnapshot(s));

  static SensorReadingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SensorReadingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SensorReadingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SensorReadingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SensorReadingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SensorReadingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSensorReadingsRecordData({
  double? temperature,
  double? humidity,
  double? mq135,
  double? mq7,
  double? pm10,
  double? pm25,
  String? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'temperature': temperature,
      'humidity': humidity,
      'mq135': mq135,
      'mq7': mq7,
      'pm10': pm10,
      'pm25': pm25,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class SensorReadingsRecordDocumentEquality
    implements Equality<SensorReadingsRecord> {
  const SensorReadingsRecordDocumentEquality();

  @override
  bool equals(SensorReadingsRecord? e1, SensorReadingsRecord? e2) {
    return e1?.temperature == e2?.temperature &&
        e1?.humidity == e2?.humidity &&
        e1?.mq135 == e2?.mq135 &&
        e1?.mq7 == e2?.mq7 &&
        e1?.pm10 == e2?.pm10 &&
        e1?.pm25 == e2?.pm25 &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(SensorReadingsRecord? e) => const ListEquality().hash([
        e?.temperature,
        e?.humidity,
        e?.mq135,
        e?.mq7,
        e?.pm10,
        e?.pm25,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is SensorReadingsRecord;
}
