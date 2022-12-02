import 'package:flutter/material.dart';
import 'package:kenteken/models/car.dart';

class Error extends StatefulWidget {
  final String error;
  const Error({
    super.key,
    this.error = "Sorry er zijn wat problemen onstaan",
  });

  @override
  State<Error> createState() => _Error();
}

class _Error extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oops!"),
      ),
      body: Center(child: Text(widget.error)),
    );
  }
}
