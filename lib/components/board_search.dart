import 'package:flutter/material.dart';
import 'package:kenteken/components/input.dart';

class BoardSearch extends StatefulWidget {
  final TextEditingController board;
  final double width;
  const BoardSearch({super.key, required this.board, required this.width});

  @override
  State<BoardSearch> createState() => _BoardSearch();
}

class _BoardSearch extends State<BoardSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width / 1.3,
      child: Input(
        maxLength: 9,
        labelText: "Kenteken",
        hintText: 'Voer hier een kenteken in',
        prefixIcon: Icons.car_rental,
        controller: widget.board,
        validation: (value) {
          if (value!.isEmpty || !validateBoard(value) || value.length < 6) {
            return "Vul correcte kenteken in.";
          }
          return null;
        },
      ),
    );
  }
}

bool validateBoard(String text) {
  text = text.replaceAll('-', '').toUpperCase();
  RegExp expressionDiplomat = RegExp(r"CD[ABFJNST][0-9]{1,3}");
  List<RegExp> expressions = List.empty(growable: true);
  expressions.add(RegExp(r"[^aeiouAEIOU\d]{2}[\d]{2}[\d]{2}"));
  expressions.add(RegExp(r"[\d]{2}[\d]{2}[^aeiouAEIOU\d]{2}"));
  expressions.add(RegExp(r"[\d]{2}[^aeiouAEIOU\d]{2}[\d]{2}"));
  expressions.add(RegExp(r"[^aeiouAEIOU\d]{2}[\d]{2}[^aeiouAEIOU\d]{2}"));
  expressions.add(RegExp(r"[^aeiouAEIOU\d]{2}[^aeiouAEIOU\d]{2}[\d]{2}"));
  expressions.add(RegExp(r"[\d]{2}[^aeiouAEIOU\d]{2}[^aeiouAEIOU\d]{2}"));
  expressions.add(RegExp(r"[\d]{2}[^aeiouAEIOU\d]{3}[\d]{1}"));
  expressions.add(RegExp(r"[\d]{1}[^aeiouAEIOU\d]{3}[\d]{2}"));
  expressions.add(RegExp(r"[^aeiouAEIOU\d]{2}[\d]{3}[^aeiouAEIOU\d]{1}"));
  expressions.add(RegExp(r"[^aeiouAEIOU\d]{1}[\d]{3}[^aeiouAEIOU\d]{2}"));
  expressions.add(RegExp(r"[^aeiouAEIOU\d]{3}[\d]{2}[^aeiouAEIOU\d]{1}"));
  expressions.add(RegExp(r"[^aeiouAEIOU\d]{1}[\d]{2}[^aeiouAEIOU\d]{3}"));
  expressions.add(RegExp(r"[\d]{1}[^aeiouAEIOU\d]{2}[\d]{3}"));
  expressions.add(RegExp(r"[\d]{3}[^aeiouAEIOU\d]{2}[\d]{1}"));
  expressions.add(RegExp(r"HELLO"));

  for (int i = 0; i < expressions.length; i++) {
    if (expressions[i].hasMatch(text)) {
      return true;
    } else if (expressionDiplomat.hasMatch(text)) {
      return true;
    }
  }
  return false;
}
