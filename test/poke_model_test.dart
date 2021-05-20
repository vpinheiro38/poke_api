import 'package:flutter_test/flutter_test.dart';
import 'package:poke_api/api.dart';

import 'package:poke_api/poke_model.dart';
import 'package:poke_api/pokemon.dart';

void main() {
  test('FetchPokemon should fill pokemon variable', () {
    final model = PokeModel(api: MockAPI());

    model.fetchPokemon(1);

    expect(model.pokemon, completion(isNotNull));

    model.pokemon.then((pokemon) {
      expect(pokemon.nome, 'Victor');
    });
  });
}

class MockAPI extends API {
  @override
  Future<Pokemon> fetchPokemon(int number) {
    final pokemon = Pokemon('Victor', 'null', 1, []);
    return Future.value(pokemon);
  }
}
