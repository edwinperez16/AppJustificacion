// import 'package:flutter/material.dart';

// // Colors
// const blue = Color.fromARGB(255, 33, 66, 148);
// const gray = Color.fromARGB(255, 90, 98, 119);
// const black = Color.fromARGB(255, 7, 10, 27);
// const white = Color(0xFFffffff);
// const purple = Color.fromARGB(255, 69, 40, 150);
import 'package:flutter/material.dart';

// // Texts
TextStyle hedding1() {
  return const TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.bold
  );
}


TextStyle textGraySmall() {
  return const TextStyle(
    fontSize: 12.0
  );
}

// // Inputs
// InputDecoration inputWithBorder(String textLabel, {IconData? iconData}) {
//   return InputDecoration(
//     label: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if(iconData != null)
//         Icon(iconData, color: gray,),
//         if(iconData != null)
//         const SizedBox(width: 10.0,),
//         Text(textLabel, style: const TextStyle(color: gray),)
//       ],
//     ),
//     border: const OutlineInputBorder(),
//     focusColor: blue,
//     fillColor: gray,
//   );
// }

// // Bottons
// ButtonStyle btnPurple() {
//   return ElevatedButton.styleFrom(
//     backgroundColor: purple,
//     foregroundColor: white,
//     padding: const EdgeInsets.symmetric(vertical: 16.0),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(5.0)
//     ),
//   );
// }