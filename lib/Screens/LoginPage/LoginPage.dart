import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool bLogin = true;

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _LoginEmailController = TextEditingController();
  final TextEditingController _LoginEmailPasswordController =
      TextEditingController();

  final TextEditingController _RegiEmailController = TextEditingController();
  final TextEditingController _RegiEmailPasswordController =
      TextEditingController();

  bool _success;
  String _userEmail = '';

  @override
  void dispose() {
    super.dispose();
    _LoginEmailController.dispose();
    _LoginEmailPasswordController.dispose();
    _RegiEmailController.dispose();
    _RegiEmailPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),
            bLogin ? _LoginPageElement() : _RegistrationElement(),
            RaisedButton(
                child: Text("Switch"),
                onPressed: () {
                  setState(() {
                    bLogin = bLogin ? false : true;
                  });
                }),
          ],
        ),
      ),
    );
  }

  Widget _LoginPageElement() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text("LoginScreen"),
              Spacer(),
              FlatButton(
                onPressed: () async {
                  final FirebaseUser user = await _auth.currentUser();
                  if (user == null) {
                    print('No one has signed in.');
                    return;
                  } else {
                    await _signOut();

                    final String uid = user.uid;
                    print('$uid has successfully signed out.');
                  }
                },
                child: Text("Sign Out"),
              ),
            ],
          ),
          TextFormField(
            controller: _LoginEmailController,
            decoration: const InputDecoration(
              labelText: 'email',
            ),
          ),
          TextFormField(
            controller: _LoginEmailPasswordController,
            decoration: const InputDecoration(
              labelText: 'password',
            ),
          ),
          RaisedButton(
            child: Text("Login with Account"),
            onPressed: () async {
              await _SigninWithEmailandPassword();
            },
          ),
          RaisedButton(
            child: Text("Login with Google"),
            onPressed: () async {
              await _SigninWithGoogle();
            },
          ),
          RaisedButton(
            child: Text("Login with Facebook"),
            onPressed: () async {
              await _SigninWithGoogle();
            },
          ),
        ],
      ),
    );
  }

  Widget _RegistrationElement() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("RegistrationElement"),
          TextFormField(
            controller: _RegiEmailController,
            decoration: const InputDecoration(
              labelText: 'email',
            ),
          ),
          TextFormField(
            controller: _RegiEmailPasswordController,
            decoration: const InputDecoration(
              labelText: 'password',
            ),
          ),
          RaisedButton(
            child: Text("Registration"),
            onPressed: () async {
              await _registration();
            },
          ),
        ],
      ),
    );
  }

  Future _registration() async {
    try {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: _RegiEmailController.text,
        password: _RegiEmailPasswordController.text,
      ))
          .user; // Email과 Password로 계정을 생성한다!
      print(user);

      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
        });
      } else {
        _success = false;
      }
    } catch (e) {
      print("Error!");
      print(e);
    }
  }

  void _SigninWithEmailandPassword() async {
    try {
      FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: _LoginEmailController.text,
        password: _LoginEmailPasswordController.text,
      ))
          .user;

      print(user.email);
    } catch (e) {
      print("Login Error!");
      print(e);
    }
  }

  void _SigninWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;

      print("${user.uid}, ${user.email} ");
    } catch (e) {
      print(e);
    }
  }

  Future _signOut() async {
    await _auth.signOut();
  }
}
