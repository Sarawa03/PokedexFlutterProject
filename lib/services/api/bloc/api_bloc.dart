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
  }
}
