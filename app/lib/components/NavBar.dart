// import 'package:app/components/ItemNavbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class NavBar extends StatefulWidget {
//   String activePath;
//   NavBar({super.key , required this.activePath});

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       height: 0.07 * size.height,
//       color: Color.fromARGB(255, 217, 217, 217),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//         ItemNavBar(path: '/', isActive:(widget.activePath == 'home'), title: 'Home', icon: Icons.home),
//         ItemNavBar(path: '/', isActive: (widget.activePath == 'progress'), title: 'Progress', icon: Icons.bar_chart),
//         ItemNavBar(path: '/', isActive: (widget.activePath == 'notification'), title: 'Progress', icon: Icons.notification_important_rounded),
//         ItemNavBar(path: '/', isActive: (widget.activePath == 'paymeny'), title: 'Payment', icon: Icons.payments_rounded),
//         ItemNavBar(path: '/', isActive: (widget.activePath == 'virtual'), title: 'Virtual', icon: Icons.video_chat_rounded),
//       ]),
//     );
//   }
// }

import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: myOrange,
        unselectedItemColor: myGrey,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_rounded),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments_rounded),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_chat_rounded),
            label: 'Virtual',
          ),
        ],
      ),
    );
  }
}
