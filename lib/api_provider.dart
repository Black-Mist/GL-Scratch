import 'dart:convert';
import 'dart:io';
// import 'package:calltracker/models/image_model.dart';
// import 'package:calltracker/models/user_model.dart';
// import 'package:calltracker/networking/api_provider/custom_exception.dart';
// import 'package:calltracker/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:gl_tasks/user_model.dart';
import 'package:http/http.dart' as http;

import 'custom_exception.dart';

class ApiProvider {
  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'authorization': 'Bearer ${UserData().user.data?.accessToken}'
  };

  final String baseUrl = 'app.getlead.co.uk';

  Future<dynamic> getData(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.https(baseUrl, url, queryParameters),
        headers: _headers,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    dynamic responseJson;
    try {
      debugPrint(queryParameters.toString());
      final response = await http.post(
        Uri.https(baseUrl, url, queryParameters),
        headers: _headers,
        body: formData,
      );
      responseJson = _response(response);
      debugPrint(responseJson.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // Future<dynamic> multipart(
  //   String url,
  //   Map data,
  //   List<ImageModel> files,
  // ) async {
  //   final uri = Uri.https(baseUrl, url);
  //   final request = http.MultipartRequest('POST', uri);

  //   request.headers.addAll(_headers);

  //   data.forEach((k, v) {
  //     bool validateValues = files.any((element) => element.name == k);
  //     if (!validateValues) request.fields[k] = data[k];
  //   });

  //   data.forEach((k, v) async {
  //     bool validateValues =
  //         files.any((element) => element.name == k.toString());

  //     if (validateValues) {
  //       http.MultipartFile multipartFile =
  //           await http.MultipartFile.fromPath(k, data[k]);

  //       request.files.add(multipartFile);
  //     }
  //   });

  //   bool status = false;
  //   try {
  //     http.StreamedResponse res = await request.send();

  //     if (res.statusCode == 200) {
  //       var response = await http.Response.fromStream(res);
  //       var responseJson = json.decode(response.body.toString());

  //       if (responseJson['status'] == 1) {
  //         return responseJson;
  //       } else {
  //         throw Exception(responseJson['message']);
  //       }
  //     } else {
  //       var response = await http.Response.fromStream(res);
  //       final responseJson = json.decode(response.body.toString());

  //       throwException(responseJson);
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }

  //   return status;
  // }

  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    dynamic responseJson;
    try {
      debugPrint(queryParameters.toString());
      final response = await http.delete(
        Uri.https(baseUrl, url, queryParameters),
        headers: _headers,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postJson(String url, Map<dynamic, dynamic> data) async {
    dynamic responseJson;

    try {
      final response = await http.post(
        Uri.https(baseUrl, url),
        headers: _headers,
        body: json.encode(data),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body.toString());
      // print(responseJson);
      if (responseJson['status'] == 1) {
        return responseJson;
      } else {
        throw Exception(responseJson['message']);
      }
    } else {
      final responseJson = json.decode(response.body.toString());
      // print(responseJson);
      throwException(responseJson);
    }
  }
}

void throwException(Map<String, dynamic> data) {
  if (data.containsKey('message')) {
    List message = [];

    if (data['message'].runtimeType.toString().contains('Map')) {
      data['message'].forEach(
        (key, value) {
          if (value.runtimeType.toString().contains('List')) {
            value.forEach((e) => message.add(e));
          } else {
            message.add(value);
          }
        },
      );
    } else {
      message.add(data['message']);
    }

    throw Exception(message.join('\n'));
  } else {
    throw Exception('Error');
  }
}
