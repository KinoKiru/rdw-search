import 'package:flutter/material.dart';
import 'package:kenteken/pages/car_list.dart';
import 'package:kenteken/pages/details.dart';
import 'package:kenteken/pages/error.dart';
import 'package:kenteken/services/remote_service.dart';

class Loader extends StatefulWidget {
  final String params;
  const Loader({
    super.key,
    required this.params,
  });

  @override
  State<Loader> createState() => _Loader();
}

class _Loader extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    RemoteService service = RemoteService();
    return FutureBuilder(
      future: service.getCars(widget.params),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null && snapshot.data!.isNotEmpty) {
            if (snapshot.data!.length > 1) {
              return CarList(list: snapshot.data!);
            } else {
              return Details(car: snapshot.data![0]);
            }
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Helaas niks gevonden"),
              ),
              body: const Center(
                  child: Text("helaas hebben we geen data kunnen vinden")),
            );
          }
        } else if (snapshot.hasError) {
          return Error(error: snapshot.error.toString());
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      }),
    );
  }
}
