import 'package:get_it/get_it.dart';
import 'package:pokemons/core/platform/network_info.dart';
import 'package:pokemons/feature/data/datasources/person_remote_data_source.dart';
import 'package:pokemons/feature/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemons/feature/domain/repositories/pokemon_repository.dart';
import 'package:pokemons/feature/domain/usecases/get_all_pokemons.dart';
import 'package:pokemons/feature/presentation/bloc/pokemons_list_cubit/pokemon_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(
    () => PokemonCubit(),
  );

  // UseCases
  sl.registerLazySingleton(() => GetAllPokemons(sl()));

  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(),
  );

  sl.registerLazySingleton(() => http.Client());
}
