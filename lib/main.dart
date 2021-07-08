import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/nav_cubit.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_cubit.dart';
import 'package:pokedex/bloc/pokemon_event.dart';

import 'app_navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pokemonDetailsCubit = PokemonDetailsCubit();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.red, accentColor: Colors.redAccent),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => PokemonBloc()
            ..add(
              PokemonPageRequest(page: 0),
            ),
        ),
        BlocProvider(
          create: (context) =>
              NavCubit(pokemonDetailsCubit: pokemonDetailsCubit),
        ),
        BlocProvider(
          create: (context) => PokemonDetailsCubit(),
        ),
      ], child: AppNavigator()),
    );
  }
}
