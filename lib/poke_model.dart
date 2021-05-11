import 'api.dart';
import 'pokemon.dart';

class PokeModel {
  Future<Pokemon> pokemon;
  Pokemon pokemonData;

  fetchPokemon(int number) {
    pokemon = API().fetchPokemon(number);
  }
}
