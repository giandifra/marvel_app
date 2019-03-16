import 'package:marvel/models/marvel_character.dart';
import 'package:marvel/models/response_characters.dart';
import 'package:marvel/models/serie.dart';
import 'package:marvel/models/tmp.dart';
import 'package:marvel/utilities/utilities.dart';
import 'package:marvel/utilities/secrets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Repository {
  final String BASE_URL = 'https://gateway.marvel.com/v1/public';

  Future<List<MarvelCharacter>> getCharacters() async {
    final url = buildUrl("/characters");
    //Effettuo la chiamata GET HTTP
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //Decodifico il body del response
      final jsonDecode = json.decode(response.body);

      final ResponseCharacters characters =
          ResponseCharacters.fromJson(jsonDecode);

      final List<MarvelCharacter> charactersList = characters.data.results;
      return charactersList;
    } else {
      throw Exception("Errore status code: ${response.statusCode}");
    }
  }

  Future<List<Serie>> getComics() async {
    final url = buildUrl("/series");
    //Effettuo la chiamata GET HTTP
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //Decodifico il body del response
      final jsonDecode = json.decode(response.body);

      final ResponseSeries seriesResponse = ResponseSeries.fromJson(jsonDecode);

      final List<Serie> series = seriesResponse.data.results;
      return series;
    } else {
      throw Exception("Errore status code: ${response.statusCode}");
    }
  }

  buildUrl(String queryUrl) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = generateMd5('$timestamp$privateKey$publicKey');
    return BASE_URL + "$queryUrl?apikey=$publicKey&hash=$hash&ts=$timestamp";
  }
}
