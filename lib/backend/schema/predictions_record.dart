import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PredictionsRecord extends FirestoreRecord {
  PredictionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "predictedAqi" field.
  double? _predictedAqi;
  double get predictedAqi => _predictedAqi ?? 0.0;
  bool hasPredictedAqi() => _predictedAqi != null;

  // "predictedPm25" field.
  double? _predictedPm25;
  double get predictedPm25 => _predictedPm25 ?? 0.0;
  bool hasPredictedPm25() => _predictedPm25 != null;

  // "predictedPm10" field.
  double? _predictedPm10;
  double get predictedPm10 => _predictedPm10 ?? 0.0;
  bool hasPredictedPm10() => _predictedPm10 != null;

  // "confidenceScore" field.
  double? _confidenceScore;
  double get confidenceScore => _confidenceScore ?? 0.0;
  bool hasConfidenceScore() => _confidenceScore != null;

  // "riskLevel" field.
  String? _riskLevel;
  String get riskLevel => _riskLevel ?? '';
  bool hasRiskLevel() => _riskLevel != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _predictedAqi = castToType<double>(snapshotData['predictedAqi']);
    _predictedPm25 = castToType<double>(snapshotData['predictedPm25']);
    _predictedPm10 = castToType<double>(snapshotData['predictedPm10']);
    _confidenceScore = castToType<double>(snapshotData['confidenceScore']);
    _riskLevel = snapshotData['riskLevel'] as String?;
    _timestamp = snapshotData['timestamp'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('predictions');

  static Stream<PredictionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PredictionsRecord.fromSnapshot(s));

  static Future<PredictionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PredictionsRecord.fromSnapshot(s));

  static PredictionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PredictionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PredictionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PredictionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PredictionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PredictionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPredictionsRecordData({
  double? predictedAqi,
  double? predictedPm25,
  double? predictedPm10,
  double? confidenceScore,
  String? riskLevel,
  String? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'predictedAqi': predictedAqi,
      'predictedPm25': predictedPm25,
      'predictedPm10': predictedPm10,
      'confidenceScore': confidenceScore,
      'riskLevel': riskLevel,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class PredictionsRecordDocumentEquality implements Equality<PredictionsRecord> {
  const PredictionsRecordDocumentEquality();

  @override
  bool equals(PredictionsRecord? e1, PredictionsRecord? e2) {
    return e1?.predictedAqi == e2?.predictedAqi &&
        e1?.predictedPm25 == e2?.predictedPm25 &&
        e1?.predictedPm10 == e2?.predictedPm10 &&
        e1?.confidenceScore == e2?.confidenceScore &&
        e1?.riskLevel == e2?.riskLevel &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(PredictionsRecord? e) => const ListEquality().hash([
        e?.predictedAqi,
        e?.predictedPm25,
        e?.predictedPm10,
        e?.confidenceScore,
        e?.riskLevel,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is PredictionsRecord;
}
