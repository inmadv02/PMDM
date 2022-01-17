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
        primarySwatch: Colors.blue,
      ),
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
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.

            child: SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.28,
                child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        elevation: 4,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: const [
                                              Text(' 20:55',
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      TextStyle(fontSize: 17)),
                                              Text('SALIDA',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 11))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(width: 50),
                                    Row(children: [
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 30.0, 5, 9),
                                                  child: Container(
                                                    child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Text('MAD',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 13))),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color:
                                                                Colors.black)),
                                                  )),
                                              const Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      5, 30.0, 5, 9),
                                                  child: Text(
                                                    'Madrid',
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset('assets/logo.png',
                                                  width: 25),
                                              Text(' Iberia 7448',
                                                  style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontWeight:
                                                          FontWeight.w500))
                                            ],
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      13, 3, 0, 2),
                                              child: Text('Duración 2h 10min',
                                                  style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontWeight:
                                                          FontWeight.w500)))
                                        ],
                                      )
                                    ]),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: const [
                                              Text(' 22:05',
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      TextStyle(fontSize: 17)),
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      9, 2, 2, 3),
                                                  child: Text(' LLEGADA',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 11)))
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 50),
                                      Row(children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        16, 7.0, 5, 7),
                                                    child: Container(
                                                      child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  3.5),
                                                          child: Text('LHR',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      13))),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color: Colors
                                                                  .black)),
                                                    )),
                                                Text(
                                                  'Londres',
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ])
                                    ])
                              ],
                            )))))));
  }
}
