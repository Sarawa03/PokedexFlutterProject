import 'dart:convert';
import 'dart:math';
import 'dart:developer' as devtools show log;
import 'package:flutterproject/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final String _url = "https://pokeapi.co/api/v2/pokemon/";

  Future<List<PokemonModel>> getRandomPokemons() async {
    List<PokemonModel> pokemons = [];
    List<int> randomNumbers = generateRandomNumbers(10, 1, 1010);
    devtools.log(randomNumbers.toString());

    for (int i = 0; i < randomNumbers.length; i++) {
      final response = await http.get(Uri.parse((_url + i.toString())));
      if (response.statusCode == 200) {
        var newData = json.decode(response.body);
        var a = PokemonModel.fromJson(newData);
        devtools.log(a.toString());
        pokemons.add(a);
      }
    }
    ;

    return pokemons;
  }
}

List<int> generateRandomNumbers(int count, int min, int max) {
  Random random = Random();
  List<int> numbers = [];

  for (int i = 0; i < count; i++) {
    int randomNumber = random.nextInt(max - min + 1) + min;
    numbers.add(randomNumber);
  }

  return numbers;
}
