import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/feature/presentation/bloc/pokemons_list_cubit/pokemon_cubit.dart';
import 'package:pokemons/feature/presentation/bloc/pokemons_list_cubit/pokemon_state.dart';
import 'package:pokemons/feature/resources/app_strings.dart';
import 'package:pokemons/locator_service.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final PokemonCubit cubit = sl<PokemonCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
      builder: (context, state) {
        if (state is PokemonEmptyState) {
          return const Center(
            child: Text(
              AppStrings.noData,
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        if (state is PokemonLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PokemonLoadedState) {
          return ListView.builder(
            itemCount: state.loadedPokemons.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: ListTile(
                leading: Image.network(
                    'https://raw.githubusercontent'
                    '.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}'
                    '.png',
                    fit: BoxFit.cover),
                subtitle: Text(
                  '${state.loadedPokemons[index].url}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Text(
                  capitalize('${state.loadedPokemons[index].name}'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }
        if (state is NoConnectionState) {
          Future.delayed(Duration.zero, () async {
            _showDialog();
          });
        }
        if (state is NoConnectionStateInform) {
          return const Text(AppStrings.noConnection);
        }
        if (state is PokemonErrorState) {
          return const Center(
            child: Text(
              AppStrings.errorFetching,
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text(AppStrings.message),
              content: const Text(AppStrings.youHaveNotConnection),
              actions: <Widget>[
                ElevatedButton(
                    child: const Text(AppStrings.ok),
                    onPressed: () {
                      cubit.buildDialog();
                      Navigator.of(context).pop(true);
                    })
              ]);
        });
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
