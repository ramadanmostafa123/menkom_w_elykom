import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/donations/donations.dart';
import 'package:mekom_w_elykom/features/donations/donations_model.dart';

class DonationExplanation extends StatelessWidget {
  const DonationExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              verticalSpace(10),
              Text(
                'الاشياء التى تستطيع التبرع بها كثيرة',
                style: AppTextstyles.textFamilyInterSize18Weight600BlackColor,
              ),
              verticalSpace(10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: donaList.length,
                itemBuilder: (context, index) {
                  return buildDonationExplanation(donaList[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDonationExplanation(DonationsModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(model.image),
          horisontalSpace(10),
          Expanded(
            child: Text(
              model.description,
              style: AppTextstyles.textFamilyInterSize12Weight600BlackColor,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
