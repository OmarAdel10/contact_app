import 'dart:io';

class ContactModel {
  final String userName;
  final String email;
  final String phoneNumber;
  final File? image;

  ContactModel({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    this.image,
  });
}