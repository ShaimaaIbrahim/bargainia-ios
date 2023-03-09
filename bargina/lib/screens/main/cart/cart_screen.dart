import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/cart/viewmodel/cart_viewmodel.dart';
import 'package:bargina/screens/main/cart/widgets/cart_item_list.dart';
import 'package:bargina/screens/main/viewmodel/main_viewmodel.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class CartScreen extends StatelessWidget {
  final MainViewModel viewModel;
  const CartScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<CartViewModel>(
      onModelReady: (_){
        viewModel.getCartItems();
    },
      builder: (_, vm, child){
        return KeyboardVisibilityProvider(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                heightSpace(10.h),
                viewModel.cartItems==null || viewModel.cartItems!.isEmpty ?  _noItemsWidget(context): ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return  CartListItem(cartItem: viewModel.cartItems![i], viewModel: vm,
                    delete:  (){
                      viewModel.getCartItems();
                    },);
                  },
                  itemCount: viewModel.cartItems!.length,
                ),
                heightSpace(25.h),
              ],
            ),
          ),
        );
      },
    );

  }

  _noItemsWidget(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.7,
      child: Center(
        child: reg20Text('No Cart Items Added'),
      ),
    );
  }

}
