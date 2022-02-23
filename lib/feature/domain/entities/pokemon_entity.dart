import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final String? name;
  final String? url;

  PokemonEntity({this.name, this.url});

  @override
  List<Object?> get props => [name, url];
}