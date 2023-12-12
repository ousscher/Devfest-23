import 'package:app/components/ItemNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NavBar extends StatefulWidget {
  String activePath;
  NavBar({super.key , required this.activePath});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 0.07 * size.height,
      color: Color.fromARGB(255, 217, 217, 217),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ItemNavBar(path: '/', isActive:(widget.activePath == 'home'), title: 'Home', icon: Icons.home),
        ItemNavBar(path: '/', isActive: (widget.activePath == 'progress'), title: 'Progress', icon: Icons.bar_chart),
        ItemNavBar(path: '/', isActive: (widget.activePath == 'notification'), title: 'Progress', icon: Icons.notification_important_rounded),
        ItemNavBar(path: '/', isActive: (widget.activePath == 'paymeny'), title: 'Payment', icon: Icons.payments_rounded),
        ItemNavBar(path: '/', isActive: (widget.activePath == 'virtual'), title: 'Virtual', icon: Icons.video_chat_rounded),
      ]),
    );
  }
}
