import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SystemLogsRecord extends FirestoreRecord {
  SystemLogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eventDescription" field.
  String? _eventDescription;
  String get eventDescription => _eventDescription ?? '';
  bool hasEventDescription() => _eventDescription != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "uptime" field.
  String? _uptime;
  String get uptime => _uptime ?? '';
  bool hasUptime() => _uptime != null;

  // "signalStrength" field.
  String? _signalStrength;
  String get signalStrength => _signalStrength ?? '';
  bool hasSignalStrength() => _signalStrength != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _eventDescription = snapshotData['eventDescription'] as String?;
    _status = snapshotData['status'] as String?;
    _uptime = snapshotData['uptime'] as String?;
    _signalStrength = snapshotData['signalStrength'] as String?;
    _timestamp = snapshotData['timestamp'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('system_logs');

  static Stream<SystemLogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SystemLogsRecord.fromSnapshot(s));

  static Future<SystemLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SystemLogsRecord.fromSnapshot(s));

  static SystemLogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SystemLogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SystemLogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SystemLogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SystemLogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SystemLogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSystemLogsRecordData({
  String? eventDescription,
  String? status,
  String? uptime,
  String? signalStrength,
  String? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventDescription': eventDescription,
      'status': status,
      'uptime': uptime,
      'signalStrength': signalStrength,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class SystemLogsRecordDocumentEquality implements Equality<SystemLogsRecord> {
  const SystemLogsRecordDocumentEquality();

  @override
  bool equals(SystemLogsRecord? e1, SystemLogsRecord? e2) {
    return e1?.eventDescription == e2?.eventDescription &&
        e1?.status == e2?.status &&
        e1?.uptime == e2?.uptime &&
        e1?.signalStrength == e2?.signalStrength &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(SystemLogsRecord? e) => const ListEquality().hash([
        e?.eventDescription,
        e?.status,
        e?.uptime,
        e?.signalStrength,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is SystemLogsRecord;
}
