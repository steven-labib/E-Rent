import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlacesRecord extends FirestoreRecord {
  PlacesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "amenities" field.
  List<String>? _amenities;
  List<String> get amenities => _amenities ?? const [];
  bool hasAmenities() => _amenities != null;

  // "ownerRef" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "max_people" field.
  int? _maxPeople;
  int get maxPeople => _maxPeople ?? 0;
  bool hasMaxPeople() => _maxPeople != null;

  // "coords" field.
  LatLng? _coords;
  LatLng? get coords => _coords;
  bool hasCoords() => _coords != null;

  // "max_rooms" field.
  int? _maxRooms;
  int get maxRooms => _maxRooms ?? 0;
  bool hasMaxRooms() => _maxRooms != null;

  // "choice" field.
  String? _choice;
  String get choice => _choice ?? '';
  bool hasChoice() => _choice != null;

  // "rooms" field.
  int? _rooms;
  int get rooms => _rooms ?? 0;
  bool hasRooms() => _rooms != null;

  // "beds" field.
  int? _beds;
  int get beds => _beds ?? 0;
  bool hasBeds() => _beds != null;

  // "baths" field.
  int? _baths;
  int get baths => _baths ?? 0;
  bool hasBaths() => _baths != null;

  // "favoritePlace" field.
  List<DocumentReference>? _favoritePlace;
  List<DocumentReference> get favoritePlace => _favoritePlace ?? const [];
  bool hasFavoritePlace() => _favoritePlace != null;

  // "Electronics" field.
  List<String>? _electronics;
  List<String> get electronics => _electronics ?? const [];
  bool hasElectronics() => _electronics != null;

  // "location2" field.
  LatLng? _location2;
  LatLng? get location2 => _location2;
  bool hasLocation2() => _location2 != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "startdate" field.
  DateTime? _startdate;
  DateTime? get startdate => _startdate;
  bool hasStartdate() => _startdate != null;

  // "enddate" field.
  DateTime? _enddate;
  DateTime? get enddate => _enddate;
  bool hasEnddate() => _enddate != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _amenities = getDataList(snapshotData['amenities']);
    _ownerRef = snapshotData['ownerRef'] as DocumentReference?;
    _desc = snapshotData['desc'] as String?;
    _maxPeople = castToType<int>(snapshotData['max_people']);
    _coords = snapshotData['coords'] as LatLng?;
    _maxRooms = castToType<int>(snapshotData['max_rooms']);
    _choice = snapshotData['choice'] as String?;
    _rooms = castToType<int>(snapshotData['rooms']);
    _beds = castToType<int>(snapshotData['beds']);
    _baths = castToType<int>(snapshotData['baths']);
    _favoritePlace = getDataList(snapshotData['favoritePlace']);
    _electronics = getDataList(snapshotData['Electronics']);
    _location2 = snapshotData['location2'] as LatLng?;
    _images = getDataList(snapshotData['images']);
    _gender = snapshotData['gender'] as String?;
    _startdate = snapshotData['startdate'] as DateTime?;
    _enddate = snapshotData['enddate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('places');

  static Stream<PlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlacesRecord.fromSnapshot(s));

  static Future<PlacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlacesRecord.fromSnapshot(s));

  static PlacesRecord fromSnapshot(DocumentSnapshot snapshot) => PlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlacesRecordData({
  String? name,
  String? location,
  int? price,
  DocumentReference? ownerRef,
  String? desc,
  int? maxPeople,
  LatLng? coords,
  int? maxRooms,
  String? choice,
  int? rooms,
  int? beds,
  int? baths,
  LatLng? location2,
  String? gender,
  DateTime? startdate,
  DateTime? enddate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'price': price,
      'ownerRef': ownerRef,
      'desc': desc,
      'max_people': maxPeople,
      'coords': coords,
      'max_rooms': maxRooms,
      'choice': choice,
      'rooms': rooms,
      'beds': beds,
      'baths': baths,
      'location2': location2,
      'gender': gender,
      'startdate': startdate,
      'enddate': enddate,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlacesRecordDocumentEquality implements Equality<PlacesRecord> {
  const PlacesRecordDocumentEquality();

  @override
  bool equals(PlacesRecord? e1, PlacesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.price == e2?.price &&
        listEquality.equals(e1?.amenities, e2?.amenities) &&
        e1?.ownerRef == e2?.ownerRef &&
        e1?.desc == e2?.desc &&
        e1?.maxPeople == e2?.maxPeople &&
        e1?.coords == e2?.coords &&
        e1?.maxRooms == e2?.maxRooms &&
        e1?.choice == e2?.choice &&
        e1?.rooms == e2?.rooms &&
        e1?.beds == e2?.beds &&
        e1?.baths == e2?.baths &&
        listEquality.equals(e1?.favoritePlace, e2?.favoritePlace) &&
        listEquality.equals(e1?.electronics, e2?.electronics) &&
        e1?.location2 == e2?.location2 &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.gender == e2?.gender &&
        e1?.startdate == e2?.startdate &&
        e1?.enddate == e2?.enddate;
  }

  @override
  int hash(PlacesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.price,
        e?.amenities,
        e?.ownerRef,
        e?.desc,
        e?.maxPeople,
        e?.coords,
        e?.maxRooms,
        e?.choice,
        e?.rooms,
        e?.beds,
        e?.baths,
        e?.favoritePlace,
        e?.electronics,
        e?.location2,
        e?.images,
        e?.gender,
        e?.startdate,
        e?.enddate
      ]);

  @override
  bool isValidKey(Object? o) => o is PlacesRecord;
}
