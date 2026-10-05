import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetsensordataCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETSENSORDATA',
      apiUrl:
          'https://air-quality-iot-cea00-default-rtdb.asia-southeast1.firebasedatabase.app/sensor.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? temperature(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.temp''',
      ));
  static int? pm10(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pm10''',
      ));
  static int? pm1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pm1''',
      ));
  static double? mq7(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.mq7''',
      ));
  static double? mq135(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.mq135''',
      ));
  static double? humidity(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.humidity''',
      ));
  static int? pm25(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pm25''',
      ));
}

class GetdashbboardCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETDASHBBOARD',
      apiUrl:
          'https://air-quality-iot-cea00-default-rtdb.asia-southeast1.firebasedatabase.app/realtime_aqi.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? realtimeaqi(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.ispu_final''',
      ));
  static dynamic realtimekategori(dynamic response) => getJsonField(
        response,
        r'''$.kategori''',
      );
}

class GetpredictedCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETPREDICTED',
      apiUrl:
          'https://air-quality-iot-cea00-default-rtdb.asia-southeast1.firebasedatabase.app/predict/latest.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? predik1jam(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.pm2_5_proyeksi_1jam''',
      ));
  static dynamic kategoripredik(dynamic response) => getJsonField(
        response,
        r'''$.kategori_prediksi''',
      );
  static int? confidenceai(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.confidence_percentage''',
      ));
}

class GetdevicelocationCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETDEVICELOCATION',
      apiUrl:
          'https://air-quality-iot-cea00-default-rtdb.asia-southeast1.firebasedatabase.app/Device_location.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? statusedevice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? namastation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.device_name''',
      ));
  static double? latitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.latitude''',
      ));
  static String? namalokasi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.location_name''',
      ));
  static double? longitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.longitude''',
      ));
}

class GetdevicelocationduaCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETDEVICELOCATIONDUA',
      apiUrl:
          'https://air-quality-iot-cea00-default-rtdb.asia-southeast1.firebasedatabase.app/Device_location/PENGUJIAN2.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic namadevice(dynamic response) => getJsonField(
        response,
        r'''$.device_name2''',
      );
  static double? latitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.latitude2''',
      ));
  static dynamic namalokasi(dynamic response) => getJsonField(
        response,
        r'''$.location_name2''',
      );
  static double? longitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.longitude2''',
      ));
  static dynamic statusdevice(dynamic response) => getJsonField(
        response,
        r'''$.status2''',
      );
}

class GetlocationtigaCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETLOCATIONTIGA',
      apiUrl:
          'https://air-quality-iot-cea00-default-rtdb.asia-southeast1.firebasedatabase.app/Device_location/PENGUJIAN3.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic statusdevice(dynamic response) => getJsonField(
        response,
        r'''$.status3''',
      );
  static double? longitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.longitude3''',
      ));
  static dynamic namalokasi(dynamic response) => getJsonField(
        response,
        r'''$.location_name3''',
      );
  static double? latitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.latitue3''',
      ));
  static dynamic namadevice(dynamic response) => getJsonField(
        response,
        r'''$.device_name3''',
      );
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
