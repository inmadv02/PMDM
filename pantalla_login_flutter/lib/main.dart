import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(244, 236, 247, 1)),
      home: const Scaffold(
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.19),
          const Text('Hello Again!',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(22, 28, 51, 1))),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: const Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text('Welcome back you have been missed!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(22, 28, 51, 1))))),
          Padding(
              padding: const EdgeInsets.fromLTRB(35, 40, 35, 15),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Enter username',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(35, 6, 35, 6),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
          Row(children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.58),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Recovery password',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.grey[700])))
          ]),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.11,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Sign In',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                ),
              )),
          const SizedBox(height: 40),
          Row(children: const <Widget>[
            Expanded(
                child: Divider(
              thickness: 2,
              color: Colors.grey,
              indent: 100,
              endIndent: 6,
            )),
            Text(" Or continue with "),
            Expanded(
                child: Divider(
              thickness: 2,
              color: Colors.grey,
              indent: 6,
              endIndent: 100,
            )),
          ]),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SignInButton(
                    Buttons.GitHub,
                    mini: true,
                    onPressed: () {},
                  ),
                  SignInButton(
                    Buttons.Twitter,
                    mini: true,
                    onPressed: () {},
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    mini: true,
                    onPressed: () {},
                  ),
                ],
              )),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'Not a member?',
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: ' Register now',
                    style: TextStyle(color: Colors.blue, fontSize: 14)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
