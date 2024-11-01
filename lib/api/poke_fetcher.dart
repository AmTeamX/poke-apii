import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poke_app/models/poke_model.dart';

Future<PokeModel> fetchPokeMon(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final pokeMon =
        PokeModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return pokeMon;
  } else {
    throw Exception('Failed to load Pokemon list');
  }
}
