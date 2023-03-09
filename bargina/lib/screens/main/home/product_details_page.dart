import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/cart/widgets/shimmer_address_item.dart';
import 'package:bargina/screens/main/home/add_review_page.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/container_image.dart';
import 'package:bargina/screens/main/home/widgets/customer_widget.dart';
import 'package:bargina/screens/main/home/widgets/product_details_shimmer.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Locator.dart';
import '../../../services/shared_prefrence_services.dart';
import '../../../utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/texts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:badges/badges.dart';
import '../../../widgets/custome_number_picker.dart';
import '../cart/checkout/checkout_page.dart';

class ProductDetailsScreen extends StatefulWidget {
  dynamic id;

  ProductDetailsScreen({Key? key, this.id}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool _isLogin = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<PageContainerState> key = GlobalKey();
    PageController controller = PageController();

    return BaseScreen<HomeViewModel>(onModelReady: (_) {
       _checkLogin();
      _.getProductDetails(context, widget.id);
      _.getProducReviews(context, widget.id);
      _.getCartItemsCount();
    }, builder: (_, vm, child) {
      return Scaffold(
        backgroundColor: HexColor('#E6E8EA'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: vm.productDetails == null
                ? ProductDetailsShimmer()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heightSpace(20.h),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w, left: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_outlined,
                              color: secondaryColor,
                              size: 20.w,
                            ).onTap(() {
                              locator<NavigationService>().goBack();
                            }),
                            Spacer(),
                            Badge(
                              badgeContent: bold12Text(vm.count.toString(),
                                  color: secondaryColor),
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.grey[700],
                              ),
                            ).onTap(() {
                              Navigator.of(context)
                                  .pushNamed(RouteName.MainPage);
                            })
                          ],
                        ),
                      ),
                      heightSpace(10.h),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w, left: 20.w),
                        child: SizedBox(
                            height: 250.h,
                            child: PageIndicatorContainer(
                              key: key,
                              child: PageView(
                                children: [
                                  for (int i = 0;
                                      i < vm.productDetails!.images!.length;
                                      i++)
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.w, right: 10.w),
                                      child: CachedNetworkmage(
                                        width: 155.w,
                                        height: 249.h,
                                        url: vm.productDetails!.images![i]
                                                .imgPath ??
                                            'https://img.freepik.com/free-psd/digital-device-screen-mockup-vector-with-laptop-smartphone-with-gradient-wallpapers_53876-129214.jpg',
                                      ),
                                    ),
                                ],
                                controller: controller,
                                reverse: true,
                              ),
                              align: IndicatorAlign.bottom,
                              length: vm.productDetails!.images!.length,
                              indicatorSpace: 10.0,
                            )),
                      ),
                      heightSpace(34.h),
                      SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.w)),
                              color: whiteColor),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 24.w, top: 39.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    bold22Text(vm.productDetails!.description!,
                                        color: HexColor('#515C6F')),
                                    Spacer(),
                                    bold18Text(
                                        '${vm.productDetails!.price} SAR',
                                        color: secondaryColor)
                                  ],
                                ),
                                heightSpace(21.h),
                                reg14Text(vm.productDetails!.title!,
                                    color: Colors.grey[500]),
                                heightSpace(21.h),
                                bold18Text('-Product Information',
                                    color: primaryColor),
                                heightSpace(18.h),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    med16Text(
                                        'Weight : ${vm.productDetails?.weight}',
                                        color: HexColor('#00173F')),
                                    med16Text(
                                        'Width : ${vm.productDetails?.width}',
                                        color: HexColor('#00173F')),
                                  ],
                                ),
                                heightSpace(12.h),
                                Divider(
                                  height: 1.h,
                                  color: HexColor('#727C8E'),
                                ),
                                heightSpace(21.h),
                                bold18Text('+State', color: primaryColor),
                                heightSpace(12.h),
                                med16Text(
                                    'Active at: ${vm.productDetails?.activeAt}',
                                    color: HexColor('#00173F')),
                                heightSpace(12.h),
                                med16Text(
                                    'Expired at: ${vm.productDetails?.expireAt}',
                                    color: HexColor('#00173F')),
                                heightSpace(12.h),
                                med16Text(
                                    'Number of Views: ${vm.productDetails?.viewCount}',
                                    color: HexColor('#00173F')),
                                heightSpace(12.h),
                                Divider(
                                  height: 1.h,
                                  color: HexColor('#727C8E'),
                                ),
                                heightSpace(47.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    reg14Text('Avaliable amount: ${vm.productDetails!.quantatity}',
                                        color: HexColor('#1E2022')),
                                    Spacer(),
                                    CustomeNumberPicker(
                                      viewModel: vm,
                                    )
                                  ],
                                ),
                                heightSpace(35.h),
                                _isLogin ?    Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    StyledButton(
                                      function: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) => CheckOutPage(
                                                    digital: false,
                                                    productId:
                                                    vm.productDetails!.id,
                                                    quantity: vm.quantity)));
                                      },
                                      fillColor: primaryColor,
                                      radius: true,
                                      child:
                                      reg14Text('PAY', color: whiteColor),
                                      width: 140.w,
                                    ),
                                    widthSpace(15.w),
                                    StyledButton(
                                      function: () {
                                        vm.addToCart(context,
                                            vm.productDetails!, vm.quantity);
                                        vm.increaseCount();
                                      },
                                      radius: true,
                                      fillColor: secondaryColor,
                                      child: reg14Text('ADD TO CART',
                                          color: whiteColor),
                                      width: 140.w,
                                    ),
                                  ],
                                ) : Container(),
                                heightSpace(35.h),
                                Divider(
                                  height: 1.h,
                                  color: HexColor('#727C8E'),
                                ),
                                heightSpace(17.h),
                                vm.reviews == null
                                    ? ShimmerAddressItem()
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          return CustomerInfoWidget(
                                              rate: vm.reviews![i]);
                                        },
                                        itemCount: vm.reviews!.length,
                                      ),
                                heightSpace(16.h),
                               _isLogin?  StyledButton(
                                  function: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => AddReviewPage(
                                                viewModel: vm,
                                                productDetails:
                                                    vm.productDetails!)));
                                  },
                                  width: 200.w,
                                  fillColor: secondaryColor,
                                  radius: true,
                                  child: reg14Text('ADD REVIEW',
                                      color: whiteColor),
                                ): Container() ,
                                heightSpace(20.h),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: ContainedImageWidget(
                                          text: 'Trusted',
                                          image: 'assets/icons/Trusted.png',
                                        )),
                                    widthSpace(8.w),
                                    Expanded(
                                        flex: 1,
                                        child: ContainedImageWidget(
                                            text: 'Approved',
                                            image:
                                                'assets/icons/Approved.png')),
                                    widthSpace(8.w),
                                    Expanded(
                                        flex: 1,
                                        child: ContainedImageWidget(
                                            text: 'Featured',
                                            image: 'assets/icons/Featured.png'))
                                  ],
                                ),
                                heightSpace(20.h)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      );
    });
  }

   _checkLogin() async{
    var isLogin = await  locator<SharedPreferencesServices>().checkLogin();
    setState(() {
      _isLogin= isLogin ?? false;
    });
  }
}
