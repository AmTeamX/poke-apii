import 'package:poke_app/models/poke_link_model.dart';

class PokeListModel {
  final List<PokemonList> results;

  PokeListModel({required this.results});

  factory PokeListModel.fromJson(Map<String, dynamic> json) {
    var resultsJson = json['results'] as List;
    List<PokemonList> resultsList =
        resultsJson.map((i) => PokemonList.fromJson(i)).toList();

    return PokeListModel(results: resultsList);
  }
}
