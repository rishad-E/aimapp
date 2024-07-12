import 'dart:convert';
import 'dart:developer';
import 'package:aimshala/models/profile_model/add_media_model.dart';

List<AddMediaModel> profileEducationMediaFunctions(dynamic data) {
  if (data == null || data.media == null) {
    return [];
  }

  return parseMediaItemsEducation(data);
}

List<AddMediaModel> parseMediaItemsEducation(dynamic data) {
  List<String> mediaList = [];
  if (data.media != null && data.media!.isNotEmpty) {
    try {
      mediaList = List<String>.from(jsonDecode(data.media!));
    } catch (e) {
      log('Error decoding media: $e');
    }
  }

  List<String> mediaTitles = data.mediaTitle?.split(',') ?? [];
  List<String> mediaDescriptions = data.mediaDescription?.split(',') ?? [];
  List<AddMediaModel> mediaItems = [];

  for (int i = 0; i < mediaList.length; i++) {
    String filename = mediaList[i];
    String title =
        i < mediaTitles.length ? mediaTitles[i] : "Title for $filename";
    String description = i < mediaDescriptions.length
        ? mediaDescriptions[i]
        : "Description for $filename";
    if (!mediaItems.any((i) => i.title == title)) {
      mediaItems.add(
          AddMediaModel(title: title, description: description, url: filename));
    }
  }
  return mediaItems;
}
