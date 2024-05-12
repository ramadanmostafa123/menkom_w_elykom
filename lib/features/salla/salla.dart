import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/features/hello_from_palstic_world/hello_model.dart';
import 'package:mekom_w_elykom/features/payment/payment.dart';
import 'package:mekom_w_elykom/features/salla/salla_provider.dart';
import 'package:provider/provider.dart';

class Salla extends StatelessWidget {
  const Salla({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SallaProvider>(builder: (context, salla, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                verticalSpace(10),
                Center(
                  child: Text(
                    'السلة',
                    style:
                        AppTextstyles.textFamilyInterSize18Weight600BlackColor,
                  ),
                ),
                verticalSpace(30),
                ListView.builder(
                  itemCount: salla.sallaList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BuildSallaListItem(
                      model: salla.sallaList[index],
                    );
                  },
                ),
                verticalSpace(50),
                AppTextButton(
                  buttonWidth: 200.w,
                  backgroundColor: AppColors.mainColor,
                  buttonText: 'الدفع',
                  textStyle:
                      AppTextstyles.textFamilyMadaniSize14Weight400WhiteColor,
                  onPressed: () {
                    push(const Payment());
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class BuildSallaListItem extends StatelessWidget {
  final HelloModel model;
  const BuildSallaListItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          color: AppColors.greyLight,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '  رقم المنتج : ${model.id!}#',
                  style: AppTextstyles.textFamilyMadaniSize14Weight400,
                ),
                verticalSpace(5),
                Text(
                  'نوع المنتج : ${model.name!}',
                  style: AppTextstyles.textFamilyMadaniSize14Weight400,
                ),
                verticalSpace(5),
                Text(
                  'وزن المنتج التقريبى : ${model.weight!} كيلوغرام',
                  style: AppTextstyles.textFamilyMadaniSize14Weight400,
                ),
                verticalSpace(5),
                Text(
                  'السعر : ${model.price!} ريال',
                  style: AppTextstyles.textFamilyMadaniSize14Weight400,
                ),
              ],
            ),
            const Spacer(),
            Image.asset('assets/images/recycle 1.png'),
          ],
        ),
      ),
    );
  }
}
