import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/services/api/api_repository.dart';
import 'package:flutterproject/services/api/bloc/api_bloc.dart';
import 'package:flutterproject/services/api/bloc/api_event.dart';
import 'package:flutterproject/services/api/bloc/api_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Repository repository = Repository();

  @override
  void initState() {
    super.initState();
    repository.getRandomPokemons();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ApiBloc>().add(const ApiEventGetRandomPokemons());
    return BlocConsumer<ApiBloc, ApiState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: getWidget(state),
        );
      },
    );
  }

  Widget getWidget(ApiState state) {
    if (state is ApiStateGetRandomPokemons) {
      return Center(
        child: Text(state.pokemon.toString()),
      );
    } else {
      return const Scaffold(
        body: CircularProgressIndicator(),
      );
    }
  }
}
