import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/constants.dart';

class CustomAppBar extends StatelessWidget {
  final String titleText; // Add a parameter for the title text

  const CustomAppBar({Key? key, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      elevation: 0.0,
      backgroundColor: myGrey,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          titleText, // Use the passed text value
          style: GoogleFonts.itim(
            color: myWhite,
            fontSize: 25.0,
          ),
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: 30,
        ),
      ),
    );
  }
}
