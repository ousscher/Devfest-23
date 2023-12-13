import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/AppBar.dart';
import '../components/NavBar.dart';

class FileSharingSystem extends StatefulWidget {
  const FileSharingSystem({super.key});

  @override
  State<FileSharingSystem> createState() => _FileSharingSystemState();
}

class _FileSharingSystemState extends State<FileSharingSystem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(titleText: 'Sharing System'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: myGrey,
          width: size.width,
          child: Column(
            children: [
              SizedBox(height: 0.05*size.height,),
              Container(
                width: 0.6*size.width,
                height: 0.2*size.height,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: myDark,
                    style: BorderStyle.solid,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Adjust as needed
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/upload.png'),
                    Text("Upload File" , 
                    style: GoogleFonts.itim(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                    ), 
                    Text("Drag and drop or browse to choose file" , 
                    style: GoogleFonts.itim(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                    ), 

                  ],
                ),
              ) , 
              SizedBox(height: 0.02*size.height,),
              Padding(padding:EdgeInsets.all(8.0) , 
              child: Text('Missing Files' , 
              style: GoogleFonts.itim(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
              ),
              ) , 
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 0.15*size.height,
                      width: 0.3*size.width,
                      decoration:BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/file.png'))
                      ), 
                      child: Center(child: Text(
                        "Carte xxx", 
                        style : GoogleFonts.itim(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                      ),),
                    ),
                    SizedBox(width: 0.05*size.width,),
                    Container(
                      height: 0.15*size.height,
                      width: 0.3*size.width,
                      decoration:BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/file.png'))
                      ), 
                      child: Center(child: Text(
                        "Carte xxx", 
                        style : GoogleFonts.itim(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                      ),),
                    ),
                    SizedBox(width: 0.05*size.width,),
                    Container(
                      height: 0.15*size.height,
                      width: 0.3*size.width,
                      decoration:BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/file.png'))
                      ), 
                      child: Center(child: Text(
                        "Carte xxx", 
                        style : GoogleFonts.itim(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                      ),),
                    ),
                    SizedBox(width: 0.05*size.width,),
                    Container(
                      height: 0.15*size.height,
                      width: 0.3*size.width,
                      decoration:BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/file.png'))
                      ), 
                      child: Center(child: Text(
                        "Carte xxx", 
                        style : GoogleFonts.itim(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: myDark,
                        ),
                      ),),
                    ),
                  ],
                ),
              ) , 
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
          }
        },
      ),
    ));
  }
}
