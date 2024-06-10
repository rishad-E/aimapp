import 'dart:io';

class AddMediaModel {
  AddMediaModel({
    this.file,
    this.url,
    required this.title,
    required this.description,
    this.mediaLink,
  });
  String? mediaLink;
  File? file;
  String? url;
  String title;
  String description;
}
