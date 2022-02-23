import 'package:pokemons/core/usecases/usecase.dart';
import 'package:pokemons/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemons/feature/domain/repositories/pokemon_repository.dart';

class GetAllPokemons extends UseCase {
  final PokemonRepository pokemonRepository;

  GetAllPokemons(this.pokemonRepository);

  @override
  Future<List<PokemonEntity>> call() async {
    return await pokemonRepository.getAllPokemons();
  }
}
