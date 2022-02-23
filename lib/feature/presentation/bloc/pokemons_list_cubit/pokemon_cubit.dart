import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/core/platform/network_info.dart';
import 'package:pokemons/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemons/feature/domain/usecases/get_all_pokemons.dart';
import 'package:pokemons/feature/presentation/bloc/pokemons_list_cubit/pokemon_state.dart';
import 'package:pokemons/locator_service.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final GetAllPokemons getAllPokemons = sl<GetAllPokemons>();
  final NetworkInfo networkConnection = sl<NetworkInfo>();

  PokemonCubit() : super(PokemonEmptyState());




  Future<void> fetchUsers() async {
    bool hasConnection = await networkConnection.isConnected();
    if(hasConnection){
      try {
        emit(PokemonLoadingState());
        final List<PokemonEntity> _loadedList = await getAllPokemons.call();
        emit(PokemonLoadedState(loadedPokemons: _loadedList));
      } catch (_) {
        emit(PokemonErrorState());
      }
    } else{
      emit (NoConnectionState());
    }
  }

  Future<void> buildDialog() async {
    emit(NoConnectionStateInform());
  }

}
