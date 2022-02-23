import 'package:pokemons/feature/data/datasources/person_remote_data_source.dart';
import 'package:pokemons/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemons/feature/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  Future<List<PokemonEntity>> getAllPokemons() async {
    return await remoteDataSource.getAllPokemons();
  }
}
