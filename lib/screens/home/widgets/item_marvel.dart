import 'package:flutter/material.dart';
import 'package:marvel/screens/home/blocs/characters_bloc.dart';
import 'package:marvel/blocs/bloc_provider.dart';
import 'package:marvel/models/marvel_character.dart';

class ItemMarvel extends StatelessWidget {
  final MarvelCharacter character;

  const ItemMarvel({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CharactersBloc>(context);
    return ListTile(
      title: Text(character.name,style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(character.description),
      leading: Container(
        height: 50.0,
        width: 50.0,
        child: ClipOval(
//          backgroundColor: Colors.red,
//          radius: 30.0,
          child: Image.network(
            character.thumbnail.path + "." + character.thumbnail.extension,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
