import 'package:app/components/AppBar.dart';
import 'package:app/components/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class VirtualVisit extends StatefulWidget {
  const VirtualVisit({super.key});

  @override
  State<VirtualVisit> createState() => _VirtualVisitState();
}

class _VirtualVisitState extends State<VirtualVisit> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppBar(titleText: 'Virtual Visit'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
              color: myGrey,
            ),
            child: Column(
              children: [
                Container(
                  height: 0.93 * size.height,
                  child: Column(
                    children: [
                      // Container(
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Padding(
                      //         padding: EdgeInsets.all(8.0),
                      //         child: Icon(
                      //           Icons.arrow_back_ios_new,
                      //           color: myWhite,
                      //         ),
                      //       ),
                      //       Center(
                      // child: Text(
                      //   'Virtual visit',
                      //   style: GoogleFonts.itim(
                      //     color: myWhite,
                      //     fontSize: 20.0,
                      //   ),
                      // ),
                      //       ),
                      //       Container(
                      //         width: 0.1 * size.width,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 0.05 * size.height,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 0.23 * size.height,
                              width: 0.8 * size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  color: myWhite),
                              child: Column(
                                children: [
                                  Container(
                                    height: 0.18 * size.height,
                                    // child: Image(image: AssetImage(assetName)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(18),
                                          topRight: Radius.circular(18),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/vr1.png'),
                                            fit: BoxFit.fitWidth)),
                                  ),
                                  Container(
                                    height: 0.05 * size.height,
                                    child: Center(
                                      child: Text(
                                        'Appartement F3',
                                        style: GoogleFonts.itim(
                                          color: myDark,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 0.05 * size.height,
                            ),
                            Container(
                              height: 0.23 * size.height,
                              width: 0.8 * size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  color: myWhite),
                              child: Column(
                                children: [
                                  Container(
                                    height: 0.18 * size.height,
                                    // child: Image(image: AssetImage(assetName)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(18),
                                          topRight: Radius.circular(18),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/vr1.png'),
                                            fit: BoxFit.fitWidth)),
                                  ),
                                  Container(
                                    height: 0.05 * size.height,
                                    child: Center(
                                      child: Text(
                                        'Appartement F3',
                                        style: GoogleFonts.itim(
                                          color: myDark,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 0.05 * size.height,
                            ),
                            Container(
                              height: 0.23 * size.height,
                              width: 0.8 * size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  color: myWhite),
                              child: Column(
                                children: [
                                  Container(
                                    height: 0.18 * size.height,
                                    // child: Image(image: AssetImage(assetName)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(18),
                                          topRight: Radius.circular(18),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/vr2.png'),
                                            fit: BoxFit.fitWidth)),
                                  ),
                                  Container(
                                    height: 0.05 * size.height,
                                    child: Center(
                                      child: Text(
                                        'Appartement F3',
                                        style: GoogleFonts.itim(
                                          color: myDark,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: 4,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/');
                break;
              case 1:
                Navigator.pushNamed(context, '/progress');
                break;
              case 2:
                Navigator.pushNamed(context, '/notification');
                break;
              case 3:
                Navigator.pushNamed(context, '/payment');
                break;
              case 4:
                Navigator.pushNamed(context, '/virtual');
                break;
            }
          },
        ),
      ),
    );
  }
}
