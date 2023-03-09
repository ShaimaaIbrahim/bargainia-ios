import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Locator.dart';
import 'package:hexcolor/hexcolor.dart';

class VendorRegisterContractPage extends StatelessWidget {
  const VendorRegisterContractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height+300.h,
          width: MediaQuery.of(context).size.width,
          child:   Stack(
            children: [
              Container(
                color: primaryDarkColor,
                child: Padding(
                    padding: EdgeInsets.only(top: 20.h,),
                    child:  Image.asset('assets/images/logo.png', height: 200.h, width:MediaQuery.of(context).size.width)
                ),
              ),
              Positioned(
                top: 126.h,
                right: 16.w,
                left: 16.w,
                bottom: 0.h,
                child:  SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.r)),
                        color: whiteColor
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(top: 50.h, right: 15.w, left: 15.w, bottom: 20.h),
                        child: bold16Text('.هذا العقد موثق الكترونيآ بين منصة بارجينيا والتاجر ولا يحتاج الى ختم :اتفاقية توفير مساحة ومتجر للبائع ممثلة لمؤسسة صفقةbargainia تم الاتفاق بين منصة بارجينيا رابحة للتسويق الإلكتروني صاحبة الحقوق التجارية والمسجلة لدى الهيئة السعودية للملكية الفكرية برقم 1441021163 وتحمل سجل تجاري رقم 4030377607 وتاريخ .30-6-1441 هـ Sayed : ومؤسسة / شركة سجل تجاري رقم : 1321312434 هذا العقد موثق الكترونيآ بين منصة بارجينيا والتاجر ولا يحتاج .الى ختم :اتفاقية توفير مساحة ومتجر للبائع ممثلة لمؤسسة صفقة رابحة للتسويق bargainia تم الاتفاق بين منصة بارجينيا الإلكتروني صاحبة الحقوق التجارية والمسجلة لدى الهيئة السعودية للملكية الفكرية .برقم 1441021163 وتحمل سجل تجاري رقم 4030377607 وتاريخ 30-6-1441 هـ Sayed : ومؤسسة / شركة سجل تجاري رقم : 1321312434 يحمل هوية رقم : 423423432 الحساب البنكي الأيبان للمؤسسة / الشركة : 342421 على ان يتم فتح حساب وتوفير مساحة داخل المتجر يستطيع من خلالها عرض ما لديه .من منتجات على المنصة :ونلتزم نحن في بارجينيا بالاتي 1- المساعدة في طريقة فتح الحساب وعرض المنتجات ليستطيع البائع عرض ما لديه من أجهزة الكترونية بالمتجر من خلال حسابه لدينا حيث سنوفر له في بارجينيا كل ما يحتاجه من تفاصيل من حيث المبيعات والمشتريات التي تمت من خلال المتجر وكشف مفصل بقيمة مبيعاته والمبالغ المستحقة له وما تم تحويله لحسابه البنكي مع نسخه الكترونية يتم ارفاقها بعد إتمام عملية التحويل لحسابه المسجل لدينا يستطيع الاطلاع .عليها وتحميلها وطباعتها 2. نلتزم في بارجينيا بحفظ المستحقات والمبالغ المالية للبائع وتحويلها لحسابه المدون مسبقا عند في عملية التسجيل والمرفق بهذا العقد بدون تأخير بعد إتمام عملية البيع واستلام المنتج من قبل المشتري سليم ولا يوجد عليه أي ملاحظات او كسور وبنفس .المواصفات التي تم عرضها بالموقع وتم الشراء على أساسها 3. جميع العمليات المالية تتم بشكل الي ويستطيع البائع من خلال حسابه الاطلاع على المنتجات التي تم بيعها ومبالغها وما تم التحويل له والمبالغ المتبقية ويحق له .المراجعة والمطالبة ) تنص شروط الاستخدام وجميع السياسات والشروط الإضافية (في حال تطبيقها الموجودة على الموقع على الشروط التي نقدمها لك للدخول واستخدام الموقع والخدمات والتطبيقات، بما في ذلك تطبيق الهاتف الجوال الخاصة بنا (ويُشار إليها مجتمعة ").بـ"الخدمات حال وصولك و/ أو تسجيلك و/ أو استمرارك في استخدام الخدمات أو الوصول إليها، .فأنت توافق على الالتزام بشروط الاستخدام هذه والوثائق القانونية بأثر فوري ان شروط الاستخدام هذه والوثائق القانونية خاضعة للتعديل من قبلنا في اي وقت. إن استمرار استخدامك للموقع بعد نشر أي تغيير يعني موافقتك على شروط الاستخدام .هذه والوثائق القانونية التي تم تعديلها :نبذه عن الموقع يعد هذا الموقع منصة للتجارة الإلكترونية التي تتيح للمستخدمين من المؤسسات التجارية عرض وبيع المنتجات، كما يتيح للشركات والأفراد شراء مجموعة متنوعة من .المنتجات نحتفظ بحق تقديم خدمات جديدة وتحديث أي من الخدمات أو سحبها، وفقاً .لتقديرنا الخاص دون اية مسؤولية شروط التسجيل يحق لك التسجيل كمشترٍ أو بائع والاستفادة من الخدمات إذا توفرت لديك معايير :الاهلية التالية :1. للمشترين .1. أن تكون بالغاً السن القانونية لتتمكن من شراء المنتجات .2. أن تكون قادراً على تقديم عنوان في المملكة العربية السعودية لتسليم المنتجات :2. للبائعين .1. أن يكون لديك شركة تجارية مسجلة وفقاً لقوانين الدولة .2. أن يكون لديك ترخيص تجاري سارٍ 3. أن يمكنك تقديم ما يثبت تفويض الأفراد الذين يقومون بالتسجيل في الموقع أو .باستخدامه .4. تقديم إثبات الهوية للشخص المفوض .5. تقديم بيانات مصرفية داعمة .6. تقر وتوافق على أنه قد تنطبق بعض المتطلبات الإضافية لبعض الفئات من المنتجات للتسجيل على الموقع، ستحتاج إلى تقديم بعض المعلومات، ولن يتم قبول تسجيلك في الموقع إذا لم يتم تقديم المعلومات اللازمة لنا. لدينا الحق في رفض أي من عمليات التسجيل دون إبداء الأسباب. كما يحق لنا أيضاً القيام بعمليات التحقق اللازمة للتأكد .من هويتك ومتطلبات التسجيل وبمجرد الانتهاء من التسجيل بنجاح، يستمر التسجيل الخاص بك لفترة غير محددة .خاضعاً لاحتمال تعليقه أو إلغائه وفقاً للبند رقم 6 من شروط الاستخدام هذه الالتزامات الخاصة بك :عند استخدامك للخدمات أو وصولك إليها، فأنت توافق على ما يلي 1. مسؤوليتك عن الحفاظ على الخصوصية وتقييد الوصول إلى الحساب الخاص بك واستخدامه هو وكلمة المرور، والموافقة على تحمل مسؤولية جميع الأنشطة التي تتم .باسم الحساب الخاص بك وكلمة المرور الخاصة بك 2. الموافقة على إخطارنا فورا عن أي استخدام غير مصرح به لكلمة المرور أو الحساب .الخاص بك أو أي خرقٍ آخر لمعايير الاستخدام الآمن للموقع 3. تقديم المعلومات الكاملة والحقيقية والدقيقة والحالية عن نفسك وعن استخدامك .للخدمات كما هو محدد من قبلنا 4. عدم الإفصاح للغير (باستثناء ما يلزم أو ما هو محدد من قبلنا) عن معلومات .المستخدم المقدمة لك 5. التعاون مع الطلبات الصادرة عنا للحصول على معلومات إضافية فيما يتعلق .بأهليتك واستخدامك لخدماتنا :عند استخدامك للخدمات أو وصولك إليها، فأنت توافق على أنك لن تقوم بما يلي نشر أو إدراج أو تحميل أي من المحتويات أو المواد غير المناسبة أو المحظورة في موقعنا، :بما في ذلك .1. المحتوى أو المواد غير الملائمة أخلاقياً أو دينياً بأي شكلٍ من الأشكال 2. المحتوى أو المواد التي لا تتوافق مع القانون المحلي والشريعة الإسلامية والقواعد .والأخلاق والقيم والآداب والتقاليد .3. المحتوى أو المواد التي قد تُهدد الأمن القومي .4. المحتوى أو المواد التي قد تروج أو تندرج في إطار المقامرة .5. أي من الأسلحة 6. حسب علمك، المواد التي تكون معيبة أو زائفة أو تالفة أو مضللة أو قد تسبب ضررا .عند استخدامها بشكلٍ طبيعي لمصلحة مستخدم آخر للموقع أو لصحته .7. قسائم غير قابلة للتحويل .8. المواد الكيميائية .9. نشر المواد المزيفة أو المسروقة 10. خرق القانون أو التحايل عليه، أو خرق أي من حقوق الغير أو الأنظمة الخاصة بنا .أو السياسات أو خرق القرارات المتعلقة بحالة الحساب الخاص بك 11. استخدام الخدمات إذا لم تعد تستوفي معايير أهلية الاستخدام أو كنتَ غير قادر على .إبرام عقود ملزمة قانونياً أو تم ايقاف حسابك بشكلٍ مؤقت أو لأجلٍ غير مسمى 12. عدم تسليم العملاء المنتجات التي قمت ببيعها (إذا انطبق ذلك)، إلا إذا كان هناك .سبب قانوني يؤيد موقفك ومذكور في أي من السياسات الخاصة بنا 13. استخدام معلومات الاتصال المقدمة لك أثناء عقد الصفقة عبر الموقع لمحاولة زيادة .مبيعاتك خارج حدود الموقع أو عبر مواقع أخرى .14. التلاعب في سعر أي من المنتجات .15. التدخل في القوائم الخاصة بالمستخدمين الآخرين .16. اتخاذ أي إجراء من شأنه أن يقلل من تقييم الموقع وأنظمة التصنيف .17. نشر المحتوى الخاطئ أو غير الدقيق أو المضلل أو المخادع أو التشهيري أو ما شابه 18. نقل الحساب الخاص بك إلى طرف آخر دون الحصول على موافقة خطية مسبقة .من قبلنا .19. نشر الرسائل أو المراسلات الإلكترونية غير المرغوب فيها أو ما شابه ذلك 20. نشر الفيروسات أو أيٍّ من التقنيات الآخرى التي قد تضر بخدماتنا أو بمصالح .المستخدمين الآخرين أو أملاكهم 21. خرق القوانين الخاصة بحقوق النشر، العلامة التجارية، براءة الاختراع، الأخلاق، الإعلان، قاعدة البيانات، و/ أو أي من حقوق الملكية الفكرية (ويُشار إليها مجتمعة بـ حقوق الملكية الفكرية") التي تتعلق بنا أو المرخصة لنا او أي من حقوق الملكية" .الفكرية التي تتعلق بالغير أحكام عامة 1 القانون المطبق: إن شروط الاستخدام هذه وأياً من الحقوق أو الواجبات غير التعاقدية ذات الصلة يجب إخضاعها وتفسيرها للقوانين المطبقة في المملكة العربية ..السعودية . 2 حل النزاعات: إذا كان لديك أي من المشكلات الخاصة بخدماتنا يُرجى الاتصال بنا‎ وسنعمل جاهدين على حل المشكلة التي تواجهك في أقرب فرصة ممكنة. يتم تسوية أي من النزاعات أو الخلافات المتعلقة بشروط الاستخدام هذه، بما في ذلك أي حقوق أو .واجبات غير تعاقدية ذات صلة عن طريق محاكم المملكة العربية السعودية 3 حقوق الغير: الشخص الذي لا يُعد جزءاً من هذا العقد ليس لديه أي حق في تنفيذ .أي من شروطها .هذا العقد موثق الكترونيآ بين منصة بارجينيا والتاجر ولا يحتاج الى ختم يحمل هوية رقم : 423423432 الحساب البنكي الأيبان للمؤسسة / الشركة : 342421 على ان يتم فتح حساب وتوفير مساحة داخل المتجر يستطيع .من خلالها عرض ما لديه من منتجات على المنصة :ونلتزم نحن في بارجينيا بالاتي 1. المساعدة في طريقة فتح الحساب وعرض المنتجات ليستطيع البائع عرض ما لديه من أجهزة الكترونية بالمتجر من خلال حسابه لدينا حيث سنوفر له في بارجينيا كل ما يحتاجه من تفاصيل من حيث المبيعات والمشتريات التي تمت من خلال المتجر وكشف مفصل بقيمة مبيعاته والمبالغ المستحقة له وما تم تحويله لحسابه البنكي مع نسخه الكترونية يتم ارفاقها بعد إتمام عملية التحويل .لحسابه المسجل لدينا يستطيع الاطلاع عليها وتحميلها وطباعتها 2. نلتزم في بارجينيا بحفظ المستحقات والمبالغ المالية للبائع وتحويلها لحسابه المدون مسبقا عند في عملية التسجيل والمرفق بهذا العقد بدون تأخير بعد إتمام عملية البيع واستلام المنتج من قبل المشتري سليم ولا يوجد عليه أي ملاحظات او كسور وبنفس المواصفات التي تم عرضها بالموقع وتم الشراء على .أساسها 3. جميع العمليات المالية تتم بشكل الي ويستطيع البائع من خلال حسابه الاطلاع على المنتجات التي تم بيعها ومبالغها وما تم التحويل .له والمبالغ المتبقية ويحق له المراجعة والمطالبة تنص شروط الاستخدام وجميع السياسات والشروط الإضافية (في حال تطبيقها) الموجودة على الموقع على الشروط التي نقدمها لك للدخول واستخدام الموقع والخدمات والتطبيقات، بما في ذلك تطبيق الهاتف الجوال الخاصة بنا (ويُشار ").إليها مجتمعة بـ"الخدمات حال وصولك و/ أو تسجيلك و/ أو استمرارك في استخدام الخدمات أو الوصول إليها، فأنت توافق على الالتزام بشروط الاستخدام هذه والوثائق .القانونية بأثر فوري ان شروط الاستخدام هذه والوثائق القانونية خاضعة للتعديل من قبلنا في اي وقت. إن استمرار استخدامك للموقع بعد نشر أي تغيير يعني موافقتك .على شروط الاستخدام هذه والوثائق القانونية التي تم تعديلها :نبذه عن الموقع يعد هذا الموقع منصة للتجارة الإلكترونية التي تتيح للمستخدمين من المؤسسات التجارية عرض وبيع المنتجات، كما يتيح للشركات والأفراد .شراء مجموعة متنوعة من المنتجات نحتفظ بحق تقديم خدمات جديدة وتحديث أي من الخدمات .أو سحبها، وفقاً لتقديرنا الخاص دون اية مسؤولية شروط التسجيل يحق لك التسجيل كمشترٍ أو بائع والاستفادة من الخدمات إذا :توفرت لديك معايير الاهلية التالية :1. للمشترين 1. أن تكون بالغاً السن القانونية لتتمكن من شراء .المنتجات 2. أن تكون قادراً على تقديم عنوان في المملكة العربية .السعودية لتسليم المنتجات :2. للبائعين 1. أن يكون لديك شركة تجارية مسجلة وفقاً لقوانين .الدولة .2. أن يكون لديك ترخيص تجاري سارٍ 3. أن يمكنك تقديم ما يثبت تفويض الأفراد الذين .يقومون بالتسجيل في الموقع أو باستخدامه .4. تقديم إثبات الهوية للشخص المفوض .5. تقديم بيانات مصرفية داعمة 6. تقر وتوافق على أنه قد تنطبق بعض المتطلبات .الإضافية لبعض الفئات من المنتجات للتسجيل على الموقع، ستحتاج إلى تقديم بعض المعلومات، ولن يتم قبول تسجيلك في الموقع إذا لم يتم تقديم المعلومات اللازمة لنا. لدينا الحق في رفض أي من عمليات التسجيل دون إبداء الأسباب. كما يحق لنا أيضاً القيام بعمليات .التحقق اللازمة للتأكد من هويتك ومتطلبات التسجيل وبمجرد الانتهاء من التسجيل بنجاح، يستمر التسجيل الخاص بك لفترة غير محددة خاضعاً لاحتمال تعليقه أو إلغائه وفقاً للبند رقم 6 من شروط .الاستخدام هذه الالتزامات الخاصة بك عند استخدامك للخدمات أو وصولك إليها، فأنت توافق على ما :يلي 1. مسؤوليتك عن الحفاظ على الخصوصية وتقييد الوصول إلى الحساب الخاص بك واستخدامه هو وكلمة المرور، والموافقة على تحمل .مسؤولية جميع الأنشطة التي تتم باسم الحساب الخاص بك وكلمة المرور الخاصة بك 2. الموافقة على إخطارنا فورا عن أي استخدام غير مصرح به لكلمة المرور أو الحساب الخاص بك أو أي خرقٍ آخر لمعايير الاستخدام الآمن .للموقع 3. تقديم المعلومات الكاملة والحقيقية والدقيقة والحالية .عن نفسك وعن استخدامك للخدمات كما هو محدد من قبلنا 4. عدم الإفصاح للغير (باستثناء ما يلزم أو ما هو محدد .من قبلنا) عن معلومات المستخدم المقدمة لك 5. التعاون مع الطلبات الصادرة عنا للحصول على .معلومات إضافية فيما يتعلق بأهليتك واستخدامك لخدماتنا عند استخدامك للخدمات أو وصولك إليها، فأنت توافق على أنك :لن تقوم بما يلي نشر أو إدراج أو تحميل أي من المحتويات أو المواد غير المناسبة :أو المحظورة في موقعنا، بما في ذلك 1. المحتوى أو المواد غير الملائمة أخلاقياً أو دينياً بأي شكلٍ .من الأشكال 2. المحتوى أو المواد التي لا تتوافق مع القانون المحلي .والشريعة الإسلامية والقواعد والأخلاق والقيم والآداب والتقاليد .3. المحتوى أو المواد التي قد تُهدد الأمن القومي 4. المحتوى أو المواد التي قد تروج أو تندرج في إطار .المقامرة .5. أي من الأسلحة 6. حسب علمك، المواد التي تكون معيبة أو زائفة أو تالفة أو مضللة أو قد تسبب ضررا عند استخدامها بشكلٍ طبيعي لمصلحة مستخدم .آخر للموقع أو لصحته .7. قسائم غير قابلة للتحويل .8. المواد الكيميائية .9. نشر المواد المزيفة أو المسروقة 10. خرق القانون أو التحايل عليه، أو خرق أي من حقوق الغير أو الأنظمة الخاصة بنا أو السياسات أو خرق القرارات المتعلقة بحالة الحساب .الخاص بك 11. استخدام الخدمات إذا لم تعد تستوفي معايير أهلية الاستخدام أو كنتَ غير قادر على إبرام عقود ملزمة قانونياً أو تم ايقاف حسابك بشكلٍ .مؤقت أو لأجلٍ غير مسمى 12. عدم تسليم العملاء المنتجات التي قمت ببيعها (إذا انطبق ذلك)، إلا إذا كان هناك سبب قانوني يؤيد موقفك ومذكور في أي من السياسات .الخاصة بنا 13. استخدام معلومات الاتصال المقدمة لك أثناء عقد .'
                            'الصفقة عبر الموقع لمحاولة زيادة مبيعاتك خارج حدود الموقع أو عبر مواقع أخرى .14.'
                            ' التلاعب في سعر أي من المنتجات .15. التدخل في القوائم الخاصة بالمستخدمين'
                            ' الآخرين 16. اتخاذ أي إجراء من شأنه أن يقلل من تقييم الموقع .وأنظمة '
                            'التصنيف 17. نشر المحتوى الخاطئ أو غير الدقيق أو المضلل أو .المخادع '
                            'أو التشهيري أو ما شابه 18. نقل الحساب الخاص بك إلى طرف آخر دون الحصول .على موافقة'
                            ' خطية مسبقة من قبلنا 19. نشر الرسائل أو المراسلات الإلكترونية غير المرغوب فيها .أ'
                            'و ما شابه ذلك 20. نشر الفيروسات أو أيٍّ من التقنيات الآخرى التي قد .تضر بخدماتنا أو بمصالح '
                            'المستخدمين الآخرين أو أملاكهم 21. خرق القوانين الخاصة بحقوق النشر، العلامة التجارية،'
                            ' براءة الاختراع، الأخلاق، الإعلان، قاعدة البيانات، و/ أو أي من حقوق الملكية الفكرية ويُشار '
                            'إليها مجتمعة بـ "حقوق الملكية الفكرية") التي تتعلق بنا أو المرخصة لنا او أي( .من حقوق'
                            ' الملكية الفكرية التي تتعلق بالغير أحكام عامة 1 القانون المطبق: إن شروط الاستخدام هذه'
                            ' وأياً من الحقوق أو الواجبات غير التعاقدية ذات الصلة يجب إخضاعها وتفسيرها للقوانين '
                            '..المطبقة في المملكة العربية السعودية 2 حل النزاعات: إذا كان لديك أي '
                            'من المشكلات الخاصة بخدماتنا يُرجى الاتصال بنا‎. وسنعمل جاهدين على حل المشكلة '
                            'التي تواجهك في أقرب فرصة ممكنة. يتم تسوية أي من النزاعات أو الخلافات المتعلقة بشروط'
                            ' الاستخدام هذه، بما في ذلك أي حقوق أو واجبات غير تعاقدية ذات صلة عن طريق '
                            'محاكم .المملكة العربية السعودية 3 حقوق الغير: الشخص الذي لا يُعد جزءاً من'
                            ' هذا .العقد ليس لديه أي حق في تنفيذ أي من شروطها • هذا العقد موثق الكترون'
                            'يآ بين منصة بارجينيا والتاجر .ولا يحتاج الى ختم', color: HexColor('#00173F'), align: true)
                    ),
                  ),
                ),),
              Positioned(
                  bottom: 40.h,
                  left: 32.w,
                  right: 32.w,
                  child: StyledButton(
                    fillColor: secondaryColor,
                    radius: true,
                    child: reg14Text('DONE', color: whiteColor),
                    function: (){
                      locator<NavigationService>().navigateTo(RouteName.MainPage);
                    },
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
