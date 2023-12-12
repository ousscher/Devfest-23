import 'package:app/components/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Profile.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0, screenSize.height * 0.06, screenSize.width * 0.7, 0),
              child: FloatingActionButton(
                onPressed: () {
                  //added the pop funciton
                }, // Menu button
                child: Icon(
                  Icons.arrow_back,
                  color: myGrey,
                ),
                backgroundColor: Theme.of(context).shadowColor,
              ),
            ),
            Text(
              'Profile',
              style: GoogleFonts.itim(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: myWhite,
              ),
            ),
            SizedBox(
              height: 0.02 * screenSize.height,
            ),
            InkWell(
              onTap: () async {},
              child: Container(
                  width: screenSize.width * 0.26,
                  height: screenSize.width * 0.26,
                  child: Image(image: AssetImage("assets/images/account.png"))),
            ),
            SizedBox(
              height: screenSize.height * 0.005,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(screenSize.width * 0.15,
                  screenSize.width * 0.1, screenSize.width * 0.15, 0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: screenSize.height * 0.005,
                  ),
                ],
              ),
            ),
            Container(
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.8,
              child: Column(
                children: [
                  //titile
                  Container(
                    width: screenSize.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Username",
                        style: GoogleFonts.itim(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width * 0.8,
                    height: screenSize.height * 0.05,
                    decoration: BoxDecoration(
                      color: myWhite,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Oussama',
                        style: GoogleFonts.itim(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.8,
              child: Column(
                children: [
                  //titile
                  Container(
                    width: screenSize.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "email",
                        style: GoogleFonts.itim(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width * 0.8,
                    height: screenSize.height * 0.05,
                    decoration: BoxDecoration(
                      color: myWhite,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Oussama',
                        style: GoogleFonts.itim(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.8,
              child: Column(
                children: [
                  //titile
                  Container(
                    width: screenSize.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Phone",
                        style: GoogleFonts.itim(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width * 0.8,
                    height: screenSize.height * 0.05,
                    decoration: BoxDecoration(
                      color: myWhite,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        '0555555555',
                        style: GoogleFonts.itim(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.8,
              child: Column(
                children: [
                  //titile
                  Container(
                    width: screenSize.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Lot number",
                        style: GoogleFonts.itim(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width * 0.8,
                    height: screenSize.height * 0.05,
                    decoration: BoxDecoration(
                      color: myWhite,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        '0xxxxx',
                        style: GoogleFonts.itim(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.8,
              child: Column(
                children: [
                  //titile
                  Container(
                    width: screenSize.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Username",
                        style: GoogleFonts.itim(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width * 0.8,
                    height: screenSize.height * 0.05,
                    decoration: BoxDecoration(
                      color: myWhite,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Oussama',
                        style: GoogleFonts.itim(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
