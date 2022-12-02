import 'package:json_annotation/json_annotation.dart';

part 'car.g.dart';

@JsonSerializable()
class Car {
  final String kenteken, merk;

  @JsonKey(name: 'voertuigsoort')
  final String voertuigSoort;

  @JsonKey(name: 'eerste_kleur')
  final String eersteKleur;

  @JsonKey(name: 'tweede_kleur')
  final String tweedeKleur;

  @JsonKey(name: 'datum_eerste_toelating')
  final DateTime datumEersteToelating;

  @JsonKey(name: 'vervaldatum_apk_dt')
  final DateTime? vervaldatumApkDt;

  @JsonKey(name: 'handelsbenaming')
  final String? model;

  Car(
      {required this.kenteken,
      required this.voertuigSoort,
      required this.merk,
      required this.eersteKleur,
      this.tweedeKleur = "",
      required this.datumEersteToelating,
      required this.vervaldatumApkDt,
      required this.model});

  // Use JsonSerializable to generate json files
  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);
}
