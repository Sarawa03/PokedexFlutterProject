import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/models/pokemon_model.dart';
import 'package:flutterproject/services/api/bloc/api_bloc.dart';
import 'package:flutterproject/services/api/bloc/api_event.dart';

import 'package:intl/intl.dart';

class GeneralListView extends StatelessWidget {
  final List<PokemonModel> items;
  final int count;

  GeneralListView({required this.items, required, required this.count});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2, // Number of columns in the grid
        children: List.generate(items.length, (index) {
          return GridTile(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              //color: Colors.blue,
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Stack(
                  children: [
                    Ink.image(
                      image: NetworkImage(
                        items[index].sprites.frontDefault,
                      ),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () {
                          context
                              .read<ApiBloc>()
                              .add(ApiEventDetails(pokemon: items[index]));
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        pokedexIdFormated(items[index].id.toString()),
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      bottom: 16.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          color: tAccentColor,
                          child: Text(
                            items[index].name,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  String pokedexIdFormated(String id) {
    NumberFormat format = NumberFormat("0000");
    StringBuffer buf = StringBuffer();
    buf.write("#");
    buf.write(format.format(int.parse(id)));
    return buf.toString();
  }
}
