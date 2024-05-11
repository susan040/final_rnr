import 'package:flutter/material.dart';
import 'package:rent_and_ride/utils/colors.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
        ),
        // Align(
        //   child: Container(
        //       padding: const EdgeInsets.only(top: 20),
        //       child: SvgPicture.asset(
        //         'assets/icons/icon-mobile.svg',
        //         // color: Colors.white,
        //       )),
        // ),
      ],
    );
  }
}
