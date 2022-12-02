import 'package:flutter/material.dart';
import 'package:kenteken/components/input.dart';
import 'package:kenteken/models/car.dart';

class TagSearch extends StatefulWidget {
  final TextEditingController brand;
  String dropdownValue;
  final void Function(String?)? onChange;
  final TextEditingController buildYear;
  final double width;
  TagSearch(
      {super.key,
      required this.brand,
      required this.width,
      required this.dropdownValue,
      required this.onChange,
      required this.buildYear});

  @override
  State<TagSearch> createState() => _TagSearch();
}

const List<String> options = [
  "Personenauto",
  'Land- of bosbouwtrekker',
  "Motorfiets",
  'Motorrijtuig met beperkte snelheid',
  'Mobiele machine'
];

class _TagSearch extends State<TagSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.width / 1.3,
          child: Input(
            prefixIcon: Icons.shopping_bag_rounded,
            labelText: "Merk",
            hintText: "Vul hier het merk in",
            controller: widget.brand,
            validation: (value) {
              if (value != null && value.isEmpty) {
                return "Vul veld merk in.";
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        DropdownButton<String>(
          value: widget.dropdownValue,
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: widget.onChange,
        ),
        const SizedBox(
          height: 7,
        ),
        SizedBox(
          width: widget.width / 1.3,
          child: Input(
            prefixIcon: Icons.calendar_today,
            labelText: "Bouwjaar",
            hintText: "Vul hier het bouwjaar in",
            controller: widget.buildYear,
            validation: (value) {
              if (value!.isEmpty) {
                return "Vul veld bouwjaar in.";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
