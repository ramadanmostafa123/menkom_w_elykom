import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/ai/ai_provider.dart';
import 'package:provider/provider.dart';

class ProductWeight extends StatelessWidget {
  const ProductWeight({super.key});

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Consumer<AiProvider>(builder: (context, ai, child) {
      return Column(
        children: [
          Text(
            'حدد وزن المنتجات بشكل تقريبى',
            style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
              color: AppColors.secondColor,
            ),
          ),
          verticalSpace(30),
          SizedBox(
            width: 100.w,
            height: 50.h,
            child: Form(
              key: ai.formKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'اكتب الوزن هنا!!';
                  }
                },
                controller: ai.controller,
                style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'كجم - Kg',
                  hintStyle:
                      AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          verticalSpace(10),
        ],
      );
    });
  }
}
