import 'package:flutter/cupertino.dart';

@immutable
abstract class ApiEvent {
  const ApiEvent();
}

class ApiEventGetRandomPokemons extends ApiEvent {
  const ApiEventGetRandomPokemons();
}
