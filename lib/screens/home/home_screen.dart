import 'package:flutter/material.dart';
import 'package:marvel/screens/home/widgets/characters_list.dart';
import 'package:marvel/screens/home/widgets/comics_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Marvel APP")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Series',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            height: 150.0,
            padding: const EdgeInsets.all(8.0),
            child: ComicsList(),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Characters',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),
          ),
          Expanded(child: CharactersList()),
        ],
      ),
    );
  }
}
