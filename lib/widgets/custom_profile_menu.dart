import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_and_ride/utils/colors.dart';

class CustomProfileMenu extends StatelessWidget {
  final String label;
  final String iocnData;
  final VoidCallback? onTap;
  final Widget? trailing;
  const CustomProfileMenu(
      {super.key,
      this.trailing,
      this.onTap,
      required this.iocnData,
      required this.label});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return 
    ListTile(
      minVerticalPadding: 1.0,
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      dense: true,
      onTap: onTap,
      leading: Padding(
        padding: const EdgeInsets.only(right: 0, left: 17),
        child: SvgPicture.asset(
          iocnData,
          height: 20,
          width: 20,
          color: AppColors.primaryColor,
        ),
      ),
      title: Text(
        label,
        style: theme.textTheme.bodyLarge!.copyWith(
          fontSize: 15,
          color: theme.colorScheme.secondary,
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: trailing,
      ),
    );
  }
}
