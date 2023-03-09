import 'package:bargina/screens/auth/signin_screen.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/rounded_textfield.dart';
import 'package:bargina/widgets/styled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/widgets/option_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Locator.dart';
import '../../../../enums/ScreenState.dart';
import '../../../../services/navigation_service.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/texts.dart';
import '../../../../widgets/dropdown_widget.dart';
import '../../../../widgets/styled_button.dart';
import '../../account/model/my_product_model.dart';

class AddUsedProductPage extends StatelessWidget {
  final catId;
  final MyProductModel? product;
  final bool? edit;


  const AddUsedProductPage({Key? key, required this.catId, this.product, this.edit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (_) {
        // _.getCategoryInputs(context, catId, product!, edit);
          _.getFees(context);
         _.getShippingCarriors(context);
         _.getSellConditions(context);
        if(edit !=null) _.setInitalEditValues(product!);
      },
      builder: (_, vm, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vm.inputs == null
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return vm.inputs![i].options!.isEmpty
                            ? Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabelText(vm.inputs![i].classfield),
                                  OptionDropDownWidget(
                                      vm: vm,
                                      index: i,
                                      list: vm.newInputs[i].options,
                                      init: vm.initInputs[i]),
                                  heightSpace(10.h),
                                ],
                              );
                      },
                      itemCount: vm.initInputs.length,
                    ),
              heightSpace(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildLabelText('Weight(g)'),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildLabelText('Width(cm)'),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildLabelText('Height(cm)'),
                  )
                ],
              ),
              heightSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: RoundedStyledTextField(labelText: '', controller: vm.weightController,keyboardType: TextInputType.number,

                      )
                  ),
                  widthSpace(10.w),
                  Expanded(
                      flex: 1,
                      child: RoundedStyledTextField(labelText: '', controller: vm.widthController,keyboardType: TextInputType.number,

                      )
                  ),
                  widthSpace(10.w),
                  Expanded(
                      flex: 1,
                      child: RoundedStyledTextField(labelText: '', controller: vm.heightController,keyboardType: TextInputType.number,

                      )
                  ),
                ],
              ),
              heightSpace(10.h),
              _buildLabelText('Device Conditions'),
              heightSpace(10.h),
              /*vm.conditions.isEmpty
                  ? Container()
                  :*/ ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics:  BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return _buildChoiceWidget(vm.conditions[i].title);
                      },
                      itemCount: vm.conditions.length,
                    ),
              heightSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildLabelText('Price'),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildLabelText('Quantity'),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildLabelText('Bargainia Fee *'),
                  )
                ],
              ),
              heightSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: RoundedStyledTextField(labelText: '', controller: vm.priceController, keyboardType: TextInputType.number,

                      )
                  ),
                  widthSpace(10.w),
                  Expanded(
                      flex: 1,
                      child: RoundedStyledTextField(labelText: '', controller: vm.quantityController, keyboardType: TextInputType.number,

                      )
                  ),
                  widthSpace(10.w),
                  Expanded(
                      flex: 1,
                      child: RoundedStyledTextField(labelText: '', controller: vm.feebarginatController,)
                  ),
                ],
              ),
              heightSpace(10.h),
              _buildLabelText('Description'),
              heightSpace(10.h),
              RoundedStyledTextField(
                labelText: '', controller: vm.descriptionController,
              ),
              heightSpace(20.h),
              _buildLabelText('Carriors'),
              vm.carriors == null
                  ? Container()
                  : CarriorDropDownWidget(
                  vm: vm,
                  list: vm.carriors, init: vm.carriors![0]),
              heightSpace(10.h),
              _buildLabelText(
                'Upload Photos',
              ),
              heightSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StyledButton(
                    function: () {
                       vm.selectImages();
                    },
                    child: semiBold14Text('Upload', color: whiteColor),
                    fillColor: secondaryColor,
                    width: 110.w,
                  ),
                  widthSpace(20.w),
                  vm.state==ViewState.Busy ? Center(
                    child: CircularProgressIndicator(color: secondaryColor,),
                  ):  StyledButton(
                    function: () {
                      if(edit!=null){
                        vm.updateProduct(context, product!.id);

                      }else{
                        vm.saveProduct(catId, context);
                      }
                    },
                    child: semiBold14Text('Add', color: whiteColor),
                    fillColor: primaryColor,
                    width: 110.w,
                  )
                ],
              ),
              heightSpace(60.h),
            ],
          ),
        );
      },
    );
  }

  _buildLabelText(text) {
    return RichText(
        text: TextSpan(
            text: '',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red),
            children: [
          TextSpan(
              text: text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: textColor,
              ))
        ]));
  }

  _buildChoiceWidget(text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: Colors.grey),
              color: whiteColor,
              shape: BoxShape.circle),
        ),
        widthSpace(10.w),
        bold16Text(text, color: textColor),
      ],
    ).onTap((){

    });
  }
}
