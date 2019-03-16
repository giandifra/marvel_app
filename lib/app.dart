import 'package:flutter/material.dart';
import 'package:marvel/blocs/bloc_provider.dart';
import 'package:marvel/screens/home/blocs/characters_bloc.dart';
import 'package:marvel/screens/home/blocs/comics_bloc.dart';
import 'package:marvel/screens/home/home_screen.dart';

class MarvelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProviderTree(
        child: HomeScreen(),
        blocProviders: <BlocProvider>[
          BlocProvider<CharactersBloc>(
            bloc: CharactersBloc(),
          ),
          BlocProvider<ComicsBloc>(
            bloc: ComicsBloc(),
          ),
        ],
      ),
    );
  }
}
