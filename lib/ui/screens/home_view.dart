import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/models/pokemon_model.dart';
import 'package:flutterproject/services/api/api_repository.dart';
import 'package:flutterproject/services/api/bloc/api_bloc.dart';
import 'package:flutterproject/services/api/bloc/api_event.dart';
import 'package:flutterproject/services/api/bloc/api_state.dart';
import 'package:flutterproject/ui/views/recycler_view.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Repository repository = Repository();
  List<PokemonModel> items = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiBloc, ApiState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: LiquidPullToRefresh(
            onRefresh: fetchData,
            child: _getWidget(state),
          ),
        );
      },
    );
  }

  Future<void> fetchData() async {
    context.read<ApiBloc>().add(
          const ApiEventGetRandomPokemons(),
        );
    await Future.delayed(const Duration(seconds: 2));
  }

  Widget _getWidget(ApiState state) {
    if (state is ApiStateGetRandomPokemons) {
      return SafeArea(
        child: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Home',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: tBlack,
              ),
              GeneralListView(
                items: state.pokemon,
                count: 2,
              ),
            ],
          ),
        )),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
