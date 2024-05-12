import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/auth_as_supplier_company.dart/widgets/login_form.dart';

class LoginAsSupplierCompany extends StatelessWidget {
  const LoginAsSupplierCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          ' تسجيل الدخول كشركة مزودة',
          style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                ImageApp.completedLogo,
                width: 150,
                height: 150,
              ),
            ),
            verticalSpace(20),
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    ImageApp.authBackground,
                    width: 500,
                    height: 500,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                verticalSpace(100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'مرحبا بكم ',
                          textAlign: TextAlign.center,
                          style: AppTextstyles
                              .textFamilyMadaniSize18Weight100Colorblue50,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'تسجيل الدخول  ',
                          style: TextStyle(
                              fontFamily: 'Madani',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      verticalSpace(20),
                      const LoginCompanyForm(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
