import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/AppBar.dart';
import '../components/NavBar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppBar(titleText: 'Notifications'),
        ),
        body: SingleChildScrollView(

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