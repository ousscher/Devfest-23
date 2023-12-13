import 'package:app/components/TimeLIneTail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/components/TimeLIneTail.dart';
import 'package:app/components/AppBar.dart';
import 'package:app/constants.dart';

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
              child: CustomAppBar(titleText: 'Progress'),
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
            )));
  }
}
