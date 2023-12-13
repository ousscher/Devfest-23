import 'dart:io';

import 'package:app/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('authToken', token);
}

class _LoginState extends State<Login> {
  Future<void> loginUser(String email, String password) async {
    try {
      
      final response = await http.post(
        Uri.parse('http://10.0.2.2:4000/api/user/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String token = responseData['token'];

        // Save the token to SharedPreferences
        saveToken(token);
        print(responseData);

        // Set the token in the Authorization header for subsequent requests
        final Map<String, String> authHeaders = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };
        final getDataResponse = await http.get(
        Uri.parse('http://10.0.2.2:4000/api/user/login'),
        headers: authHeaders,
      );
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    lotNumber: responseData['lotNumber'],
                  )),
        );
      } else {
        print('Échec de la connexion');
      }
    } catch (error) {
      print('Erreur lors de la connexion: ${error.toString()}');
    }
  }

  List<String> doctorMails = [];
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String passwd = '';
  String error = '';
  bool loading = false;
  String? validateEmail(String value) {
    value = value.trim();
    if (value != null &&
        !RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')
            .hasMatch(value)) {
      return 'Adresse e-mail invalide';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Veuillez entrer votre mot de passe';
    }
    // Autres conditions de validation si nécessaire
    return null; // Retourne null si la validation réussit
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
            color: myGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 0.05 * size.height,
              ),
              Container(
                height: 0.20 * size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"))),
              ),
              Container(
                height: 0.20 * size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(image: AssetImage('assets/images/title.png')),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        'Welcome home buyers! Find your dream home effortlessly with our real estate app. Your perfect home is just a click away!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.itim(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          size.width * 0.05,
                          0,
                          size.width * 0.05,
                          0,
                        ),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'E-mail',
                                prefixIcon: Icon(Icons.person),
                                filled: true, // Active le remplissage du fond
                                fillColor: myWhite,
                                hintStyle: GoogleFonts.itim(
                                  color: myGrey,
                                  fontSize: 20.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.04),
                                  borderSide: BorderSide(
                                    color: myWhite,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.04),
                                  borderSide: BorderSide(
                                    color: myWhite,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.04),
                                  borderSide: BorderSide(
                                    color: myWhite,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                                email = email.trim();
                              },
                              validator: (value) {
                                return validateEmail(value!);
                              },
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              obscureText: true,
                              style: TextStyle(color: myGrey),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                filled: true, // Active le remplissage du fond
                                fillColor: myWhite,
                                hintStyle: GoogleFonts.itim(
                                  color: myGrey,
                                  fontSize: 20.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.04),
                                  borderSide: BorderSide(
                                    color: myWhite,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.04),
                                  borderSide: BorderSide(
                                    color: myWhite,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.04),
                                  borderSide: BorderSide(
                                    color: myWhite,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  passwd = value;
                                });
                              },
                              validator: (value) {
                                return validatePassword(value!);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          size.height * 0.4,
                          0,
                          0,
                          0,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Container(
                        width: size.width * 0.5,
                        height: size.height * 0.06,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                return myOrange;
                              },
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              loginUser(email, passwd);
                            }
                          },
                          child: Text(
                            'SIGN IN',
                            style: GoogleFonts.itim(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: myWhite,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.015),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}