import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/features/home/home.dart';


class IntroOverboardPage extends StatefulWidget {
  const IntroOverboardPage({super.key});


  @override
  IntroOverboardPageState createState() => IntroOverboardPageState();
}

class IntroOverboardPageState extends State<IntroOverboardPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        nextText: 'التالي',
        skipText: 'تخطي ',
        finishText: 'انهاء',
        activeBulletColor: Colors.black87,
        inactiveBulletColor: const Color.fromARGB(97, 94, 90, 90),
        buttonColor: Colors.black,
        allowScroll: true,
        pages: pages,
        showBullets: true,
        skipCallback: () {
         
          const Text("Skip clicked");
        
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ));
        },
        finishCallback: () {
       
          const Text("Finish clicked");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ));

       
        },
      ),
    );
  }

  final List<PageModel> pages = [
    PageModel.withChild(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: const Text(
              'شُرَكَائِنَا',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 40),
            ),
          ),
          const Image(image: AssetImage('assets/images/1.png')),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'شركه تدوير لإعادة التدوير',
            style: TextStyle(fontSize: 23),
          ),
          const SizedBox(
            height: 30,
          ),
          const Image(image: AssetImage('assets/images/2.png')),
          const SizedBox(
            height: 35,
          ),
          const Text(
            'فندق ساعة مكة فيرمونت\nلتزويدنا بالمواد',
            style: TextStyle(fontSize: 23 ),textAlign: TextAlign.center,
          ),
        ],
      ),
      titleColor: Colors.black,
      bodyColor: Colors.black,
      color: AppColors.backgroingIntro,
    ),
    PageModel(
      bodyColor: Colors.black,
      titleColor: Colors.black,
      color: AppColors.backgroingIntro,
      imageAssetPath: ImageApp.aboutUsImage,
      title: 'مِنْ نَحْنُ',
      body:
          '.نحن شركه تعمل كوسيط لجمع النفايات التي يمكن إعادة تدوريها, بين المجتمع والشركات المسؤولة عن إعادة التدوير  ',
      doAnimateImage: true,
    ),
    PageModel(
      bodyColor: Colors.black,
      titleColor: Colors.black,
      color: AppColors.backgroingIntro,
      imageAssetPath: ImageApp.goalsImgae,
      title: 'هَدَفُنَا',
      body:
          "  .تضمين التكنولوجيا بهذا المجال لتسهيل العملية.  وان نكون الخيار الأول للشركات والافراد في تصدير نفايتهم لنا ",
      doAnimateImage: true,
    ),
    PageModel(
        bodyColor: Colors.black,

        // doAnimateImage: true,
        titleColor: Colors.black,
        color: AppColors.backgroingIntro,
        imageAssetPath: ImageApp.impactImage,
        title: 'الاثر',
        body:
            '.تخفيف التلوث البيئي, تعزيز مفهوم الإستدامة وإعادة التدوير, وتنمية فكرة فرز النفايات من منازلنا')
  ];
}
