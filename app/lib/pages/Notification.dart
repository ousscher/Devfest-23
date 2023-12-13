import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
          child: CustomAppBar(titleText: 'Notifications'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              height: 0.14*size.height,
              width: 0.8*size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 0.14*size.height,
                    width: 0.2*size.width,
                    color: Colors.amber,
                  ),
                  Container(
                    height: 0.14*size.height,
                    width: 0.5*size.width,
                    color: Colors.black,
                  )
                ],
              ),
            )
          ]),
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
            }
          },
        ),
      ),
    );
  }
}
