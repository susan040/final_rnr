// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hamro_sadhan/views/single_vehicle.dart';

// import '../utils/image_paths.dart';

// class ViewAllVehicleCard extends StatelessWidget {
//   const ViewAllVehicleCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
//       child: InkWell(
//         // onTap: () => Get.to(() => const SinglePage()),
//         child: Container(
//           width: double.infinity,
//           height: 128,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(9),
//             boxShadow: [
//               BoxShadow(
//                 offset: const Offset(4, 4),
//                 blurRadius: 9,
//                 color: const Color(0xFF494949).withOpacity(0.1),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 child: Image.asset(VehiclesImages.carSample1),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Audi SUV"),
//                     const SizedBox(
//                       height: 4,
//                     ),
//                     const Text("Rs. 1500/ Day"),
//                     const SizedBox(
//                       height: 4,
//                     ),
//                     const SizedBox(
//                       height: 4,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                           size: 17,
//                         ),
//                         SizedBox(
//                           width: 13,
//                         ),
//                         Text("4.9"),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 4,
//                     ),
//                     ElevatedButton(
//                       onPressed: () => Get.to(() => const SinglePage()),
//                       child: const Text("Rent Now"),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
