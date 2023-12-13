import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/constants.dart';

class CustomAppBar extends StatelessWidget {
  final String titleText;
  final BuildContext context; // Add a parameter for the BuildContext

  const CustomAppBar({
    Key? key,
    required this.titleText,
    required this.context, // Pass the BuildContext as a parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      elevation: 0.0,
      backgroundColor: myGrey,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          titleText,
          style: GoogleFonts.itim(
            color: myWhite,
            fontSize: 25.0,
          ),
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          
          Navigator.of(context).pop(); // Use the provided context for pop
        },
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: 30,
        ),
      ),
    );
  }
}
