class Pokemon {
  String nome;
  String urlImage;
  int weight;
  List<Ability> abilities;

  Pokemon(this.nome, this.urlImage, this.weight, this.abilities);

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json['name'];
    urlImage = json['sprites']['front_default'];
    weight = json['weight'];

    var arrayAbilities = json['abilities'] as List;
    abilities = arrayAbilities.map((item) {
      return Ability.fromJson(item['ability']);
    }).toList();
  }
}

class Ability {
  String name;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
