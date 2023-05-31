import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/services/api/bloc/api_bloc.dart';
import 'package:flutterproject/services/api/bloc/api_event.dart';
import 'package:flutterproject/services/api/bloc/api_state.dart';
import 'package:flutterproject/ui/views/recycler_view.dart';
import 'dart:developer' as devtools show log;

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  void searchByNameOrId(String query) {}

  @override
  void initState() {
    super.initState();
    devtools.log("test");
    fetchData("a");
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiBloc, ApiState>(
      listener: (context, state) {},
      builder: (context, state) {
        devtools.log(state.toString());
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      onSubmitted: (query) {
                        fetchData(query);
                      },
                      style: const TextStyle(color: tWhiteColor),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: tSearchBarColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Type pokemon id or name...",
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: tbackgroundColor,
                      ),
                    ),
                  ),
                  const Divider(
                    color: tBlack,
                  ),
                  _getWidget(state)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getWidget(ApiState state) {
    if (state is ApiStateSearchPokemonByIdOrName) {
      return GeneralListView(
        items: state.pokemon,
        count: 1,
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  void fetchData(String query) {
    context.read<ApiBloc>().add(
          ApiEventSearchPokemonByIdOrName(query: query),
        );
  }
}
