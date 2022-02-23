import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/feature/domain/usecases/get_all_pokemons.dart';
import 'package:pokemons/feature/presentation/bloc/pokemons_list_cubit/pokemon_cubit.dart';
import 'package:pokemons/feature/presentation/pages/pokemon_list.dart';
import 'package:pokemons/locator_service.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonCubit>(
      create: (context) => PokemonCubit()
        ..fetchUsers(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Pokemons List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
