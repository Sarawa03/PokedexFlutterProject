import 'package:flutterproject/models/pokemon_model.dart';

abstract class ApiProvider {
  Future<List<PokemonModel>> getRandomPokemons();
}
