import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/delete_account_page.dart';
import 'package:bargina/screens/main/account/new_shipping_address.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/screens/main/account/widgets/info_shimmer_widget.dart';
import 'package:bargina/screens/main/viewmodel/main_viewmodel.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/circle_image.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Locator.dart';
import '../../../services/shared_prefrence_services.dart';
import '../../../utils/texts.dart';
class AccountScreen extends StatefulWidget {
  final MainViewModel viewModel;
  const AccountScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isLogin = false;
  @override
  Widget build(BuildContext context) {
    return BaseScreen<AccountViewModel>(
      onModelReady: (_){
        widget.viewModel.getMyAccount(context);
        _checkLogin();
      },
      builder: (_, vm, child){
        return Container(
          color: whiteColor,
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.viewModel.myAccountModel !=null  ? Row(
                  children: [
                    CircleImage(url: 'https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?t=st=1649818795~exp=1649819395~hmac=b6f10b713a9d2e05b914d4567d44bd5db0e81c2997248bd91ad56609a77095c2', radius: 60.r),
                    widthSpace(15.w),
                    widget.viewModel.myAccountModel==null ? InfoShimmerWidget(): Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          med26Text('${widget.viewModel.myAccountModel!.firstName ?? ''} ${widget.viewModel.myAccountModel!.lastName ?? ''}'),
                          reg14Text(widget.viewModel.myAccountModel!.email ?? ''),
                        ],
                      ),
                    ),
                  ],
                ): Container(),
                heightSpace(26.h),
                _isLogin ? Container() : Center(
                    child: StyledButton(function: (){
                      locator<NavigationService>().navigateTo(RouteName.SignIn);
                    },  width: 164.w, radius: true, fillColor: secondaryColor,  child: reg14Text('LOGIN OR REGISTER', color: whiteColor))),
                heightSpace(30.h),
                Row(
                  children: [
                    _buildIconContainer('assets/icons/Icon_Edit-Profile.png'),
                    widthSpace(15.w),
                    reg18Text('Edit Profile'),
                    Spacer(),
                    Image.asset('assets/icons/next.png', width: 20.w, height: 20.h,)

                  ],
                ).onTap((){
                  locator<NavigationService>().navigateTo(RouteName.MyAccount);
                }),
                heightSpace(30.h),
                Row(
                  children: [
                    _buildIconContainer('assets/icons/Icon_dd_shipping.png'),
                    widthSpace(15.w),
                    reg18Text('Add Shipping Addresses'),
                    Spacer(),
                    Image.asset('assets/icons/next.png', width: 20.w, height: 20.h,)

                  ],
                ).onTap((){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewShippingAddressScreen(address: null,)));
                }),
                heightSpace(30.h),
                Row(
                  children: [
                    _buildIconContainer('assets/icons/Icon_Location.png'),
                    widthSpace(15.w),
                    reg18Text('Shipping Address'),
                    Spacer(),
                    Image.asset('assets/icons/next.png', width: 20.w, height: 20.h,)

                  ],
                ).onTap((){
                  locator<NavigationService>().navigateTo(RouteName.ShippingAddress);
                }),
                heightSpace(30.h),
                Row(
                  children: [
                    _buildIconContainer('assets/icons/Icon_Accounts_Transfer.png'),
                    widthSpace(15.w),
                    reg18Text('Accounts Transfer'),
                    Spacer(),
                    Image.asset('assets/icons/next.png', width: 20.w, height: 20.h,)

                  ],
                ).onTap((){
                  locator<NavigationService>().navigateTo(RouteName.AccountTransfer);
                }),
                heightSpace(30.h),
                Row(
                  children: [
                    _buildIconContainer('assets/icons/Icon_Products.png'),
                    widthSpace(15.w),
                    reg18Text('My Products'),
                    Spacer(),
                    Image.asset('assets/icons/next.png', width: 20.w, height: 20.h,)

                  ],
                ).onTap((){
                  locator<NavigationService>().navigateTo(RouteName.MyProducts);

                }),
                heightSpace(30.h),
                Row(
                  children: [
                    _buildIconContainer('assets/icons/Icon_Order.png'),
                    widthSpace(15.w),
                    reg18Text('My Orders'),
                    Spacer(),
                    Image.asset('assets/icons/next.png', width: 20.w, height: 20.h,)

                  ],
                ).onTap((){
                  locator<NavigationService>().navigateTo(RouteName.MyOrders);
                }),
                heightSpace(30.h),
                Row(
                  children: [
                    _buildIconContainer('assets/icons/Icon_Payment.png'),
                    widthSpace(15.w),
                    reg18Text('Update Password'),
                    Spacer(),
                    Image.asset('assets/icons/next.png', width: 20.w, height: 20.h,)

                  ],
                ).onTap((){
                  locator<NavigationService>().navigateTo(RouteName.UpdatePassword);
                }),
                heightSpace(30.h),
                _isLogin ? Row(
                  children: [
                    _buildIconContainer('assets/icons/Icon_Exit.png'),
                    widthSpace(15.w),
                    reg18Text('LogOut'),
                    Spacer(),
                    Image.asset('assets/icons/next.png', width: 20.w, height: 20.h,)

                  ],
                ).onTap(() async{
                   vm.logout(context);
                   setState(() {
                     _isLogin = false;
                   });
                }) : Container(),
                heightSpace(20.h),
                _isLogin ? Row(
                  children: [
                    _buildIconContainer('assets/icons/Icon_Exit.png'),
                    widthSpace(15.w),
                    reg18Text('DELETE ACCOUNT'),
                    Spacer(),
                    Image.asset('assets/icons/next.png', width: 20.w, height: 20.h,)

                  ],
                ).onTap(() async{
               //   vm.logout(context);
                //  locator<NavigationService>().navigateTo(RouteName.delete);
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeleteAccountPage()));
                    if(result == "done"){
                    setState(() {
                      _isLogin = false;
                    });
                  }}
                  )
                 : Container(),
                heightSpace(30.h),
              ],
            ),
          ),
        );

      },
    );
  }

  _checkLogin() async{
    var isLogin = await  locator<SharedPreferencesServices>().checkLogin();
    setState(() {
      _isLogin= isLogin ?? false;
    });
  }

  _buildIconContainer(image){
    return Container(
      width: 40.w,
      height: 40.h,
      // decoration: BoxDecoration(
      //  color: Colors.grey[200],
      //  borderRadius: BorderRadius.all(Radius.circular(2.r))
      // ),
      child: Center(
        child: Image.asset(image, width: 40.w, height: 40.h,),
      ),
    );
  }
}
