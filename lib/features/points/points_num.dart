import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/points/widgets/companies.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PointsNum extends StatefulWidget {
  final int points;
  const PointsNum({super.key, required this.points});

  @override
  State<PointsNum> createState() => _PointsNumState();
}

class _PointsNumState extends State<PointsNum> {
  late int points;

  @override
  void initState() {
    super.initState();
    points = widget.points;
  }

  void increasePoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      points++;
      prefs.setInt('points', points);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 293.h,
              width: 343.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(ImageApp.backgroundGif),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/points.svg',
                            width: 32.w,
                          ),
                          horisontalSpace(8),
                          Text(
                            'نقاطى',
                            style:
                                AppTextstyles.textFamilyMadaniSize14Weight400,
                          ),
                        ],
                      ),
                      Text(
                        widget.points.toString(),
                        style: AppTextstyles.textFamilyMadaniSize16Weight400
                            .copyWith(
                          fontSize: 60.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'كود الخصم : 1204545',
              style: AppTextstyles.textFamilyMadaniSize14Weight400,
            ),
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.10, 0.2],
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: CompaniesLogo(),),
          ],
        ),
      ),
    );
  }
}
