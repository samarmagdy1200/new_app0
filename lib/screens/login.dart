import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/api/authentication_api.dart';
import 'package:new_app/screens/home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool loginError = false;
  AuthenticationAPI authenticationAPI = AuthenticationAPI();

  TextEditingController _usernameController;
  TextEditingController _passwordController;

  @override

  void initState(){
    super.initState();

    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    String username;
    String password;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: (isLoading) ? _drawLoading() : _drawLoginForm(),
      ),
    );
  }

  Widget _drawLoginForm() {

    if(loginError){
      return Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Login Error"),
              RaisedButton(onPressed: (){
                setState(() {
                  loginError = false;
                });
              },
              child: Text("try Again" , style: TextStyle(
                color: Colors.white
              ),),)
            ],
          ),
        ),
      );    }
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: "Username"),
            validator: (value) {
              if (value.isEmpty) {
                return "please enter your username";
              }
              return null;
            },
          ),
          SizedBox(
            height: 48,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: "Password"),
            validator: (value) {
              if (value.isEmpty) {
                return "please enter your password";
              }
              return null;
            },
          ),
          SizedBox(
            height: 48,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    isLoading = true;
                  });

                   String username = _usernameController.text;
                  String password = _passwordController.text;

                  var response = await authenticationAPI.login(
                      username, password);
                  if (response) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  } else {
                    loginError = true;
                  }
                  setState(() {
                    isLoading = false;
                  });
                } else {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _drawLoading() {

      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );

  }
}
