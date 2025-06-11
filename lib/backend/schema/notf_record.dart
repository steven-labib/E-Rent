import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotfRecord extends FirestoreRecord {
  NotfRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "boo" field.
  String? _boo;
  String get boo => _boo ?? '';
  bool hasBoo() => _boo != null;

  // "name_no" field.
  String? _nameNo;
  String get nameNo => _nameNo ?? '';
  bool hasNameNo() => _nameNo != null;

  // "date_not" field.
  DateTime? _dateNot;
  DateTime? get dateNot => _dateNot;
  bool hasDateNot() => _dateNot != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _boo = snapshotData['boo'] as String?;
    _nameNo = snapshotData['name_no'] as String?;
    _dateNot = snapshotData['date_not'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notf');

  static Stream<NotfRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotfRecord.fromSnapshot(s));

  static Future<NotfRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotfRecord.fromSnapshot(s));

  static NotfRecord fromSnapshot(DocumentSnapshot snapshot) => NotfRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotfRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotfRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotfRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotfRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotfRecordData({
  DocumentReference? user,
  String? boo,
  String? nameNo,
  DateTime? dateNot,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'boo': boo,
      'name_no': nameNo,
      'date_not': dateNot,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotfRecordDocumentEquality implements Equality<NotfRecord> {
  const NotfRecordDocumentEquality();

  @override
  bool equals(NotfRecord? e1, NotfRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.boo == e2?.boo &&
        e1?.nameNo == e2?.nameNo &&
        e1?.dateNot == e2?.dateNot;
  }

  @override
  int hash(NotfRecord? e) =>
      const ListEquality().hash([e?.user, e?.boo, e?.nameNo, e?.dateNot]);

  @override
  bool isValidKey(Object? o) => o is NotfRecord;
}
