import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'models/people.dart';
import 'models/planets.dart';

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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Person>> items;
  late Future<List<Results>> items2;

  @override
  void initState() {
    items = fetchPeople();
    items2 = fetchPlanets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Star Wars'),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/fondo.jpg"), fit: BoxFit.cover),
              ),
            ),
            Column(
              children: [
                FutureBuilder<List<Person>>(
                  future: items,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _peopleList(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                FutureBuilder<List<Results>>(
                  future: items2,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _planetsList(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const Center(child: CircularProgressIndicator());
                  },
                )
              ],
            ),
          ],
        ));
  }

  Future<List<Person>> fetchPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));
    if (response.statusCode == 200) {
      return People.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load StarWars´s characters');
    }
  }

  Future<List<Results>> fetchPlanets() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/planets'));
    if (response.statusCode == 200) {
      return AutoGenerate.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load StarWars´s characters');
    }
  }

  Widget _peopleList(List<Person> peopleList) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: peopleList.length,
        itemBuilder: (context, index) {
          return _personItem(peopleList.elementAt(index), index);
        },
      ),
    );
  }

  Widget _planetsList(List<Results> planetsList) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: planetsList.length,
        itemBuilder: (context, index) {
          return _planetItem(planetsList.elementAt(index));
        },
      ),
    );
  }

  Widget _personItem(Person person, int index) {
    return Card(
      margin: const EdgeInsets.fromLTRB(5, 15, 5, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.3,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                      'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                      width: 150)),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(person.name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ])),
      ),
    );
  }

  Widget _planetItem(Results planet) {
    List<String> listaIds = planet.url.split('/');
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.3,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                      'https://starwars-visualguide.com/assets/img/planets/${listaIds[5]}.jpg',
                      width: 150)),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(planet.name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ])),
      ),
    );
  }
}

/* This widget is the root of your application.
@override
Widget build(BuildContext context) {
  List<Person> items = People.fromJson(jsonDecode(
          '{"count": 82, "next": "https://swapi.dev/api/people/?page=2", "previous": null, "results": [ { "name": "Luke Skywalker", "height": "172", "mass": "77", "hair_color": "blond", "skin_color": "fair", "eye_color": "blue", "birth_year": "19BBY", "gender": "male", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [ "https://swapi.dev/api/vehicles/14/", "https://swapi.dev/api/vehicles/30/" ], "starships": [ "https://swapi.dev/api/starships/12/", "https://swapi.dev/api/starships/22/" ], "created": "2014-12-09T13:50:51.644000Z", "edited": "2014-12-20T21:17:56.891000Z", "url": "https://swapi.dev/api/people/1/" }, { "name": "C-3PO", "height": "167", "mass": "75", "hair_color": "n/a", "skin_color": "gold", "eye_color": "yellow", "birth_year": "112BBY", "gender": "n/a", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/4/", "https://swapi.dev/api/films/5/", "https://swapi.dev/api/films/6/" ], "species": [ "https://swapi.dev/api/species/2/" ], "vehicles": [], "starships": [], "created": "2014-12-10T15:10:51.357000Z", "edited": "2014-12-20T21:17:50.309000Z", "url": "https://swapi.dev/api/people/2/" }, { "name": "R2-D2", "height": "96", "mass": "32", "hair_color": "n/a", "skin_color": "white, blue", "eye_color": "red", "birth_year": "33BBY", "gender": "n/a", "homeworld": "https://swapi.dev/api/planets/8/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/4/", "https://swapi.dev/api/films/5/", "https://swapi.dev/api/films/6/" ], "species": [ "https://swapi.dev/api/species/2/" ], "vehicles": [], "starships": [], "created": "2014-12-10T15:11:50.376000Z", "edited": "2014-12-20T21:17:50.311000Z", "url": "https://swapi.dev/api/people/3/" }, { "name": "Darth Vader", "height": "202", "mass": "136", "hair_color": "none", "skin_color": "white", "eye_color": "yellow", "birth_year": "41.9BBY", "gender": "male", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [], "starships": [ "https://swapi.dev/api/starships/13/" ], "created": "2014-12-10T15:18:20.704000Z", "edited": "2014-12-20T21:17:50.313000Z", "url": "https://swapi.dev/api/people/4/" }, { "name": "Leia Organa", "height": "150", "mass": "49", "hair_color": "brown", "skin_color": "light", "eye_color": "brown", "birth_year": "19BBY", "gender": "female", "homeworld": "https://swapi.dev/api/planets/2/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [ "https://swapi.dev/api/vehicles/30/" ], "starships": [], "created": "2014-12-10T15:20:09.791000Z", "edited": "2014-12-20T21:17:50.315000Z", "url": "https://swapi.dev/api/people/5/" }, { "name": "Owen Lars", "height": "178", "mass": "120", "hair_color": "brown, grey", "skin_color": "light", "eye_color": "blue", "birth_year": "52BBY", "gender": "male", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/5/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [], "starships": [], "created": "2014-12-10T15:52:14.024000Z", "edited": "2014-12-20T21:17:50.317000Z", "url": "https://swapi.dev/api/people/6/" }, { "name": "Beru Whitesun lars", "height": "165", "mass": "75", "hair_color": "brown", "skin_color": "light", "eye_color": "blue", "birth_year": "47BBY", "gender": "female", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/5/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [], "starships": [], "created": "2014-12-10T15:53:41.121000Z", "edited": "2014-12-20T21:17:50.319000Z", "url": "https://swapi.dev/api/people/7/" }, { "name": "R5-D4", "height": "97", "mass": "32", "hair_color": "n/a", "skin_color": "white, red", "eye_color": "red", "birth_year": "unknown", "gender": "n/a", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/" ], "species": [ "https://swapi.dev/api/species/2/" ], "vehicles": [], "starships": [], "created": "2014-12-10T15:57:50.959000Z", "edited": "2014-12-20T21:17:50.321000Z", "url": "https://swapi.dev/api/people/8/" }, { "name": "Biggs Darklighter", "height": "183", "mass": "84", "hair_color": "black", "skin_color": "light", "eye_color": "brown", "birth_year": "24BBY", "gender": "male", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/" ], "species": [], "vehicles": [], "starships": [ "https://swapi.dev/api/starships/12/" ], "created": "2014-12-10T15:59:50.509000Z", "edited": "2014-12-20T21:17:50.323000Z", "url": "https://swapi.dev/api/people/9/" }, { "name": "Obi-Wan Kenobi", "height": "182", "mass": "77", "hair_color": "auburn, white", "skin_color": "fair", "eye_color": "blue-gray", "birth_year": "57BBY", "gender": "male", "homeworld": "https://swapi.dev/api/planets/20/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/4/", "https://swapi.dev/api/films/5/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [ "https://swapi.dev/api/vehicles/38/" ], "starships": [ "https://swapi.dev/api/starships/48/", "https://swapi.dev/api/starships/59/", "https://swapi.dev/api/starships/64/", "https://swapi.dev/api/starships/65/", "https://swapi.dev/api/starships/74/" ], "created": "2014-12-10T16:16:29.192000Z", "edited": "2014-12-20T21:17:50.325000Z", "url": "https://swapi.dev/api/people/10/" } ] }'))
      .results;

  return MaterialApp(
      title: 'Star Wars',
      home: Scaffold(
          body: Center(
              child: Column(children: [
        SizedBox(
          width: 600,
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                      'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                                      width: 150)),
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                      items.elementAt(index).name.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ])),
                  ),
                );
              }),
        ),
        Divider(
          thickness: 2,
          color: Colors.grey[700],
          height: 50,
        ),
        SizedBox(
          width: 600,
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                      'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                                      width: 150)),
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                      items.elementAt(index).name.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ])),
                  ),
                );
              }),
        )
      ]))));
}*/
