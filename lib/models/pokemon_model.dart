// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  int height;
  int id;
  String name;
  Sprites sprites;
  List<StatElement> stats;
  List<Type> types;
  int weight;

  PokemonModel({
    required this.height,
    required this.id,
    required this.name,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        height: json["height"],
        id: json["id"],
        name: json["name"],
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<StatElement>.from(
            json["stats"].map((x) => StatElement.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "id": id,
        "name": name,
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
      };
}

class Sprites {
  String frontDefault;

  Sprites({
    required this.frontDefault,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}

class StatElement {
  int baseStat;
  TypeClass stat;

  StatElement({
    required this.baseStat,
    required this.stat,
  });

  factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
        baseStat: json["base_stat"],
        stat: TypeClass.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "stat": stat.toJson(),
      };
}

class TypeClass {
  String name;

  TypeClass({
    required this.name,
  });

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Type {
  TypeClass? type;
  int? slot;
  String? name;

  Type({
    this.type,
    this.slot,
    this.name,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: json["type"] == null ? null : TypeClass.fromJson(json["type"]),
        slot: json["slot"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "type": type?.toJson(),
        "slot": slot,
        "name": name,
      };
}
