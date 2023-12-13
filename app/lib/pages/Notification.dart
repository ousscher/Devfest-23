import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/AppBar.dart';
import '../components/NavBar.dart';

class Notification {
  String details;
  String type;
  String date;
  bool read;
  Notification(this.details, this.type, this.date, this.read);
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Notification> notifications = [
    Notification(
        'Dear Slimene, a frindly reminder: Your payment is due in 72 hours.',
        "payment",
        "05-06-2003",
        false),
    Notification(
        'Dear Slimene,Building Update: New pictures available. Check them out!',
        "progress",
        "05-06-2003",
        true),
    Notification(
        'Document Request: Kindly provide the required xxxx at your earliest convenience.',
        "document",
        "05-06-2003",
        true),
    Notification(
        'Document Request: Kindly provide thae required xxxx at your earliest convenience.',
        "document",
        "05-06-2003",
        true),
    Notification(
        'Document Request: Kindly provide the required xxxx at your earliest convenience.',
        "document",
        "05-06-2003",
        true),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppBar(
            titleText: 'Notifications',
            context: context,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: myGrey,
                    ),
                    width: size.width * 0.9,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.payment,
                              color: Color.fromRGBO(0, 128, 0, 1),
                              size: 50,
                            ),
                            Text(
                              '05-06-2003',
                              style: GoogleFonts.itim(
                                color: myDark,
                                fontSize: 10.0,
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Dear Slimene, a frindly reminder: \n Your payment is due in 72 hours.',
                          style: GoogleFonts.itim(
                            color: myDark,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: myGrey,
                    ),
                    width: size.width * 0.9,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.file_copy,
                              color: myDark,
                              size: 50,
                            ),
                            Text(
                              '05-06-2003',
                              style: GoogleFonts.itim(
                                color: myDark,
                                fontSize: 10.0,
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Dear Slimene, a frindly reminder: \n Your payment is due in 72 hours.',
                          style: GoogleFonts.itim(
                            color: myDark,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: myGrey,
                    ),
                    width: size.width * 0.9,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.ads_click_sharp,
                              color: Color.fromRGBO(0, 146, 244, 1),
                              size: 50,
                            ),
                            Text(
                              '05-06-2003',
                              style: GoogleFonts.itim(
                                color: myDark,
                                fontSize: 10.0,
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Dear Slimene, a frindly reminder: \n Your payment is due in 72 hours.',
                          style: GoogleFonts.itim(
                            color: myDark,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: 2,
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
              case 5:
                Navigator.pushNamed(context, '/files');
                break;
            }
          },
        ),
      ),
    );
  }
}
