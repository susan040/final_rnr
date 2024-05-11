// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hamro_sadhan/utils/colors.dart';
// import 'package:hamro_sadhan/views/single_vehicle.dart';

// class RecentVehicleCard extends StatelessWidget {
//   const RecentVehicleCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
//     InkWell(
//       onTap: () {
//         Get.to(() =>  SinglePage());
//       },
//       child: Container(
//         height: 95,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(9),
//           boxShadow: [
//             BoxShadow(
//               offset: const Offset(4, 4),
//               blurRadius: 9,
//               color: const Color(0xFF494949).withOpacity(0.1),
//             ),
//           ],
//         ),
//         child: Column(
//           // mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(9)),
//                 width: double.infinity,
//                 // color: Colors.amber,
//                 height: 100,
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10)),
//                   child: Image.network(
//                     "https://dalamancarrentals.com/arayuz/assets/img/car-rent-news/h_3_730x485.png?.1638283284",
//                     fit: BoxFit.fill,
//                   ),
//                 )
//                 // Image.asset(
//                 //   VehiclesImages.carSample1,
//                 //   fit: BoxFit.fill,
//                 // ),
//                 ),
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 6),
//               child: Column(
//                 children: [
//                   const Text(
//                     "Honda Dio s jhhajksjhd hjadj asd",
//                     overflow: TextOverflow.ellipsis,
//                     softWrap: false,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Row(
//                     children: const [
//                       Icon(Icons.money_rounded),
//                       Text(
//                         "2500/day",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
