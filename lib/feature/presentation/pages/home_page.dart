import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/feature/presentation/bloc/pokemons_list_cubit/pokemon_cubit.dart';
import 'package:pokemons/feature/presentation/pages/pokemon_list.dart';
import 'package:pokemons/feature/resources/app_colors.dart';
import 'package:pokemons/feature/resources/app_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonCubit>(
      create: (context) => PokemonCubit()..fetchUsers(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.greyForAppBar,
          title: const Text(AppStrings.pokemonsList),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
