import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/features/ai/ai.dart';
import 'package:mekom_w_elykom/features/donations/donation_explanation/donation_explanation.dart';
import 'package:mekom_w_elykom/features/donations/donations_model.dart';
import 'package:mekom_w_elykom/features/issuance_order/issuance_order.dart';
import 'package:mekom_w_elykom/features/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<DonationsModel> donaList = [
  DonationsModel(
    image: 'assets/images/food.png',
    name: 'طعام',
    description:
        ' بقايا طعامك فرصةٌ ذهبيةٌ لخلق عالمٍ أكثر خضرةً يمكنك التبرع بفوائض الطعام اليومية التي تحتوي بالتأكيد على الخضروات والفواكه والأعشاب. سنتكفل بتحويلها إلى مؤسسات تقوم بتحويل البقايا إلى سماد طبيعي لدعم أشجارنا.',
  ),
  DonationsModel(
    image: 'assets/images/kartoon.png',
    name: 'كرتون ورق',
    description:
        'يمكنك التبرع بالكرتون: مثل صناديق الحليب, العصير، وصناديق الأجهزة الإلكترونية، وصناديق التغليف. ورق: الجرائد والمجلات والكتب القديمة، والأوراق المكتبية، وأكياس الورق.',
  ),
  DonationsModel(
    image: 'assets/images/clothes.png',
    name: 'ملابس',
    description:
        'كل ما هو مصنوع من القماش قابل للتبرع، حتى لو لم يكن في حالة جيدة. لا تقلق بشأن سلامة القطع، فنحن نستخدم الذكاء الاصطناعي لفرزها وإعادة تدويرها أو إرسالها للمكان المناسب. ليك بعض الأمثلة على ما يمكنك التبرع به: ملابس , أحذية,  أغطية الأسرة والمفارش, مفارش المائدة ومفارش السرير, ستائر, ألعاب أطفال مصنوعة من القماش, حقائب ',
  ),
  DonationsModel(
    image: 'assets/images/metal.png',
    name: 'معدن',
    description:
        'المعدن له حضورٌ في كلّ مكان. له إستخدامات في مختلف مجالات حياتنا اليومية. من أدوات الطبخ مثل القدور والملاعق، مرورًا بالأثاث مثل الأسرة والكراسي، وصولًا إلى الأجهزة الإلكترونية مثل الهواتف الذكية وأجهزة الكمبيوتر.',
  ),
  DonationsModel(
    image: 'assets/images/glasses.png',
    name: 'زجاج',
    description:
        'من منزله لايخلو من الزجاج!  نجده حاضرًا بشكلٍ لافتٍ في مختلف المنتجات التي نستخدمها. بدءًا من النوافذ والأبواب، مرورًا بالمرايا وأدوات المائدة، وصولًا إلى عبوات الطعام والمشروبات.',
  ),
  DonationsModel(
    image: 'assets/images/plastic.png',
    name: 'بلاستيك',
    description:
        'البلاستيك ضيفٌ دائمٌ في بيوتنا.وهو حاضرٌ في بيوتنا بشكلٍ لافتٍ من خلال مختلف المنتجات التي نستخدمها. بدءًا من أدوات التنظيف، مرورًا بالألعاب، وصولًا إلى تغليف الطعام.',
  ),
];

class Donations extends StatefulWidget {
  final bool isFromSupplier;
  // final int points ;
  const Donations({super.key, required this.isFromSupplier});

  @override
  State<Donations> createState() => _DonationsState();
}

class _DonationsState extends State<Donations> {
  int _points = 0;
  @override
  void initState() {
    super.initState();
    // Initialize SharedPreferences
    // Load points from SharedPreferences
    _loadPoints();
  }

  void _loadPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int points = prefs.getInt('points') ?? 0;
    points++;
    setState(() {
      prefs.setInt('points', points);
      _points = points;
      print('points: $_points');
    });
  }
  // SharedPreferences prefs = await SharedPreferences.getInstance();

  // // Get current points or default to 0 if it's the first run
  // int points = prefs.getInt('points') ?? 0;

  // // Increment points when the app opens
  // points++;

  // // Save the updated points
  // prefs.setInt('points', points);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
          title: Center(
            child: Text(
              'اختر نوع الفئة',
              style: AppTextstyles.textFamilyMadaniSize14Weight400,
            ),
          ),
          actions: [
            if (!widget.isFromSupplier)
              InkWell(
                onTap: () {
                  push(Settings(points: _points));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.settings),
                ),
              ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    push(const DonationExplanation());
                  },
                  child: Text(
                    'انقر هنا لمعرفة ما يمكنك التبرع به',
                    style: AppTextstyles.textFamilyMadaniSize12Weight400,
                  ),
                ),
              ),
              verticalSpace(20),
              GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: donaList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
                itemBuilder: (context, index) {
                  return buildDonationCard(donaList[index]);
                },
              ),
              verticalSpace(10),
              AppTextButton(
                borderRadius: 35,
                buttonWidth: 250.w,
                buttonText: 'أَضف منتجك',
                onPressed: () {
                  setState(() {});
                },
                textStyle: AppTextstyles.textFamilyMadaniSize14Weight400
                    .copyWith(color: Colors.white),
              ),
              verticalSpace(10),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              verticalSpace(20),
              Text(
                'تم اضافة ',
                style: AppTextstyles.textFamilyMadaniSize16Weight400,
              ),
              GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: addedList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
                itemBuilder: (context, index) {
                  return buildDonationCard(addedList[index]);
                },
              ),
              verticalSpace(10),
              OutlinedButton(
                  onPressed: () {
                    if (widget.isFromSupplier == true) {
                      push(const IssuanceOrder());
                    } else {
                      push(const ImageRecognizer());
                    }
                  },
                  child: Text(
                    'تأكيد',
                    style: AppTextstyles.textFamilyMadaniSize14Weight400,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDonationCard(DonationsModel model) {
    return InkWell(
      onTap: () {
        addToList(model);
        print(addedList);
      },
      child: Column(
        children: [
          Image.asset(model.image),
          verticalSpace(5),
          Text(
            model.name,
            style: AppTextstyles.textFamilyMadaniSize14Weight400,
          ),
        ],
      ),
    );
  }
}

List<DonationsModel> addedList = [];
void addToList(DonationsModel model) {
  addedList.removeWhere((element) => element.name == model.name);
  addedList.add(model);
}
