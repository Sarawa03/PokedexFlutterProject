import 'package:flutter/cupertino.dart';
import 'package:flutterproject/models/pokemon_model.dart';

@immutable
abstract class ApiEvent {
  const ApiEvent();
}

class ApiEventGetRandomPokemons extends ApiEvent {
  const ApiEventGetRandomPokemons();
}

class ApiEventSearchPokemonByIdOrName extends ApiEvent {
  final String query;
  const ApiEventSearchPokemonByIdOrName({required this.query});
}

class ApiEventDetails extends ApiEvent {
  final PokemonModel pokemon;
  const ApiEventDetails({required this.pokemon});
}
