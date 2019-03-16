import 'package:marvel/blocs/bloc_provider.dart';
import 'package:marvel/models/marvel_character.dart';
import 'package:marvel/models/response_characters.dart';
import 'package:marvel/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class CharactersBloc extends BlocBase{

  BehaviorSubject<List<MarvelCharacter>> _list = BehaviorSubject<List<MarvelCharacter>>();

  Observable<List<MarvelCharacter>> get charactersList => _list.stream;

  Repository repository;

  CharactersBloc() {
    repository = Repository();
    getCharacters();
  }

  //Aggiorna la lista dei personaggi
  getCharacters() async {
    try{
      final list = await repository.getCharacters();
      _list.sink.add(list);
    }catch(ex){
      _list.sink.addError(ex.toString());
    }
  }

  @override
  dispose(){
    _list.close();
  }
}
