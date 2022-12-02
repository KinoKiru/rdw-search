import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kenteken/components/tag_search.dart';
import 'package:kenteken/components/Loader.dart';
import 'package:kenteken/components/board_search.dart';

void main() async {
  await Jiffy.locale("nl");
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kenteken',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const Home(title: 'Kenteken'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>();
  bool numberSearch = true;
  bool texterror = false;
  TextEditingController board = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController buildYear = TextEditingController();
  String type = "Personenauto";

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.black12,
          height: sizeY,
          width: sizeX,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Zoeken op kenteken"),
                    Switch(
                        value: numberSearch,
                        onChanged: (bool value) {
                          setState(() {
                            numberSearch = value;
                          });
                        }),
                  ],
                ),
                if (numberSearch) ...[
                  Container(
                    padding: const EdgeInsets.only(
                        top: 5, left: 20, right: 20, bottom: 4),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade50,
                        border: Border.all(width: 1, color: Colors.black26),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Zoeken op kenteken",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10,
                        ),
                        BoardSearch(
                          board: board,
                          width: sizeX,
                        ),
                      ],
                    ),
                  )
                ] else ...[
                  Container(
                    padding: const EdgeInsets.only(
                        top: 5, left: 20, right: 20, bottom: 20),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade50,
                        border: Border.all(width: 1, color: Colors.black26),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Zoeken op opties",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10,
                        ),
                        TagSearch(
                            brand: brand,
                            onChange: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                type = value!;
                              });
                            },
                            width: sizeX,
                            dropdownValue: type,
                            buildYear: buildYear),
                      ],
                    ),
                  )
                ],
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        fixedSize: Size((sizeX / 1.3), 20)),
                    onPressed: () => {
                          if (formKey.currentState!.validate())
                            {
                              route(board.text, type, brand.text,
                                  buildYear.text, numberSearch)
                            }
                        },
                    child: const Text('Zoeken!'))
              ],
            ),
          ),
        ));
  }

  void route(String? text, String? type, String? merk, String? bouwjaar,
      bool? plateSearch) {
    String options = "";
    print(type);
    if (plateSearch != null && plateSearch) {
      options = '?kenteken=${text!.replaceAll('-', '').toUpperCase()}';
    } else {
      options =
          '?voertuigsoort=${type![0].toUpperCase() + type.substring(1).toLowerCase()}&merk=${merk!.toUpperCase()}&\$where=datum_tenaamstelling>=${bouwjaar}0101 AND datum_tenaamstelling<=${bouwjaar}1231';
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Loader(params: options)),
    );
  }
}
