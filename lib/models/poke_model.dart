class PokeModel {
  final String name;
  final String img;
  final int weight;
  final int height;
  final String snImg;

  PokeModel(
      {required this.name,
      required this.img,
      required this.weight,
      required this.height,
      required this.snImg});

  factory PokeModel.fromJson(Map<String, dynamic> json) {
    var imgJson = json['sprites'] as Map<String, dynamic>;

    return PokeModel(
        name: json['name'],
        img: imgJson['front_default'],
        weight: json['weight'],
        height: json['height'],
        snImg: imgJson['front_shiny']);
  }
}
