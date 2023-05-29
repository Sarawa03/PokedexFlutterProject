import 'package:flutterproject/models/pokemon_model.dart';

abstract class ApiState {
  final bool isLoading;
  final String loadingText;

  const ApiState({required this.isLoading, this.loadingText = 'Loading...'});
}

class ApiStateUnintialized extends ApiState {
  const ApiStateUnintialized({required bool isLoading})
      : super(isLoading: isLoading);
}

class ApiStateGetRandomPokemons extends ApiState {
  final List<PokemonModel> pokemon;

  ApiStateGetRandomPokemons({required bool isLoading, required this.pokemon})
      : super(
            isLoading: isLoading, loadingText: 'Generating random pokemon...');
}
