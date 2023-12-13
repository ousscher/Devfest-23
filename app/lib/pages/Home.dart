import 'package:app/components/NavBar.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  int lotNumber;
  Home({Key? key, required this.lotNumber}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String userName;

  Future<void> fetchDataUser() async {
    try {
      final response = await http.get(
        Uri.parse(
          'http://10.0.2.2:4000/api/get/:${widget.lotNumber}',
        ),
      );
      if (response.statusCode == 200) {
        print(response);
      } else {
        print('Échec de la connexion');
      }
    } catch (error) {
      print('Erreur lors de la connexion: ${error.toString()}');
    }
  }

  final List<DataColumn> columns = [
    DataColumn(
        label: Text(
      'Property',
      style: GoogleFonts.itim(fontSize: 20, color: myDark),
    )),
    DataColumn(
        label: Text(
      'Details',
      style: GoogleFonts.itim(fontSize: 20, color: myDark),
    )),
  ];
  final int selectedIndex = 0;

  @override
  void initState() {
    fetchDataUser();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Future<void> _launchMapLink(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            color:
                Colors.grey, // Use myGrey if you have it defined in your code
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 40,
                            color: myDark,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'profil');
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors
                                .white, // Use myWhite if you have it defined in your code
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.person_outline,
                                color: Colors
                                    .black, // Use myDark if you have it defined in your code
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 140,
                        ),
                        Text(
                          'Hello Geust!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.itim(
                            fontSize: 38,
                            color: Colors
                                .black, // Use myDark if you have it defined in your code
                          ),
                        ),
                        Text(
                          'Welcome to your home page, where your journey begins. Explore, discover, and make yourself at home!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.itim(
                            fontSize: 20,
                            color: Colors
                                .black, // Use myDark if you have it defined in your code
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Your information',
                    style: GoogleFonts.itim(
                      color: Colors
                          .black, // Use myDark if you have it defined in your code
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DataTable(columns: columns, rows: [
                    DataRow(cells: [
                      DataCell(Text(
                        'Apartment Number',
                        style: GoogleFonts.itim(fontSize: 20, color: myDark),
                      )),
                      DataCell(Text(
                        'xxxx',
                        style: GoogleFonts.itim(fontSize: 20, color: myDark),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        'Building Number',
                        style: GoogleFonts.itim(fontSize: 20, color: myDark),
                      )),
                      DataCell(Text(
                        'xxxx',
                        style: GoogleFonts.itim(fontSize: 20, color: myDark),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        'Floor Number',
                        style: GoogleFonts.itim(fontSize: 20, color: myDark),
                      )),
                      DataCell(Text(
                        'xxxx',
                        style: GoogleFonts.itim(fontSize: 20, color: myDark),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text(
                          'Location',
                          style: GoogleFonts.itim(fontSize: 20, color: myDark),
                        ),
                      ),
                      DataCell(
                        InkWell(
                          onTap: () {
                            _launchMapLink('https://your-map-link-here.com');
                          },
                          child: Text(
                            'Link',
                            style:
                                GoogleFonts.itim(fontSize: 20, color: myDark),
                          ),
                        ),
                      ),
                    ]),
                  ]),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 217, 217, 217),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
              ),
            ],
          ),
          child: CustomBottomNavigationBar(
            selectedIndex: 0,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/');
                  break;
                case 1:
                  Navigator.pushReplacementNamed(context, '/progress');
                  break;
                case 2:
                  Navigator.pushReplacementNamed(context, '/notification');
                  break;
                case 3:
                  Navigator.pushReplacementNamed(context, '/payment');
                  break;
                case 4:
                  Navigator.pushReplacementNamed(context, '/virtual');
                  break;
                case 5:
                  Navigator.pushNamed(context, '/files');
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
