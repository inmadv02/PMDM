import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moviedb_home_screen/models/movies_response.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late Future<List<Movie>> items;

  @override
  void initState() {
    items = fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        child: FutureBuilder<List<Movie>>(
          future: items,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _movieList(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=1c0ce60ed8e0cd9f90ffb9b539b4c646&language=en-US&page=1'));
    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load the most popular movies');
    }
  }

  Widget _movieList(List<Movie> movieList) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return _movieItem(movieList.elementAt(index), index);
        },
      ),
    );
  }

  Widget _movieItem(Movie movie, int index) {
    return Card(
      margin: const EdgeInsets.fromLTRB(5, 15, 5, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () =>
            Navigator.pushNamed(context, '/film-details', arguments: movie),
        child: SizedBox(
            width: 200,
            height: 200,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.network(
                  'https://image.tmdb.org/t/p/w500/' + movie.posterPath,
                  width: MediaQuery.of(context).size.width * 0.4),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(movie.title.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ])),
      ),
    );
  }
}
