import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/auth_as_person/widgets/register_form.dart';

class RegisterAsPerson extends StatelessWidget {
  const RegisterAsPerson({super.key});

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
                  " انشاء حساب كفرد ...",
                  style: AppTextstyles
                      .textFamilyMadaniSize28Weight900WhiteColorGreen,
                ),
              ),
              verticalSpace(50),
              const RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }

}
