import 'package:flutter/material.dart';
import 'poke_controller.dart';
import 'pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  void initState() {
    controller.loadPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Pokemon>(
              future: controller.pokemon,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasData) {
                  return PokeCard(snapshot.data.nome, snapshot.data.urlImage,
                      snapshot.data.weight, snapshot.data.abilities);
                } else if (snapshot.hasError) {
                  return Text(
                    snapshot.error,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  );
                }
                return Container();
              }),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    controller.loadPokemon();
                  });
                },
                child: Text("Load Pokemon")),
          )
        ],
      ),
    );
  }
}

class PokeCard extends StatelessWidget {
  final String _urlImage;
  final String _name;
  final int _weight;
  final List<Ability> _abilities;

  PokeCard(this._name, this._urlImage, this._weight, this._abilities);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 5),
            color: Colors.yellow),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 5),
                  color: Colors.white),
              child: Image.network(
                _urlImage,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              _name,
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            Text(
              "Peso: $_weight",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  itemCount: _abilities.length,
                  itemBuilder: (context, index) {
                    return Text(
                      "Abilidade: ${_abilities[index].name}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
