import 'package:json_annotation/json_annotation.dart';

part 'car_image.g.dart';

@JsonSerializable()
class Photos {
  @JsonKey(name: 'photos')
  final List<Photo> photos;

  Photos({
    required this.photos,
  });

  // Use JsonSerializable to generate json files
  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosToJson(this);
}

@JsonSerializable()
class Photo {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'width')
  final int width;
  @JsonKey(name: 'height')
  final int height;
  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'src')
  final Src src;

  Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.src,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable()
class Src {
  final String original,
      large2x,
      large,
      medium,
      small,
      portrait,
      landscape,
      tiny;

  Src({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) => _$SrcFromJson(json);

  Map<String, dynamic> toJson() => _$SrcToJson(this);
}
