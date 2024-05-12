import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/ai/ai.dart';

class AgreementAcceptancePage extends StatelessWidget {
  const AgreementAcceptancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'الموافقة على الشروط والاحكام',
                  style: AppTextstyles.textFamilyMadaniSize14Weight400,
                ),
              ),
              Center(
                child: Image.asset(
                  ImageApp.completedLogo,
                  width: 150,
                  height: 150,
                ),
              ),
              verticalSpace(50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  '1- عند قبولك لعقدنا هذا يعنى أنك ستلنزم بتزويدنا بالمواد فى الفترات المتفق عليها ',
                  style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              verticalSpace(50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  '2- التكلفة مبنيه على متوسط الوزن\n (ثابت)',
                  style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              verticalSpace(50),
              Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    push(const ImageRecognizer());
                  },
                  child: Text(
                    'قبول',
                    style:
                        AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
