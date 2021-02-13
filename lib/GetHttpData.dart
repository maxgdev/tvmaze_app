
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './model.dart';

class GetHttpData {
  static Future<dynamic> getShows() async {
    var url = "https://api.tvmaze.com/search/shows?q=house-of-cards";
    // var url = "https://api.tvmaze.com/search/shows?q=vikings";
    // vikings - too many null entries for images
    // Good for future todo on catching null errors
    http.Response response = await http.get(url);
    var responseData = convert.jsonDecode(response.body) as List;
    var shows =
        responseData.map((json) => SearchShow.fromJson(json).show).toList();
    return shows;
  }
}