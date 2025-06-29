import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class HomePageScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomePageScreen({super.key});
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  File? _image;

  String userName = 'User Name';
  String email = 'example@email.com';
  String phoneNumber = '+200000000000';

  final _picker = ImagePicker();
  void pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _image = File(pickedImage.path);
      setState(() {});
    }
  }

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
                  'assets/lottie/List_Animation.json',
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
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Color(0xFF29384D),
      context: context,
      builder:
          (_) => StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF29384D),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  pickImage();
                                });
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.42,
                                height: MediaQuery.sizeOf(context).width * 0.42,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  border: Border.all(
                                    color: Color(0xFFFFF1D4),
                                    width: 1,
                                  ),
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.38,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.38,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child:
                                      _image == null
                                          ? Lottie.asset(
                                            'assets/lottie/imagePicker_Animation.json',
                                            repeat: false,
                                          )
                                          : Image.file(
                                            _image!,
                                            fit: BoxFit.cover,
                                          ),
                                ),
                              ),
                            ),

                            SizedBox(width: 8),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userName == '' ? 'User Name' : userName,
                                    style: TextStyle(
                                      color: Color(0xFFFFF1D4),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Divider(
                                    color: Color(0xFFFFF1D4),
                                    thickness: 1,
                                    height: 16,
                                  ),
                                  Text(
                                    email == '' ? 'example@email.com' : email,
                                    style: TextStyle(
                                      color: Color(0xFFFFF1D4),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.visible,
                                  ),
                                  Divider(
                                    color: Color(0xFFFFF1D4),
                                    thickness: 1,
                                    height: 16,
                                  ),
                                  Text(
                                    phoneNumber == ''
                                        ? '+200000000000'
                                        : phoneNumber,
                                    style: TextStyle(
                                      color: Color(0xFFFFF1D4),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),

                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              userName = value;
                            });
                          },
                          keyboardType: TextInputType.name,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Enter User Name',
                            hintStyle: TextStyle(
                              color: Color(0xFFE2F4F6),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                            ),
                          ),
                        ),

                        SizedBox(height: 16),

                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Enter Your Email',
                            hintStyle: TextStyle(
                              color: Color(0xFFE2F4F6),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                            ),
                          ),
                        ),

                        SizedBox(height: 16),

                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              phoneNumber = value;
                            });
                          },
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Enter Your Phone',
                            hintStyle: TextStyle(
                              color: Color(0xFFE2F4F6),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFF1D4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Enter User',
                              style: TextStyle(
                                color: Color(0xFF29384D),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }
}
