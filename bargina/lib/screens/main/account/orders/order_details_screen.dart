import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/cart/viewmodel/cart_viewmodel.dart';
import 'package:bargina/screens/main/cart/widgets/shimmer_address_item.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Locator.dart';

class OrderDetailsScreen extends StatelessWidget {

   final id;

   OrderDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('orderId  --$id');
    return BaseScreen<CartViewModel>(
      onModelReady: (_){
        _.getOrderDetails(context, id).whenComplete(() {
        //   _.calculateShippingPrice(context, product_id, quantity);
        });
      },
      builder: (_, vm, child){
        return Scaffold(
          appBar:AppBar(
            backgroundColor: primaryColor,
            title: bold16Text('Order Details', color: whiteColor),
            centerTitle: true,
            leading: Icon(Icons.arrow_back_ios_outlined, color: whiteColor, size: 30.w,).onTap((){
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
              child: vm.orderDetailsModel==null ?  ShimmerAddressItem() : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          return _buildItemList(vm.orderDetailsModel['order_detail']);
                        },
                        itemCount: 1,
                      ),
                    ),
                  ),
                  //heightSpace(10.h),
                  Divider(height: 2.h,),
                  heightSpace(10.h),
                  bold18Text('Shipping Address'),
                  heightSpace(10.h),
                  _buildAddressItem(vm),
                  heightSpace(10.h),
                  Divider(height: 2.h, color: Colors.grey[600],),
                  heightSpace(10.h),
                  bold18Text('Payment'),
                  heightSpace(10.h),
                  _buildPaymentItem(vm.orderDetailsModel['order']),
                  heightSpace(30.h)
                ],
              ),
            ),
          ),
        );
      },
    );

  }
  _buildItemList(item){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10.w , bottom: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.w)),
              border: Border.all(color: Colors.grey, width: 1.w)
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Center(
              child: CachedNetworkmage(url: 'https://phplaravel-425085-2297893.cloudwaysapps.com/storage/uploads/tmpphphlzcnw.png', width: 80.w, height: 80.h,),
            ),
          ),
        ),
        bold16Text(item['product_name']),
        bold16Text('${item['price_after']} SAR', color: secondaryColor)
      ],
    );
  }
  _buildAddressItem(CartViewModel viewModel){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        normal16Text(viewModel.orderDetailsModel['ship_address']['company']),
        heightSpace(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: 300.w,
                child: normal16Text('${viewModel.orderDetailsModel['ship_address']['street']}, ${viewModel.orderDetailsModel['ship_address']['city']}, '
                    '${viewModel.orderDetailsModel['ship_address']['state']}, ${viewModel.orderDetailsModel['ship_address']['country']}',)),
            Spacer(),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryColor
              ),
              child: Center(
                  child: Icon(Icons.done, color: whiteColor, size: 13.w,)
              ),
            ),

          ],
        ),
        heightSpace(10.h),
        bold14Text('Change', color: secondaryColor)

      ],
    );
  }
  _buildPaymentItem(item){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset('assets/icons/Icon_MasterCard.png'),
            widthSpace(27.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bold12Text('VISA', color: Colors.grey),
                bold16Text('**** **** **** 4543')
              ],
            ),
            Spacer(),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryColor
              ),
              child: Center(
                  child: Icon(Icons.done, color: whiteColor, size: 13.w,)
              ),
            ),



          ],
        ),
        heightSpace(10.h),
        bold14Text('Change', color: secondaryColor)
      ],
    );

  }
}

