import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/constants/sizes.dart';
import 'package:flutterproject/models/pokemon_model.dart';
import 'package:flutterproject/services/api/bloc/api_bloc.dart';
import 'package:flutterproject/services/api/bloc/api_state.dart';
import 'package:flutterproject/ui/views/details_appbar.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiBloc, ApiState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ApiStateDetails) {
          return Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                DetailsAppBar(img: state.pokemon.sprites.frontDefault),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.pokemon.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: tLightGrey,
                          height: 2,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.pokemon.height.toString()),
                            Text(state.pokemon.weight.toString()),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(typesToString(state.pokemon.types)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 75,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'HP: ',
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: tFormHeight,
                                      width: state.pokemon.stats[0].baseStat
                                          .toDouble(),
                                      child: Container(
                                        color: tHpColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 75,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Attack: ',
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: tFormHeight,
                                      width: state.pokemon.stats[1].baseStat
                                          .toDouble(),
                                      child: Container(
                                        color: tAttackColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 75,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Defense: ',
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: tFormHeight,
                                      width: state.pokemon.stats[2].baseStat
                                          .toDouble(),
                                      child: Container(
                                        color: tDefenseColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 75,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Special Attack: ',
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: tFormHeight,
                                      width: state.pokemon.stats[3].baseStat
                                          .toDouble(),
                                      child: Container(
                                        color: tSpecialAttackColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 75,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Special Defense: ',
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: tFormHeight,
                                      width: state.pokemon.stats[4].baseStat
                                          .toDouble(),
                                      child: Container(
                                        color: tSpecialDefenseColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 75,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Speed: ',
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: tFormHeight,
                                      width: state.pokemon.stats[5].baseStat
                                          .toDouble(),
                                      child: Container(
                                        color: tSpeedColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Text('Not the right event'),
          );
        }
      },
    );
  }

  String typesToString(List<PokemonType> types) {
    StringBuffer sb = StringBuffer();
    sb.write("Types: ");
    types.forEach((t) {
      sb.write(t.name);
      sb.write(" ");
    });
    return sb.toString();
  }
}
