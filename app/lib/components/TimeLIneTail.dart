import 'package:app/constants.dart';
import 'package:app/pages/LargeImageScreen.dart';
import 'package:app/pages/Progress.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class BuildTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPassive;
  final String date;
  final String eventTitle;
  final String description;

  const BuildTimelineTile({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.isPassive,
    required this.date,
    required this.eventTitle,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle: LineStyle(
            color: myDark,
          ),
          indicatorStyle: IndicatorStyle(
            width: 20,
            color: myDark,
            iconStyle: IconStyle(iconData: Icons.done, color: myWhite),
          ),
          endChild: Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      date,
                      style: GoogleFonts.itim(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: myDark,
                      ),
                    ),
                    Text(
                      eventTitle,
                      style: GoogleFonts.itim(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: myDark,
                      ),
                    )
                  ],
                ),
                ImageSScroller(),
                Text(
                  description,
                  style: GoogleFonts.itim(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: myDark,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageSScroller extends StatelessWidget {
  final List<String> images = [
    'assets/images/logo.png',
    'assets/images/vr1.png',
    'assets/images/vr1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LargeImageScreen(imageUrl: images[index]),
                ),
              );
            },
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
