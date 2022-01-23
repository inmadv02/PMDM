import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rickymorty_menu/models/episodes.dart';

import 'package:http/http.dart' as http;

class EpisodesPage extends StatelessWidget {
  EpisodesPage({Key? key}) : super(key: key);

  late Future<List<Episode>> episodios;

  @override
  void initState() {
    episodios = fetchEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        child: TabBarView(children: [
          FutureBuilder<List<Episode>>(
            future: episodios,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _episodeList(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const Center(child: CircularProgressIndicator());
            },
          )
        ]));
  }

  Future<List<Episode>> fetchEpisodes() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/episode'));
    if (response.statusCode == 200) {
      return Episodes.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load the episodes');
    }
  }

  Widget _episodeList(List<Episode> episodeList) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: episodeList.length,
        itemBuilder: (context, index) {
          return _episodeItem(episodeList.elementAt(index), index);
        },
      ),
    );
  }

  Widget _episodeItem(Episode episode, int index) {
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
                  child: Text(episode.name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ])),
      ),
    );
  }
}
