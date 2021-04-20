class Pokemon {
  String nome;
  String urlImage;
  int weight;

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json['name'];
    urlImage = json['sprites']['front_default'];
    weight = json['weight'];
  }
}
