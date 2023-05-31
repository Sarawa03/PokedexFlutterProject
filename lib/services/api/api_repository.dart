import 'dart:convert';
import 'dart:math';
import 'dart:developer' as devtools show log;
import 'package:flutterproject/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final String _url = "https://pokeapi.co/api/v2/pokemon/";

  Future<List<PokemonModel>> getRandomPokemons() async {
    List<PokemonModel> pokemons = [];
    List<int> randomNumbers = generateRandomNumbers(20, 1, 1010);
    devtools.log(randomNumbers.toString());

    for (int i = 0; i < randomNumbers.length; i++) {
      String get = _url + randomNumbers[i].toString();
      final response = await http.get(Uri.parse(get));
      if (response.statusCode == 200) {
        var newData = json.decode(response.body);
        var a = PokemonModel.fromJson(newData);
        pokemons.add(a);
      }
    }
    pokemons.forEach((element) {
      devtools.log("getRandomPokemons()" + element.name.toString());
    });
    return pokemons;
  }

  Future<List<PokemonModel>> searchPokemonByIdOrName(String idOrName) async {
    List<PokemonModel> pokemons = [];
    String get = _url + idOrName;
    final response = await http.get(Uri.parse(get));
    if (response.statusCode == 200) {
      var newData = json.decode(response.body);
      var a = PokemonModel.fromJson(newData);
      pokemons.add(a);
    }

    pokemons.forEach((element) {
      devtools.log("searchPokemonByIdOrName()" + element.name.toString());
    });
    return pokemons;
  }
}

List<int> generateRandomNumbers(int count, int min, int max) {
  Set<int> numberSet = Set<int>();
  Random random = Random();

  while (numberSet.length < count) {
    int number = random.nextInt(max - min + 1) + min;
    numberSet.add(number);
  }

  return numberSet.toList();
}
