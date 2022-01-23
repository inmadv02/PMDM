import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rickymorty_menu/models/locations.dart';

import 'package:http/http.dart' as http;

class LocationsPage extends StatelessWidget {
  LocationsPage({Key? key}) : super(key: key);

  late Future<List<Location>> locations;

  @override
  void initState() {
    locations = fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        child: TabBarView(children: [
          FutureBuilder<List<Location>>(
            future: locations,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _locationsList(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const Center(child: CircularProgressIndicator());
            },
          )
        ]));
  }

  Future<List<Location>> fetchLocations() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/location'));
    if (response.statusCode == 200) {
      return Locations.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load the locations');
    }
  }

  Widget _locationsList(List<Location> locationsList) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: locationsList.length,
        itemBuilder: (context, index) {
          return _locationItem(locationsList.elementAt(index), index);
        },
      ),
    );
  }

  Widget _locationItem(Location location, int index) {
    return Card(
      margin: const EdgeInsets.fromLTRB(5, 15, 5, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: SizedBox(
            width: 200,
            height: 200,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(location.name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ])),
      ),
    );
  }
}
