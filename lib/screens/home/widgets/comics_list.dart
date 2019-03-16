import 'package:flutter/material.dart';
import 'package:marvel/blocs/bloc_provider.dart';
import 'package:marvel/models/serie.dart';
import 'package:marvel/screens/home/blocs/comics_bloc.dart';
import 'package:marvel/models/marvel_character.dart';

class ComicsList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ComicsBloc>(context);
    return StreamBuilder<List<Serie>>(
      stream: bloc.comicsList,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final List<Serie> list = snapshot.data;
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            final serie = list[index];
            final imageUrl =
                serie.thumbnail.path + "." + serie.thumbnail.extension;
            return Image.network(imageUrl);
          },
        );
      },
    );
  }
}
