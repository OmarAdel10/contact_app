import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Contact extends StatelessWidget {
  final String userName;
  final String email;
  final String phoneNumber;
  final File? image;
  final VoidCallback onDelete;

  const Contact({super.key, 
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.onDelete,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF29384D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child:
                    image == null
                        ? Container(
                          color: Color(0xFF27445D),
                          child: Image.asset(
                          'assets/images/man.png',
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                        )
                        : Image.file(
                          image!,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
              ),
              Positioned(
                left: 12,
                bottom: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF1D4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    userName,
                    style: TextStyle(
                      color: Color(0xFF29384D),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFFFF1D4),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.mail,
                      color: Color(0xFF29384D),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        email,
                        style: TextStyle(
                          color: Color(0xFF29384D),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.phone,
                      color: Color(0xFF29384D),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      phoneNumber,
                      style: TextStyle(
                        color: Color(0xFF29384D),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF4D4D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      elevation: 0,
                    ),
                    onPressed: onDelete,
                    icon: Icon(
                      CupertinoIcons.delete_solid,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
