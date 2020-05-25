import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'data_from_file.g.dart';

@JsonSerializable()
class Data {
  List<Movie> movies;

  Data(this.movies);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
