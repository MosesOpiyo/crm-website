// ignore_for_file: unnecessary_null_comparison

import 'package:crm/Authentication/login_texts.dart';
import 'package:crm/Pages/Sales/sales.dart';
import 'package:crm/Service/Auth/auth_service.dart';
import 'package:crm/Service/User/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static const String route = '';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  String username = '';
  String password = '';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    getStringValuesSF();
    super.initState();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getString('token');
    if (stringValue != null) {
      Userservice().getProfile().then((response) => {
            if (response != null) {Navigator.of(context).pushNamed(Sales.route)}
          });
    }
  }

  login() {
    String username = usernameController.text;
    String password = passwordController.text;
    isAPIcallProcess = true;
    if (username != '' && password != '') {
      AuthService().login(username, password).then((response) async => {
            if (response.token != "")
              {
                setToken(response.token),
                Navigator.of(context).pushNamed(Sales.route)
              }
          });
    }
  }

  void toggle() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  setToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
          width: size.width,
          height: size.height,
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 55, left: 200),
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          Text(
                            loginClass.logo,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 50)),
                          Text(
                            loginClass.welcome,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 50)),
                          Container(
                            padding: const EdgeInsets.only(left: 2, bottom: 5),
                            width: 330,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Email",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 330,
                            child: TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  labelText: 'Email'),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.only(left: 2, bottom: 5),
                            width: 330,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Password",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 330,
                            child: TextFormField(
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: toggle,
                                    icon: Icon(hidePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  labelText: 'Password'),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 215),
                              child: TextButton(
                                child: const Text("Forgot Password"),
                                onPressed: () {},
                              )),
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsetsDirectional.only(top: 5),
                            child: SizedBox(
                              width: 330,
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: Colors.blue)))),
                                onPressed: () {
                                  getStringValuesSF();
                                },
                                child: const Text('Login'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              SizedBox(
                  width: size.width * .5,
                  height: size.height,
                  child: Image.asset(
                    "login.png",
                    fit: BoxFit.cover,
                  ))
            ],
          )),
    );
  }
}
