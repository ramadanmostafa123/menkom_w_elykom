import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';

class Amount extends StatelessWidget {
  const Amount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: AppColors.greyLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
            child: Row(
              children: [
                Text(
                  'المبلغ : ',
                  style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              'المبلغ : 200 ريال',
              style: AppTextstyles.textFamilyMadaniSize14Weight400,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
            child: Text(
              'التوصيل : 30 ريال',
              style: AppTextstyles.textFamilyMadaniSize14Weight400,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
            child: Text(
              'المجموع : 230 ريال',
              style: AppTextstyles.textFamilyMadaniSize14Weight400,
            ),
          ),
          verticalSpace(10),
        ],
      ),
    );
  }
}
