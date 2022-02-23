import 'package:pokemons/feature/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getAllPokemons();
}
