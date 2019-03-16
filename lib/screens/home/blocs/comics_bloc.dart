import 'package:marvel/blocs/bloc_provider.dart';
import 'package:marvel/models/marvel_character.dart';
import 'package:marvel/models/response_characters.dart';
import 'package:marvel/models/serie.dart';
import 'package:marvel/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class ComicsBloc extends BlocBase {

  BehaviorSubject<List<Serie>> _list = BehaviorSubject<List<Serie>>();

  Observable<List<Serie>> get comicsList => _list.stream;

  Repository repository;
  ComicsBloc(){
    repository = Repository();
    getComics();
  }

  getComics() async {
    final list = await repository.getComics();
    _list.sink.add(list);
  }

  @override
  void dispose() {
    _list.close();
  }

}
