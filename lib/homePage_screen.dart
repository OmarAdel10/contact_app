import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePageScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomePageScreen({super.key});
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.sizeOf(context).width * 0.55,
        leading: Image.asset('assets/images/appBar_image.png'),
        backgroundColor: Color(0xFF29384D),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(color: Color(0xFF29384D)),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Lottie.asset(
                  'assets/lottie/Animation.json',
                  repeat: false,
                ),
              ),
              Text(
                'There is No Contacts Added Here',
                style: TextStyle(
                  color: Color(0xFFFFF1D4),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bottomSheet(context);
        },
        backgroundColor: Color(0xFFFFF1D4),
        elevation: 3,
        child: Icon(CupertinoIcons.add),
      ),
    );
  }

  void _bottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) => Container());
  }
}
