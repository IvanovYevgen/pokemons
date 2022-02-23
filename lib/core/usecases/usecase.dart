import 'package:pokemons/feature/domain/entities/pokemon_entity.dart';

abstract class UseCase {
  Future<List<PokemonEntity>> call();
}
