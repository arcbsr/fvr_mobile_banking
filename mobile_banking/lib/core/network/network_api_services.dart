import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '../errors/app_exceptions.dart';
import 'base_api_services.dart';
/**
 * Created by Mahfuz
 * 27th july 2025
 * update on 15th August 2025
 **/

/// Class for handling network API requests.
class NetworkApiService implements BaseApiServices {
  /// Sends a GET request to the specified [url] and returns the response.
  ///
  /// Throws a [NoInternetException] if there is no internet connection.
  /// Throws a [FetchDataException] if the network request times out.
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    var apiKey = "mobix-7p342tybn653wnkh248532";
    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'api-key': '$apiKey', // <== এইভাবে দিন
            },
          )
          .timeout(const Duration(seconds: 20));
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  /// Sends a POST request to the specified [url] with the provided [data]
  /// and returns the response.
  ///
  /// Throws a [NoInternetException] if there is no internet connection.
  /// Throws a [FetchDataException] if the network request times out.
  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    if (kDebugMode) {
      print(url);
    }

    var apiKey = "mobix-7p342tybn653wnkh248532";
    dynamic responseJson;

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Headers
      request.headers.addAll({'Accept': 'application/json', 'api-key': apiKey});

      // Separate files and text
      data.forEach((key, value) async {
        if (value is File) {
          // Add file
          request.files.add(
            await http.MultipartFile.fromPath(
              key,
              value.path,
              filename: basename(value.path),
              contentType: MediaType('image', _getExtension(value.path)),
            ),
          );
        } else if (value is String) {
          // Add text field
          request.fields[key] = value;
        }
      });

      // Send request
      var streamedResponse = await request.send().timeout(
        const Duration(seconds: 100),
      );
      var response = await http.Response.fromStream(streamedResponse);

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  // Helper to detect extension
  String _getExtension(String filePath) {
    String ext = extension(filePath).toLowerCase().replaceAll('.', '');
    if (ext == 'jpg') ext = 'jpeg';
    return ext;
  }

  /*  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    if (kDebugMode) {
      print(url);
    }

    var apiKey = "mobix-7p342tybn653wnkh248532";
    dynamic responseJson;
    try {
      final http.Response response = await http
          .post(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
              'Accept': 'application/json',
              'api-key': '$apiKey',
            },
            body: data,
          )
          .timeout(const Duration(seconds: 100));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }*/
  /// Parses the [response] and returns the corresponding JSON data.
  ///
  /// Throws a [FetchDataException] with the appropriate error message if the response status code is not successful.
  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print("Response... ${response.statusCode}");
    }
    // print("Response... ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
          'Error occurred while communicating with server',
        );
    }
  }
}
