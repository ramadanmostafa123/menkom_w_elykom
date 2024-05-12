import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';


class NavItem extends StatelessWidget {
  const NavItem({Key? key, required this.icon, required this.title, required this.isSelected, this.onTap}) : super(key: key);
  final String icon;
  final String title;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: isSelected
            ? Column(
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      icon,
                      // ignore: deprecated_member_use
                      color: isSelected ? AppColors.secondColor : null,
                    ),
                  ),
                  Text(
                    title,
                    style: AppTextstyles
                    .textFamilyMadaniSize12Weight400,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  // Expanded(child: SvgPicture.asset('assets/images/arrow_down.svg'),
                  // ),
                  SizedBox(height: 5.h),
                ],
              )
            : Column(
                children: [
                  Expanded(child: SvgPicture.asset(icon)),
                  Text(
                    title,
                    style: AppTextstyles.textFamilyMadaniSize12Weight400,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
      ),
    );
  }
}
