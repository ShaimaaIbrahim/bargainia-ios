import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/cart/checkout/pages/address_page.dart';
import 'package:bargina/screens/main/cart/checkout/pages/payments_page.dart';
import 'package:bargina/screens/main/cart/checkout/pages/shipping_page.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Locator.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/texts.dart';
import '../viewmodel/cart_viewmodel.dart';

class CheckOutPage extends StatelessWidget {
  final productId;
  final quantity;
  final bool? digital;

   CheckOutPage({Key? key, required this.productId, required this.quantity, required this.digital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return BaseScreen<CartViewModel>(
      onModelReady: (_) {
        _.generateChecks();
        _.setInitial(productId, quantity);
        _.getMyAddresses(context);
        _.getShippingMethods(context);
        _.getPaymentsMethods(context);
      },
      builder: (_, vm, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: reg20Text('Checkout', color: whiteColor),
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back_ios_outlined,
              color: whiteColor,
              size: 20.w,
            ).onTap((){
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height* 0.9,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        heightSpace(32.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: _buildStepWidget('Address', 0, vm),
                            ),
                            Expanded(
                              flex: 1,
                              child: _buildLineWidget(1, vm),
                            ),
                            Expanded(
                              flex: 1,
                              child: _buildStepWidget('Shipping', 1, vm),
                            ),
                            Expanded(
                              flex: 1,
                              child: _buildLineWidget(2, vm),
                            ),
                            Expanded(
                              flex: 1,
                              child: _buildStepWidget('Payment', 2, vm),
                            ),
                          ],
                        ),
                        heightSpace(40.h),
                        SingleChildScrollView(
                          child: ExpandablePageView(
                            children: [
                              AddressPage(viewModel: vm),
                              ShippingPage(viewModel: vm),
                              PaymentPage(viewModel: vm,),
                            ],
                            reverse: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            controller: controller,
                            onPageChanged: (num) {
                              vm.changeCurrentPage(num);
                            },
                          ),
                        ),
                        heightSpace(30.h),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 50.h,
                    left: 0.w,
                    right: 0.w,
                    child: SizedBox(
                      height: 90.h,
                      child: Row(
                        children: [
                          Expanded(
                            flex:1,
                            child: Visibility(
                              visible: vm.currentPage== 0 ? false: true ,
                              child: StyledButton(
                                function: () {
                                   if(vm.currentPage== 0) return;
                                   controller.jumpToPage(vm.currentPage-1);
                                },
                                child: reg14Text('BACK', color: secondaryColor),
                                border: secondaryColor,
                                fillColor: whiteColor,
                                radius: true,
                                width: 146.w,
                              ),
                            ),
                          ),
                          widthSpace(23.w),
                           Expanded(
                            flex:1,
                            child: vm.state ==ViewState.Busy && vm.currentPage==2 ? SizedBox(
                              height: 100.h,
                              width: 100.w,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: secondaryColor,
                                ),
                              ),
                            ): StyledButton(
                              function: () {



                                if(vm.currentPage ==0 && vm.selectedAddressId!=null){
                                  controller.jumpToPage(vm.currentPage+1);
                                }
                                else if(vm.currentPage ==1 && vm.shipWay!=null){
                                  controller.jumpToPage(vm.currentPage+1);
                                }
                                else if(vm.currentPage== 2 && vm.paymentMethod!=null){

                                  vm.newOrder(context, productId, quantity, vm, digital??false);
                                }else{
                                 // controller.jumpToPage(vm.currentPage+1);
                                  showSnackBar("you should choose value", context);
                                }
                              },
                              child: reg14Text('NEXT', color: whiteColor),
                              radius: true,
                              fillColor: secondaryColor,
                              width: 146.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _buildStepWidget(text, i, CartViewModel vm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
                border: Border.all(color: secondaryColor, width: 1.w)),
            child: Center(
              child: Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: vm.currentPage >= i ? secondaryColor: whiteColor,
                ),
              ),
            )),
        heightSpace(14.h),
        reg12Text(text, color: HexColor('#000000'))
      ],
    );
  }

  _buildLineWidget(i, CartViewModel viewModel) {
    return Container(
      height: 2.w,
      color: viewModel.currentPage >= i ? secondaryColor :Colors.grey[300],
    );
  }
}
