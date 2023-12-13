import 'package:app/components/NavBar.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          width: size.width,
          child: Column(
            children: [
              Container(
                width: size.width * 0.7,
                color: myWhite,
              )
            ],
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
            selectedIndex: 3,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/');
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
