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
          scaffoldBackgroundColor: const Color.fromRGBO(228, 51, 20, 1)),
      home: const LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 60),
          Image.asset('assets/path_logo.png', width: 190),
          const Text('Beautiful, Private Sharing',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
          const SizedBox(height: 150),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 220,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Text('Sign In',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold)),
                  )),
              const SizedBox(height: 30),
              const SizedBox(
                height: 24,
                child: Text('Already have a Path account?',
                    style:
                        TextStyle(color: Color.fromRGBO(238, 238, 238, 0.5))),
              ),
              SizedBox(
                  width: 220,
                  height: 50,
                  child: OutlinedButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            side: BorderSide(
                                color: Color.fromRGBO(212, 212, 212, 0.8),
                                width: 1.0), // HERE
                          ),
                          side: const BorderSide(
                              color: Color.fromRGBO(212, 212, 212, 0.8),
                              width: 1.0)),
                      child: const Text('Log In',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(212, 212, 212, 0.5))))),
              const SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'By using Path, you agree to Path´s ',
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Terms Of Use',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14)),
                    TextSpan(text: ' and '),
                    TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14)),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
