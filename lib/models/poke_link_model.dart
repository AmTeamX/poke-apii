class PokemonList {
  final String name;
  final String url;

  PokemonList({required this.name, required this.url});

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    return PokemonList(
      name: json['name'],
      url: json['url'],
    );
  }
}
