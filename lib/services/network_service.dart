import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../model/news.dart';

class NetworkService {
  static var logger = Logger();

  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> header = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  /// APIs
  static String API_POST = "/posts";
  static String API_GET = "/posts";
  static String API_PUT = "/posts/"; // + id
  static String API_DELETE = "/posts/"; // +id

  /// request methods
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    Uri uri = Uri.https(BASE, api, params);
    Response response =
        await post(uri, headers: header, body: jsonEncode(params));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await delete(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsGET() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsPOST({required News news}) {
    Map<String, String> params = {};
    params.addAll({
      'userId': news.userId.toString(),
      "id": news.id.toString(),
      "title": news.title!,
      "body": news.body!,
    });
    return params;
  }

  static Map<String, String> paramsPUT(News news) {
    Map<String, String> params = {};
    params.addAll({
      'userId': news.userId.toString(),
      "id": news.id.toString(),
      "title": news.title!,
      "body": news.body!,
    });
    return params;
  }

  static Map<String, String> paramsDELETE() {
    Map<String, String> params = {};
    return params;
  }
}
