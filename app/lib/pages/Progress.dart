import 'package:app/components/NavBar.dart';
import 'package:app/components/TimeLIneTail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/components/TimeLIneTail.dart';
import 'package:app/constants.dart';
import 'package:app/components/AppBar.dart';

class ProgressScreen extends StatefulWidget {
  ProgressScreen({Key? key}) : super(key: key);

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: myGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(
          titleText: 'Progress',
          context: context,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            BuildTimelineTile(
              isFirst: true,
              isLast: false,
              isPassive: true,
              date: '05-06-2003',
              eventTitle: 'Electricity',
              description:
                  'Dear Slimene, Building Update: New pictures available. Check them out!',
            ),
            BuildTimelineTile(
              isFirst: false,
              isLast: false,
              isPassive: true,
              date: '05-06-2003',
              eventTitle: 'Electricity',
              description:
                  'Dear Slimene, Building Update: New pictures available. Check them out!',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 1,
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
    ));
  }
}
