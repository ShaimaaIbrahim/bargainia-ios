import 'package:bargina/screens/main/cart/checkout/checkout_page.dart';
import 'package:bargina/screens/main/cart/model/cart_entity.dart';
import 'package:bargina/screens/main/cart/viewmodel/cart_viewmodel.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:dotted_line/dotted_line.dart';
import '../../../../Locator.dart';
import '../../../../routes/RoutesNames.dart';
import '../../../../services/navigation_service.dart';
import '../../../../widgets/rounded_textfield.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../widgets/styled_button.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class CartListItem extends StatefulWidget {
  final CartEntity cartItem;
  final CartViewModel viewModel;
  final Function? delete;

  CartListItem({Key? key, required this.cartItem, required this.viewModel, required this.delete})
      : super(key: key);

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
       // height: 120.h,
        margin: EdgeInsets.only(bottom: 30.h),
        child: Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: () {
              widget.viewModel.deleteCartItem(widget.cartItem.id);
              widget.delete;
              setState(() {
                visible= false;
              });
            }),
            children: [
              SlidableAction(
                flex: 1,
                onPressed: (_){
                  widget.viewModel.deleteCartItem(widget.cartItem.id);
                  widget.delete;
                },
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                icon: Icons.delete_outline_rounded,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex:1,
                child:
                Container(
                    //height: 120.h,
                   // width: 120.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: HexColor('#E1E1E1'), width: 1.w),
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 5.h, bottom: 5.h, right: 15.w, left: 15.w),
                      child: Center(
                        child: CachedNetworkmage(
                          url:widget. cartItem.mainImg!,
                          height: 100.h,
                          width: 80.w,
                        ),
                      ),
                    )),
              ),
              widthSpace(30.w),
              Expanded(
                flex:2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    med16Text(
                      widget.cartItem.name!,
                    ),
                    heightSpace(10.h),
                    med16Text('${widget.cartItem.price} SAR', color: secondaryColor),
                    heightSpace(10.h),
                    Row(
                      children: [
                        _buildQuantityWidget(widget.cartItem,widget. viewModel),
                        widthSpace(10.w),
                        StyledButton(
                          function: () {
                            widget.viewModel.setSelectedCartItem(widget.cartItem.id);
                            showDialoge(
                              _buildCheckoutDialoge(context, widget.viewModel, widget.cartItem),
                              context,
                            );
                          },
                          fillColor: secondaryColor,
                          radius: true,
                          child: semiBold14Text('PAY', color: whiteColor),
                          width: 80.w,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


  _buildQuantityWidget(CartEntity cartEntity, CartViewModel viewModel) {
    return Container(
      //height: 37.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.w)),
          color: Colors.grey[200]),
      child: Padding(
        padding:
            EdgeInsets.only(left: 11.w, right: 11.w, top: 7.h, bottom: 7.h),
        child: Row(
          children: [
            bold14Text('+', color: Colors.grey).onTap(() {
              viewModel.increase(cartEntity);
            }),
            widthSpace(23.w),
            bold14Text(cartEntity.quantity.toString(), color: Colors.grey),
            widthSpace(23.w),
            bold14Text('-', color: Colors.grey).onTap(() {
              viewModel.decrease(cartEntity);
            })
          ],
        ),
      ),
    );
  }

  _buildCheckoutDialoge(
      BuildContext context, CartViewModel viewModel, CartEntity cartEntity) {
    return  KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
      print('keeeeeeeeeeeeeeeeeeeeeeey ${isKeyboardVisible}');
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(20.w)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 8,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bold16Text('Are you sure pay?', color: secondaryColor),
              heightSpace(30.h),
              //heightSpace(30.h),
              // Divider(height: 1.w, color: Colors.grey,),
              // heightSpace(30.h),
              isKeyboardVisible==true ? SizedBox() : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: semiBold14Text('SubTotal', color: Colors.grey)),
                  widthSpace(4.w),
                  Expanded(
                      flex: 1,
                      child: DottedLine(
                        direction: Axis.horizontal,
                        lineLength: double.infinity,
                        lineThickness: 1.0,
                        dashLength: 4.0,
                        dashColor: Colors.black,
                        //dashGradient: [Colors.red, Colors.blue],
                        dashRadius: 0.0,
                        dashGapLength: 4.0,
                        //dashGapColor: Colors.transparent,
                        //dashGapGradient: [Colors.red, Colors.blue],
                        dashGapRadius: 0.0,
                      )),
                  widthSpace(4.w),
                  Expanded(
                      flex: 1,
                      child: semiBold14Text(
                          '${int.parse(cartEntity.price!) * cartEntity.quantity!} SAR',
                          color: secondaryColor)),
                ],
              ),
              heightSpace(30.h),
              isKeyboardVisible==true ? SizedBox() :Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1, child: semiBold14Text('Tax', color: Colors.grey)),
                  widthSpace(4.w),
                  Expanded(
                      flex: 1,
                      child: DottedLine(
                        direction: Axis.horizontal,
                        lineLength: double.infinity,
                        lineThickness: 1.0,
                        dashLength: 4.0,
                        dashColor: Colors.black,
                        //dashGradient: [Colors.red, Colors.blue],
                        dashRadius: 0.0,
                        dashGapLength: 4.0,
                        //dashGapColor: Colors.transparent,
                        //dashGapGradient: [Colors.red, Colors.blue],
                        dashGapRadius: 0.0,
                      )),
                  widthSpace(4.w),
                  Expanded(
                      flex: 1,
                      child: semiBold14Text('0 SAR', color: secondaryColor)),
                ],
              ),
              heightSpace(40.h),
              Expanded(
                child: RoundedStyledTextField(
                  labelText: 'Enter Voucher Code',
                  hint: 'Enter Voucher Code',
                  height: 50.h,
                ),
              ),
              // Row(
              //   children: [
              //     Expanded(
              //         flex: 3,
              //         child: RoundedStyledTextField(labelText: 'Enter Voucher Code',
              //           hint: 'Enter Voucher Code', height: 50.h,)),
              //     widthSpace(5.w),
              //     Expanded(
              //       flex: 1,
              //       child: StyledButton(function: (){
              //
              //       }, height : 50.h ,child: semiBold14Text('Apply', color: whiteColor), radius: true,),
              //     )
              //   ],
              // ),
              heightSpace(30.h),
              // Spacer(),
              Row(
                children: [
                  StyledButton(
                    radius: true,
                    function: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CheckOutPage(
                              digital: false,
                              productId: cartEntity.id,
                              quantity: cartEntity.quantity)));
                    },
                    child: semiBold14Text('CHECKOUT', color: whiteColor),
                    fillColor: secondaryColor,
                    width: 100.w,
                  ),
                  Spacer(),
                  StyledButton(
                    radius: true,
                    function: () {
                      locator<NavigationService>().goBack();
                    },
                    child: semiBold14Text('CANCEL', color: secondaryColor),
                    fillColor: whiteColor,
                    width: 100.w,
                    border: secondaryColor,
                  ),
                ],
              )
            ],
          ),
        ),
      );});
  }
