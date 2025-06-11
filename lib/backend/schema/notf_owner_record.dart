import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotfOwnerRecord extends FirestoreRecord {
  NotfOwnerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "checkreq" field.
  bool? _checkreq;
  bool get checkreq => _checkreq ?? false;
  bool hasCheckreq() => _checkreq != null;

  // "imageplace" field.
  String? _imageplace;
  String get imageplace => _imageplace ?? '';
  bool hasImageplace() => _imageplace != null;

  // "nameplace" field.
  String? _nameplace;
  String get nameplace => _nameplace ?? '';
  bool hasNameplace() => _nameplace != null;

  // "date_not" field.
  DateTime? _dateNot;
  DateTime? get dateNot => _dateNot;
  bool hasDateNot() => _dateNot != null;

  void _initializeFields() {
    _checkreq = snapshotData['checkreq'] as bool?;
    _imageplace = snapshotData['imageplace'] as String?;
    _nameplace = snapshotData['nameplace'] as String?;
    _dateNot = snapshotData['date_not'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notf_owner');

  static Stream<NotfOwnerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotfOwnerRecord.fromSnapshot(s));

  static Future<NotfOwnerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotfOwnerRecord.fromSnapshot(s));

  static NotfOwnerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotfOwnerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotfOwnerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotfOwnerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotfOwnerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotfOwnerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotfOwnerRecordData({
  bool? checkreq,
  String? imageplace,
  String? nameplace,
  DateTime? dateNot,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'checkreq': checkreq,
      'imageplace': imageplace,
      'nameplace': nameplace,
      'date_not': dateNot,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotfOwnerRecordDocumentEquality implements Equality<NotfOwnerRecord> {
  const NotfOwnerRecordDocumentEquality();

  @override
  bool equals(NotfOwnerRecord? e1, NotfOwnerRecord? e2) {
    return e1?.checkreq == e2?.checkreq &&
        e1?.imageplace == e2?.imageplace &&
        e1?.nameplace == e2?.nameplace &&
        e1?.dateNot == e2?.dateNot;
  }

  @override
  int hash(NotfOwnerRecord? e) => const ListEquality()
      .hash([e?.checkreq, e?.imageplace, e?.nameplace, e?.dateNot]);

  @override
  bool isValidKey(Object? o) => o is NotfOwnerRecord;
}
