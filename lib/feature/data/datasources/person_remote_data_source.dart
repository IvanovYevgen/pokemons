import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemons/feature/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getAllPokemons();
}
class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;
  /// TODO add go to next
  /// TODO pagination

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PokemonModel>> getAllPokemons() => _getPokemonsFromUrl(
  'https://pokeapi.co/api/v2/pokemon?offset=0&limit=20');

  Future<List<PokemonModel>> _getPokemonsFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final pokemons = json.decode(response.body);
      final list=(pokemons['results'] as List)
          .map((pokemon) => PokemonModel.fromJson(pokemon))
          .toList();
      return list;
    } else {
      throw Exception('Error fetching pokemons');
    }
  }
}
