import 'package:bargina/screens/auth/data/my_account_model.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/screens/main/account/widgets/dropdown_cities_widget.dart';
import 'package:bargina/screens/main/account/widgets/dropdown_countries_widget.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/texts.dart';
import '../../../widgets/dropdown_widget.dart';
import '../../../widgets/rect_checkbox.dart';
import '../../../widgets/rounded_textfield.dart';
import '../../../widgets/styled_button.dart';

class NewShippingAddressScreen extends StatelessWidget {
   dynamic address;
   NewShippingAddressScreen({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AccountViewModel>(
      onModelReady: (_){},
      afterModelReady: (_){
        _.getAllCountries(context);
        _.getAllCities(context);
        if(address!=null){
          //_.setInitCountryAndCity(address.countryId, address.cityId);
          _.placeController.text = address.address;
          _.postalController.text = address.postalCode;
          _.streetController.text = address.street;
          _.regionController.text = address.state;
        }
      },
      onFinish: (_){},
      builder: (_, vm, child){
        return Scaffold(
            appBar:AppBar(
              backgroundColor: primaryColor,
              title: reg20Text('New Shipping Address', color: whiteColor),
              centerTitle: true,
              leading: Icon(Icons.arrow_back_ios_rounded, color: whiteColor, size: 20.w,).onTap((){
                locator<NavigationService>().goBack();
              }),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heightSpace(10.h),
                      med20Text('Payment Address'),
                      Divider(color: secondaryColor, height: 10.h,),
                      // heightSpace(10.h),
                      heightSpace(10.h),
                      _buildLabelText('The Nearst Place is Next you'),
                      heightSpace(5.h),
                      RoundedStyledTextField(labelText: '', controller: vm.placeController,),
                      heightSpace(10.h),
                      _buildLabelText('Street Name'),
                      heightSpace(5.h),
                      RoundedStyledTextField(labelText: '', controller: vm.streetController,),
                      heightSpace(10.h),
                      _buildLabelText('Country'),
                      heightSpace(5.h),
                      DropDownCountriesWidget(list: vm.countries,viewModel: vm,),
                      heightSpace(10.h),
                      _buildLabelText('City'),
                      heightSpace(5.h),
                      DropDownCitiesWidget(list: vm.cities, viewModel: vm,),
                      heightSpace(10.h),
                      _buildLabelText('Region/State'),
                      heightSpace(5.h),
                      RoundedStyledTextField(labelText: '', controller: vm.regionController,),
                      heightSpace(10.h),
                      heightSpace(10.h),
                      _buildLabelText('Postal Code'),
                      heightSpace(5.h),
                      RoundedStyledTextField(labelText: '', controller: vm.postalController,),
                      heightSpace(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RectChecBox(),
                          widthSpace(11.w),
                          normal16Text('Default'),
                        ],
                      ),
                      heightSpace(20.h),
                      StyledButton(function: (){
                         if(address==null){
                           vm.addNewAddress(context);
                         }else{
                           vm.updateAddress(context, address.id);
                         }
                      },
                        child: reg14Text(address!=null ? 'UPDATE' :'SAVE', color: whiteColor),
                        width: 164.w, fillColor: secondaryColor, )
                    ],
                  ),
                ),
              ),
            )
        );
      },
    );

  }
  _buildLabelText(text) {
    return RichText(
        text: TextSpan(
            text: '*',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red),
            children: [
              TextSpan(
                  text: text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor('#00173F'),
                  ))
            ]));
  }
}
