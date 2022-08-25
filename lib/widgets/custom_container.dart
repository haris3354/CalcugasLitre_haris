// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomContainer extends StatelessWidget {
//   final VoidCallback onclick;
//   final Color containerColor;
//   final double containerHeight;
//   final String text;

//   const CustomContainer({
//     super.key,
//     required this.onclick,
//     required this.containerColor,
//     required this.containerHeight,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onclick,
//         child: Container(
//           decoration: BoxDecoration(
//             color: containerColor,
//             borderRadius: BorderRadius.circular(7),
//           ),
//           height: containerHeight,
//           child: Center(
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 30.sp,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
