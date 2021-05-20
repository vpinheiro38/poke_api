import 'api.dart';
import 'pokemon.dart';

class PokeModel {
  final API api;
  Future<Pokemon> pokemon;
  Pokemon pokemonData;

  PokeModel({this.api = const API()});

  fetchPokemon(int number) {
    pokemon = api.fetchPokemon(number);
  }
}
