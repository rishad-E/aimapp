import 'package:flutter/widgets.dart';

// TextStyle addmoreText() {
//   return ConstantTween
// }

Widget addmoreText() {
  return const Text(" Add more...",
      style: TextStyle(color: Color.fromARGB(255, 116, 118, 119)),
      overflow: TextOverflow.ellipsis);
}
