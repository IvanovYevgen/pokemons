import 'package:pokemons/feature/domain/entities/pokemon_entity.dart';

abstract class PokemonState {}

class PokemonEmptyState extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonLoadedState extends PokemonState {
  List<PokemonEntity> loadedPokemons;

  PokemonLoadedState({required this.loadedPokemons});
}

class NoConnectionState extends PokemonState {}

class NoConnectionStateInform extends PokemonState {}

class PokemonErrorState extends PokemonState {}
