import 'dart:async';
import 'dart:math';
import 'pokemon.dart';
import 'poke_model.dart';

class PokeViewModel {
  final _model = PokeModel();
  final StreamController<Pokemon> streamController = StreamController();

  loadPokemon() {
    _model.fetchPokemon(Random().nextInt(1000));
    _model.pokemon.then((value) => streamController.add(value));
  }
}
