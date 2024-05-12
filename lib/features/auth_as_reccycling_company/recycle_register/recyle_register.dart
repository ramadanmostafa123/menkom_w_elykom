import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/auth_as_reccycling_company/widgets/register_form.dart';
import 'package:mekom_w_elykom/features/auth_as_supplier_company.dart/widgets/register_form.dart';

class RegisterAsRecyclingCompany extends StatelessWidget {
  const RegisterAsRecyclingCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  " انشاء حساب كشركة اعادة تدوير ...",
                  style: AppTextstyles
                      .textFamilyMadaniSize28Weight900WhiteColorGreen,
                ),
              ),
              verticalSpace(50),
              const RegisterFormAsRecyclingCompany(),
            ],
          ),
        ),
      ),
    );
  }
}
