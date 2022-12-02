import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kenteken/models/car.dart';
import 'package:kenteken/pages/details.dart';
import 'package:kenteken/services/remote_service.dart';

class CarList extends StatefulWidget {
  final List<Car> list;

  const CarList({
    super.key,
    required this.list,
  });

  State<CarList> createState() => _CarList();
}

class _CarList extends State<CarList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lijst van voertuigen'),
      ),
      body: Scrollbar(
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(car: widget.list[index]),
                    ));
              },
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black)),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      getIcon(widget.list[index]),
                      size: 20.0,
                    ),
                    Text(
                      widget.list[index].merk,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10),
                    ),
                    if (widget.list[index].model != null) ...[
                      SizedBox(
                        width: 80,
                        child: Text(
                          widget.list[index].model!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 10),
                        ),
                      )
                    ] else ...[
                      const Text(
                        "Geen",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                    Text(
                      widget.list[index].kenteken,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  IconData getIcon(Car item) {
    switch (item.voertuigSoort) {
      case 'Personenauto':
        return FontAwesomeIcons.car;
      case 'Land- of bosbouwtrekker':
        return FontAwesomeIcons.tractor;
      case "Motorfiets":
        return FontAwesomeIcons.motorcycle;
      case 'Motorrijtuig met beperkte snelheid':
        return FontAwesomeIcons.hourglass;
      case 'Mobiele machine':
        return FontAwesomeIcons.personDigging;
      default:
        return FontAwesomeIcons.x;
    }
  }
}
