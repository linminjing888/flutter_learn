import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_learn/DouBan/Model/home_model.dart';
import 'package:flutter_learn/DouBan/NetWork/http_request.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList() async {
    // final movieUrl =
    //     "/api/v2/subject_collection/movie_real_time_hotest/items";
    // final result = await DBHttpRquest.request(movieUrl);
    // final subjects = result["subject_collection_items"];

    String jsonString = await rootBundle.loadString("assets/movies.json");
    final jsonResult = json.decode(jsonString);
    final items = jsonResult["subject_collection_items"];

    List<MovieItem> movies = [];
    for (var item in items) {
      movies.add(MovieItem.fromMap(item));
    }
    return movies;
  }
}
