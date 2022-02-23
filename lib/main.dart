import 'package:flutter/material.dart';
import 'package:pokemons/feature/domain/usecases/get_all_pokemons.dart';
import 'package:pokemons/feature/presentation/pages/home_page.dart';

import 'package:pokemons/locator_service.dart' as di;
import 'package:pokemons/locator_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final getAllPokemons = sl<GetAllPokemons>();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
