import 'package:flutter/material.dart';
import 'package:marvel/screens/home/blocs/characters_bloc.dart';
import 'package:marvel/blocs/bloc_provider.dart';
import 'package:marvel/models/marvel_character.dart';
import 'package:marvel/models/response_characters.dart';
import 'package:marvel/screens/home/widgets/item_marvel.dart';

class CharactersList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<CharactersBloc>(context);

    return StreamBuilder<List<MarvelCharacter>>(
      stream: bloc.charactersList,
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()));
        }

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final List<MarvelCharacter> list = snapshot.data;

        return ListView.separated(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemMarvel(
              character: list[index],
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        );
      },
    );
  }
}
