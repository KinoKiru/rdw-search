// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      kenteken: json['kenteken'] as String,
      voertuigSoort: json['voertuigsoort'] as String,
      merk: json['merk'] as String,
      eersteKleur: json['eerste_kleur'] as String,
      tweedeKleur: json['tweede_kleur'] as String? ?? "",
      datumEersteToelating:
          DateTime.parse(json['datum_eerste_toelating'] as String),
      vervaldatumApkDt: json['vervaldatum_apk_dt'] == null
          ? null
          : DateTime.parse(json['vervaldatum_apk_dt'] as String),
      model: json['handelsbenaming'] as String?,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'kenteken': instance.kenteken,
      'merk': instance.merk,
      'voertuigsoort': instance.voertuigSoort,
      'eerste_kleur': instance.eersteKleur,
      'tweede_kleur': instance.tweedeKleur,
      'datum_eerste_toelating': instance.datumEersteToelating.toIso8601String(),
      'vervaldatum_apk_dt': instance.vervaldatumApkDt?.toIso8601String(),
      'handelsbenaming': instance.model,
    };
