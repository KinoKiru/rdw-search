import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kenteken/models/car.dart';
import 'package:kenteken/pages/error.dart';
import 'package:kenteken/services/remote_service.dart';

class Details extends StatefulWidget {
  final Car car;
  const Details({
    super.key,
    required this.car,
  });

  @override
  State<Details> createState() => _Details();
}

class _Details extends State<Details> {
  @override
  Widget build(BuildContext context) {
    RemoteService service = RemoteService();
    return FutureBuilder(
      future:
          service.getImage('${widget.car.merk} ${widget.car.model} vehicle'),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.car.model!),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.network(snapshot.data!.photos[0].src.medium),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Merk: ${widget.car.merk}"),
                      Text("Model: ${widget.car.model}"),
                      Text('Kenteken: ${widget.car.kenteken}'),
                      Text("Eerste kleur: ${widget.car.eersteKleur}"),
                      Text("Tweede kleur: ${widget.car.tweedeKleur}"),
                      if (widget.car.vervaldatumApkDt != null)
                        Text(
                            "Verval APK: ${Jiffy(widget.car.vervaldatumApkDt).format("d MMMM y")}"),
                      Text("Soort: ${widget.car.voertuigSoort}"),
                    ],
                  )
                ],
              ),
            );
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
