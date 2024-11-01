import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poke_app/models/poke_link_model.dart';
import 'package:poke_app/models/poke_list_model.dart';

Stream<List<PokemonList>> fetchPokelistStream() {
  return Stream.fromFuture(fetchPokelist());
}

Future<List<PokemonList>> fetchPokelist() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=50'));

  if (response.statusCode == 200) {
    final pokeListModel = PokeListModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
    return pokeListModel.results;
  } else {
    throw Exception('Failed to load Pokemon list');
  }
}
