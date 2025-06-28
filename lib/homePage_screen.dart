import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  static const String routeName = '/home';
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.sizeOf(context).width *0.5,
        leading: Image.asset('assets/images/appBar_image.png'),
        backgroundColor: Color(0xFF29384D),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF29384D),
        ),
      ),
    );
  }
}