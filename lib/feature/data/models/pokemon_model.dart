import 'package:pokemons/feature/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({required name, required url}) : super(name: name, url: url);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
        name: json['name'] as String, url: json['url'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
