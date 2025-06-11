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
import '/auth/firebase_auth/auth_util.dart';

List<String> getUniqueList(List<String> list) {
  return list.toSet().toList();
}

List<PlacesRecord> getPlaces(
  List<PlacesRecord> list,
  List<PlacesRecord> searchResults,
  bool searchBool,
) {
  return searchBool ? searchResults : list;
}

int calculateBasePrice(
  int pricePerNight,
  DateTime startDate,
  DateTime endDate,
) {
  return endDate.difference(startDate).inDays * pricePerNight;
}

List<String> getBookingList(
  List<BookingsRecord> bookingList,
  DateTime startDate,
  DateTime endDate,
) {
  List<String> bookings = [];

  for (var booking in bookingList) {
    if ((startDate.isBefore(booking.endDate!) ||
            startDate.isAtSameMomentAs(booking.endDate!)) &&
        (endDate.isAfter(booking.startDate!) ||
            endDate.isAtSameMomentAs(booking.startDate!))) {
      bookings.add(booking.placeStringRef);
    }
  }

  return bookings;
}

DateTime? add7Days(DateTime? date1) {
  return date1?.add(Duration(days: 7));
}
