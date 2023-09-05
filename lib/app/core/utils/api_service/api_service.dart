import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {
  http.Client? httClient;

  ApiService({this.httClient}) {
    httClient ??= http.Client();
  }

  Future<http.Response> getRequest(String url) async {
    final completeUrl = url;
    debugPrint('Checking for Get API start & end point $completeUrl');
    final headers = {
      'Content-Type': 'application/json'
    };
    return httClient!.get(Uri.parse(completeUrl), headers: headers);
  }
}
