import 'package:flutter/material.dart';
import 'package:marvel/screens/home/widgets/characters_list.dart';
import 'package:marvel/screens/home/widgets/comics_list.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Marvel APP")),
      body: Column(
        children: <Widget>[
          Container(height: 150.0, child: ComicsList()),
          Divider(),
          Expanded(child: CharactersList()),
        ],
      ),
    );
  }
}
