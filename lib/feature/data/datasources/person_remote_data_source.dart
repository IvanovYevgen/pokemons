import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemons/feature/data/models/pokemon_model.dart';
import 'package:pokemons/feature/resources/app_constants.dart';
import 'package:pokemons/feature/resources/app_strings.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getAllPokemons();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PokemonModel>> getAllPokemons() =>
      _getPokemonsFromUrl(AppConstants.pokemonsUrl);

  Future<List<PokemonModel>> _getPokemonsFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final pokemons = json.decode(response.body);
      final list = (pokemons[AppConstants.results] as List)
          .map((pokemon) => PokemonModel.fromJson(pokemon))
          .toList();
      return list;
    } else {
      throw Exception(AppStrings.errorFetchingPokemonsMessage);
    }
  }
}
