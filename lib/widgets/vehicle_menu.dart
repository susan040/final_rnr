import 'package:flutter/material.dart';

import '../utils/colors.dart';

class VehicleMenuCard extends StatelessWidget {
  const VehicleMenuCard({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 19,
      ),
      child: 
      InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              height: 73,
              width: 73,
              decoration: BoxDecoration(
                // color: Colors.orange,
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey),
                // borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 21),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
