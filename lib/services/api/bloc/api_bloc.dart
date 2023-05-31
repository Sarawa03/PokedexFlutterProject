import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/services/api/api_repository.dart';
import 'package:flutterproject/services/api/bloc/api_event.dart';
import 'package:flutterproject/services/api/bloc/api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc(Repository repository)
      : super(const ApiStateUnintialized(isLoading: true)) {
    on<ApiEventGetRandomPokemons>(
      (event, emit) async {
        final randomPokemons = await repository.getRandomPokemons();
        emit(ApiStateGetRandomPokemons(
            isLoading: true, pokemon: randomPokemons));
      },
    );

    on<ApiEventSearchPokemonByIdOrName>(
      (event, emit) async {
        final searchResults =
            await repository.searchPokemonByIdOrName(event.query);
        emit(ApiStateSearchPokemonByIdOrName(
            isLoading: true, pokemon: searchResults));
      },
    );
    on<ApiEventDetails>(
      (event, emit) async {
        emit(ApiStateDetails(isLoading: true, pokemon: event.pokemon));
      },
    );
  }
}
