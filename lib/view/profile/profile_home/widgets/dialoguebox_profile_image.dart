// import 'package:aimshala/controllers/profile_controller/profile_home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileDialogueBox extends StatelessWidget {
//   final String uId;
//   final ProfileHomeController controller;
//   const ProfileDialogueBox(
//       {super.key, required this.controller, required this.uId});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Select Image Source'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ListTile(
//             leading: const Icon(Icons.camera),
//             title: const Text('Camera'),
//             onTap: () async {
//               Navigator.pop(context);
//               await controller.selectProfilePic(
//                   source: ImageSource.camera, uId: uId);
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.photo_album),
//             title: const Text('Gallery'),
//             onTap: () async {
//               Navigator.pop(context);
//               await controller.selectProfilePic(
//                   source: ImageSource.gallery, uId: uId);
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.close),
//             title: const Text('Remove Profile Photo'),
//             onTap: () async {
//               Navigator.pop(context);
//               controller.selectedImage.value = '';
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
