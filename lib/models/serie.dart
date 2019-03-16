import 'package:marvel/models/comics.dart';
import 'package:marvel/models/events.dart';
import 'package:marvel/models/response_characters.dart';
import 'package:marvel/models/stories.dart';
import 'package:marvel/models/thumbnail.dart';
import 'package:marvel/models/tmp.dart';

class Serie {
  int id;
  String title;
  String description;
  String resourceURI;
  List<Urls> urls;
  int startYear;
  int endYear;
  String rating;
  String type;
  String modified;
  Thumbnail thumbnail;
  Creators creators;
  Characters characters;
  Stories stories;
  Comics comics;
  Events events;

  Serie(
      {this.id,
        this.title,
        this.description,
        this.resourceURI,
        this.urls,
        this.startYear,
        this.endYear,
        this.rating,
        this.type,
        this.modified,
        this.thumbnail,
        this.creators,
        this.characters,
        this.stories,
        this.comics,
        this.events,});

  Serie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'] ?? "";
    resourceURI = json['resourceURI'];
    if (json['urls'] != null) {
      urls = new List<Urls>();
      json['urls'].forEach((v) {
        urls.add(new Urls.fromJson(v));
      });
    }
    startYear = json['startYear'];
    endYear = json['endYear'];
    rating = json['rating'];
    type = json['type'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    creators = json['creators'] != null
        ? new Creators.fromJson(json['creators'])
        : null;
    characters = json['characters'] != null
        ? new Characters.fromJson(json['characters'])
        : null;
    stories =
    json['stories'] != null ? new Stories.fromJson(json['stories']) : null;
    comics =
    json['comics'] != null ? new Comics.fromJson(json['comics']) : null;
    events =
    json['events'] != null ? new Events.fromJson(json['events']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['resourceURI'] = this.resourceURI;
    if (this.urls != null) {
      data['urls'] = this.urls.map((v) => v.toJson()).toList();
    }
    data['startYear'] = this.startYear;
    data['endYear'] = this.endYear;
    data['rating'] = this.rating;
    data['type'] = this.type;
    data['modified'] = this.modified;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    if (this.creators != null) {
      data['creators'] = this.creators.toJson();
    }
    if (this.characters != null) {
      data['characters'] = this.characters.toJson();
    }
    if (this.stories != null) {
      data['stories'] = this.stories.toJson();
    }
    if (this.comics != null) {
      data['comics'] = this.comics.toJson();
    }
    if (this.events != null) {
      data['events'] = this.events.toJson();
    }

    return data;
  }
}