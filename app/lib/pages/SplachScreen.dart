import 'package:app/pages/Login.dart';
import 'package:app/utils/asset.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Navigator.pushNamed(context, '/login'));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    final _curvedAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInExpo,
      reverseCurve: Curves.easeInQuad, //easinOut
    );
    _animationController!.forward();
    _animation = Tween<double>(begin: 0.7, end: 0.8).animate(_curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController!.forward();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.4, 1],
            colors: [
              myGrey,
              myDark,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform.scale(
                scale: _animation!.value,
                child: Image(image: AssetImage("assets/images/logo.png"))),
            Text(
              "Track your home",
              style: GoogleFonts.itim(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: myWhite,
                              letterSpacing: 2.0,
                            ),
            ),
          ],
        ),
      ),
    );
  }
}
