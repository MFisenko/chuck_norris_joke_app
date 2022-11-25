import 'dart:convert';

import 'package:http/http.dart' as http;

/*
   Note: no model needed for categories,
   because we are just parsing a list of strings.
*/

List<String> categoriesFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String categoriesToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

// Parsing and Converting json to string List.

class CategoriesRepository {
  Future<List<String>> getCategoriesData() async {
    final response = await http
        .get(Uri.parse('https://api.chucknorris.io/jokes/categories'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return categoriesFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load categories');
    }
  }
}
