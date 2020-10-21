import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api_news_app/constants/strings.dart';
import 'package:rest_api_news_app/models/news_info.dart';

// ignore: camel_case_types
class API_Manager {
  Future<Welcome> getNews() async {
    //used to get the data from the server
    // Flutter has inbuilt httpclient , but we can work with http package
    var client = http.Client();
    var newsModel;
    try {
      var response = await client.get(Strings.new_url); //will get the data
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString); //map our string to json object
        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exceptions) {
      return newsModel;
    }
    return newsModel;
  }
}
