import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemNavBar extends StatefulWidget {
  String title;
  String path;
  bool isActive;
  IconData icon;
  ItemNavBar(
      {super.key,
      required this.path,
      required this.isActive,
      required this.title , required this.icon});

  @override
  State<ItemNavBar> createState() => _ItemNavBarState();
}

class _ItemNavBarState extends State<ItemNavBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, widget.path);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: widget.isActive ? myOrange : myGrey,
          ),
          Text(
            widget.title,
            style: GoogleFonts.itim(
              color: widget.isActive ? myOrange : myGrey,
            ),
          ),
        ],
      ),
    );
  }
}
