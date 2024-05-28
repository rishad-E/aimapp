import 'dart:io';

class AddMediaModel {
  AddMediaModel({
    required this.file,
    required this.title,
    required this.description,
    this.mediaLink,
  });
  String? mediaLink;
  File? file;
  String title;
  String description;
}
