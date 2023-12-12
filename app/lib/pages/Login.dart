import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              SizedBox(height: 0.05*size.height,),
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
                                hintText: 'Username',
                                prefixIcon: Icon(Icons.person),
                                filled: true, // Active le remplissage du fond
                                fillColor: myWhite,
                                hintStyle:  GoogleFonts.itim(
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
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                filled: true, // Active le remplissage du fond
                                fillColor: myWhite, 
                                hintStyle:  GoogleFonts.itim(
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
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            //la validation de la requete
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
