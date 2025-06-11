import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ResetPasswordCall {
  static Future<ApiCallResponse> call({
    String? oobCode = '',
    String? newPassword = '',
    String? apiKey = ' AIzaSyCvsofWsDHMBM3xNMcgnQcf8k5tNr3xaUY',
  }) async {
    final ffApiRequestBody = '''
{
  "oobCode": "${escapeStringForJson(oobCode)}",
  "newPassword": "${escapeStringForJson(newPassword)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetPassword',
      apiUrl:
          'https://identitytoolkit.googleapis.com/v1/accounts:resetPassword?key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApirecommendCall {
  static Future<ApiCallResponse> call({
    String? faculty = '',
    int? budget,
    List<String>? requiredAmenitiesList,
    int? preferredSize,
    String? preferredType = '',
    String? gender = '',
  }) async {
    final requiredAmenities = _serializeList(requiredAmenitiesList);

    final ffApiRequestBody = '''
{
  "faculty": "Computer Science",
  "budget": 1500,
  "required_amenities": [
    "wifi"
  ],
  "preferred_size": {
    "rooms": 1,
    "beds": 1
  },
  "preferred_type": "dorm",
  "gender": "male"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'apirecommend',
      apiUrl: 'https://e83a-41-236-56-237.ngrok-free.app/api/recommend',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
