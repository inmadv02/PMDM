import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

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
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Stack(
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/photo.png"),
                    fit: BoxFit.cover,
                    opacity: 0.9),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0, right: 20.0),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.4,
              alignment: Alignment.topRight,
              child: const Text('Skip',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.grey)),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      Image.asset('assets/logo.png', width: 300),
                      const Text('Sign in to get the most of Red Bull',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 10),
                      const Text(
                          'Create an account to save favorites and download videos to watch anytime you want',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 50),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 220,
                            height: 50,
                            child: SignInButton(
                              Buttons.Google,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                              width: 220,
                              height: 50,
                              child: SignInButton(Buttons.FacebookNew,
                                  onPressed: () {})),
                          const SizedBox(height: 30),
                          const Text('Continue with email',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey)),
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
