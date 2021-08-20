import 'package:flutter/material.dart';
import 'package:travel_diary/page/home_page.dart';
import 'package:travel_diary/repository/repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Username"),
                  onChanged: (str) {
                    setState(() {
                      username = str;
                    });
                  }),
              SizedBox(
                height: 60,
              ),
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Password"),
                  onChanged: (str) {
                    setState(() {
                      password = str;
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: ElevatedButton(
                  onPressed: _loginUser,
                  child: Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _loginUser() {
    repository.login(username, password);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Homepage()));
  }
}
