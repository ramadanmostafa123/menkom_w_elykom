import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';

class CurrentOrders extends StatelessWidget {
  const CurrentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
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
                  'رقم المنتج : ',
                  style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '#25648',
                  style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/dateicon.svg'),
                      horisontalSpace(10),
                      Text(
                        '11/11/2022',
                        style: AppTextstyles.textFamilyMadaniSize14Weight400
                            .copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/clock.svg'),
                      horisontalSpace(10),
                      Text(
                        '3:00 م',
                        style: AppTextstyles.textFamilyMadaniSize14Weight400
                            .copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
            child: Row(
              children: [
                const Icon(
                  Icons.scale_outlined,
                ),
                horisontalSpace(10),
                Text(
                  ' وزن المنتج التقريبى : 30kg',
                  style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
            child: Row(
              children: [
                const Icon(Icons.attach_money),
                Text(
                  'السعر : 200 ريال',
                  style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        
        ],
      ),
    );
  }
}
