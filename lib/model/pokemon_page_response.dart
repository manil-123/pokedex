// "count": 1118,
// "next": "https://pokeapi.co/api/v2/pokemon?offset=40&limit=20",
// "previous": "https://pokeapi.co/api/v2/pokemon?offset=0&limit=20",
// "results": [
// {
// "name": "spearow",
// "url": "https://pokeapi.co/api/v2/pokemon/21/"
// },
// {
// "name": "fearow",
// "url": "https://pokeapi.co/api/v2/pokemon/22/"
//},

import 'package:flutter/cupertino.dart';

class PokemonListing {
  late final int? id;
  late final String? name;

  PokemonListing({@required this.id, @required this.name});

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'];
    final id = int.parse(url.split('/')[6]);
    return PokemonListing(id: id, name: name);
  }
}

class PokemonPageResponse {
  late final List<PokemonListing>? pokemonListings;
  late final bool? canLoadPage;

  PokemonPageResponse(
      {@required this.pokemonListings, @required this.canLoadPage});

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadPage = json['next'] != null;
    final pokemonListings = (json['results'] as List)
        .map((listingJson) => PokemonListing.fromJson(listingJson))
        .toList();
    return PokemonPageResponse(
        pokemonListings: pokemonListings, canLoadPage: canLoadPage);
  }
}
