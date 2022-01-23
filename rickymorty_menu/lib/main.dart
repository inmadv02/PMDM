import 'package:flutter/material.dart';
import 'package:rickymorty_menu/pages/episodes_page.dart';

import 'pages/characters_page.dart';
import 'pages/home.dart';
import 'pages/locations_page.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/characters': (context) => const CharactersPage(),
        '/locations': (context) => LocationsPage(),
        '/episodes': (context) => EpisodesPage(),
      },
    );
  }
}
