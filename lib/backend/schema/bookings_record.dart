import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "placeRef" field.
  DocumentReference? _placeRef;
  DocumentReference? get placeRef => _placeRef;
  bool hasPlaceRef() => _placeRef != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "placeStringRef" field.
  String? _placeStringRef;
  String get placeStringRef => _placeStringRef ?? '';
  bool hasPlaceStringRef() => _placeStringRef != null;

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _placeStringRef = snapshotData['placeStringRef'] as String?;
    _checkreq = snapshotData['checkreq'] as bool?;
    _imageplace = snapshotData['imageplace'] as String?;
    _nameplace = snapshotData['nameplace'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookings')
          : FirebaseFirestore.instance.collectionGroup('bookings');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('bookings').doc(id);

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  DocumentReference? placeRef,
  DateTime? startDate,
  DateTime? endDate,
  String? placeStringRef,
  bool? checkreq,
  String? imageplace,
  String? nameplace,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'placeRef': placeRef,
      'startDate': startDate,
      'endDate': endDate,
      'placeStringRef': placeStringRef,
      'checkreq': checkreq,
      'imageplace': imageplace,
      'nameplace': nameplace,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    return e1?.placeRef == e2?.placeRef &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.placeStringRef == e2?.placeStringRef &&
        e1?.checkreq == e2?.checkreq &&
        e1?.imageplace == e2?.imageplace &&
        e1?.nameplace == e2?.nameplace;
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([
        e?.placeRef,
        e?.startDate,
        e?.endDate,
        e?.placeStringRef,
        e?.checkreq,
        e?.imageplace,
        e?.nameplace
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
