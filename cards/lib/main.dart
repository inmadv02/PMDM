import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(backgroundColor: Colors.grey[600]),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: <Widget>[
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 20.0),
                        child: Text('El más barato, Buena puntuación',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.tealAccent[400]))),
                    Container(
                        margin: const EdgeInsets.only(left: 40.0),
                        child: const Text('45 ofertas',
                            style: TextStyle(color: Colors.grey)))
                  ],
                ),
                const SizedBox(height: 20),
                Image.asset('assets/coche.png', width: 200),
                Row(children: const [
                  Text('Mini',
                      textAlign: TextAlign.left, style: TextStyle(fontSize: 18))
                ]),
                const SizedBox(height: 7),
                Row(children: const [
                  Text('2-3 puertas · Citroen C1 Diesel o similar',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey))
                ]),
                const SizedBox(height: 7),
                Row(
                  children: const [
                    Text('Man'),
                    SizedBox(width: 15),
                    Icon(
                      Icons.ac_unit,
                      size: 14,
                    ),
                    SizedBox(width: 6),
                    Text('A/A'),
                    SizedBox(width: 15),
                    Icon(
                      Icons.person,
                      size: 17,
                    ),
                    SizedBox(width: 6),
                    Text('4'),
                    SizedBox(width: 17),
                    Icon(
                      Icons.card_travel,
                      size: 14,
                    ),
                    SizedBox(width: 9),
                    Text('1')
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                ),
                Row(children: [
                  Container(
                      margin: const EdgeInsets.only(right: 106.0),
                      child: Text('35€',
                          style: TextStyle(color: Colors.blue[900]))),
                  Container(
                      margin: const EdgeInsets.only(left: 106.0),
                      child: Text('SELECCIONAR',
                          style: TextStyle(color: Colors.blue[900])))
                ])
              ]),
            ),
          ),
        ),
      )),
    );
  }
}
