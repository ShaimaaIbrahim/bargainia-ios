import 'dart:io';

import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/model/my_product_model.dart';
import 'package:bargina/screens/main/home/pages/add_new_product_page.dart';
import 'package:bargina/screens/main/home/pages/add_used_product_page.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/duration_dropdown_widget.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/option_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Locator.dart';
import '../../../enums/ScreenState.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/dropdown_widget.dart';
import '../../../widgets/rounded_textfield.dart';
import '../../../widgets/styled_button.dart';
import '../account/widgets/dropdown_cities_widget.dart';
import '../account/widgets/dropdown_countries_widget.dart';
import '../model/sub_category_product_model.dart';

class AddProductScreen extends StatelessWidget {
  final id;
  final catId;
  final SubCategoryProductModel? product;
  final bool? edit;
  final MyProductModel? myPoductModel;

  AddProductScreen(
      {Key? key,
      required this.id,
      required this.catId,
      this.product,
      this.myPoductModel,
      this.edit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return BaseScreen<HomeViewModel>(
      onModelReady: (_) {
        _.getCategoryInputs(context, catId, myPoductModel);
        _.getShippingCarriors(context);
        _.getSellConditions(context);
        _.getDurations(context);
        _.getFees(context);
      },
      builder: (_, vm, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: bold16Text('ADD PRODUCT', color: whiteColor),
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back_ios_rounded,
              color: whiteColor,
              size: 20.w,
            ).onTap(() {
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 19.w, right: 19.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  StyledButton(
                                    function: () {
                                      vm.setNewPage();
                                    },
                                    border: primaryColor,
                                    child: semiBold14Text('New Product',
                                        color: whiteColor),
                                    fillColor: primaryColor,
                                  ),
                                  Image.asset(
                                    'assets/images/poly.png',
                                    color: vm.newProduct !=true
                                        ? whiteColor
                                        : primaryColor,
                                    width: 50.w,
                                    height: 20.h,
                                  )
                                ],
                              )),
                          widthSpace(14.w),
                          Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  StyledButton(
                                    function: () {
                                      vm.setUsedPage();
                                    },
                                    border: secondaryColor,
                                    child: semiBold14Text('Used Product',
                                        color: whiteColor),
                                    fillColor: secondaryColor,
                                  ),
                                  Image.asset(
                                    'assets/images/poly.png',
                                    color:  vm.newProduct ==true
                                        ? whiteColor
                                        : secondaryColor,
                                    width: 50.w,
                                    height: 20.h,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    heightSpace(30.h),
                    Center(
                      child: normal20Text(
                          vm.newProduct == true
                              ? 'Add New Product'
                              : 'Add Used Product',
                          color: textColor),
                    ),
                    heightSpace(40.h),
                    Column(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _buildLabelText(
                                                vm.inputs![i].classfield),
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
                        _buildLabelText('Headline'),
                        heightSpace(10.h),
                        RoundedStyledTextField(
                          labelText: '',
                          controller: vm.headlineController,
                        ),
                        heightSpace(20.h),
                        _buildLabelText('Description'),
                        heightSpace(10.h),
                        RoundedStyledTextField(
                          labelText: '',
                          controller: vm.descriptionController,
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
                        heightSpace(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: RoundedStyledTextField(
                                  labelText: '',
                                  controller: vm.weightController,
                                  keyboardType: TextInputType.number,
                                )),
                            widthSpace(10.w),
                            Expanded(
                                flex: 1,
                                child: RoundedStyledTextField(
                                  labelText: '',
                                  controller: vm.widthController,
                                  keyboardType: TextInputType.number,
                                )),
                            widthSpace(10.w),
                            Expanded(
                                flex: 1,
                                child: RoundedStyledTextField(
                                  labelText: '',
                                  controller: vm.heightController,
                                  keyboardType: TextInputType.number,
                                )),
                          ],
                        ),
                        heightSpace(20.h),
                  //       _buildLabelText('Device Conditions'),
                  //       heightSpace(10.h),
                  //       /*vm.conditions.isEmpty
                  // ? Container()
                  // :*/
                  //       ListView.builder(
                  //         shrinkWrap: true,
                  //         scrollDirection: Axis.vertical,
                  //         physics: BouncingScrollPhysics(),
                  //         itemBuilder: (context, i) {
                  //           return _buildChoiceWidget(vm.conditions[i].title);
                  //         },
                  //         itemCount: vm.conditions.length,
                  //       ),
                  //       heightSpace(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: _buildLabelText('Price'),
                            ),
                            Visibility(
                              visible:  vm.newProduct == true ? true: false,
                              child: Expanded(
                                flex: 1,
                                child: _buildLabelText('Country Fee *'),
                              ),
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
                                child: RoundedStyledTextField(
                                  labelText: '',
                                  controller: vm.priceController,
                                  keyboardType: TextInputType.number,
                                  onChange: (_){
                                    vm.calculateTotal(_);
                                  },
                                )),
                            widthSpace(10.w),
                            Visibility(
                              visible:  vm.newProduct == true ? true: false,
                              child: Expanded(
                                  flex: 1,
                                  child:  RoundedStyledTextField(
                                      labelText: '',
                                      controller: vm.feebarginatController,
                                      readOnly: true),)),
                            widthSpace(10.w),
                            Expanded(
                                flex: 1,
                                child: RoundedStyledTextField(
                                    labelText: 'TotalPrice',
                                    controller: vm.countryFeeController,
                                    readOnly: true),),
                          ],
                        ),
                        heightSpace(20.h),
                        Row(
                          children: [
                            Text('='),
                            widthSpace(10.w),
                            RoundedStyledTextField(
                                labelText: '',
                                width: 150.w,
                                controller: vm.totalController,
                                readOnly: true ),
                          ],
                        ),
                        heightSpace(20.h),
                        _buildLabelText('Quantity'),
                        heightSpace(10.h),
                        RoundedStyledTextField(
                            labelText: '',
                            controller: vm.quantityController,
                            keyboardType: TextInputType.number),
                        heightSpace(20.h),
                        _buildLabelText('Carriors'),
                        vm.carriors == null
                            ? Container()
                            : CarriorDropDownWidget(
                                vm: vm,
                                list: vm.carriors,
                                init: vm.carriors![0]),
                        heightSpace(20.h),
                       // _buildLabelText('Duration of product appearance'),
                       // heightSpace(10.h),
                    //  vm.durations==null ? Container():  DurationDropDownWidget(list: vm.durations, init: vm.selectedDuration, vm: vm),
                      //  heightSpace(20.h),
                        vm.imageFileList !=null && vm.imageFileList!.isNotEmpty ?  _buildImageList(vm.imageFileList): Container(),
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
                              child:
                                  semiBold14Text('Upload', color: whiteColor),
                              fillColor: secondaryColor,
                              width: 110.w,
                            ),
                            widthSpace(20.w),
                            vm.state == ViewState.Busy
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: secondaryColor,
                                    ),
                                  )
                                : StyledButton(
                                    function: () {
                                      if (myPoductModel != null) {
                                        vm.updateProduct(context, myPoductModel!.id);
                                      } else {
                                        vm.saveProduct(context, catId);
                                      }
                                    },
                                    child: semiBold14Text('Add',
                                        color: whiteColor),
                                    fillColor: primaryColor,
                                    width: 110.w,
                                  )
                          ],
                        ),
                        heightSpace(60.h),
                      ],
                    )
                    // SingleChildScrollView(
                    //   child: SizedBox(
                    //     height: 500.h,
                    //     child: PageView(
                    //       children: [
                    //         AddUsedProductPage(catId: catId, product: product , edit: edit,),
                    //         AddNewProductPage(catId: catId, product: product, edit: edit,),
                    //
                    //       ],
                    //       physics:  BouncingScrollPhysics(),
                    //       scrollDirection: Axis.horizontal,
                    //       controller: controller,
                    //       onPageChanged: (num) {
                    //         vm.changeCurrentPage(num);
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _buildImageList(images){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Container(
                  height: 50.h,
                  width: 100.w,
                  child: Image.file(File(images[i].path))
              );
            },
            itemCount: images.length,
          ),
        ),
        heightSpace(20.h)
      ],
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
    ).onTap(() {});
  }

  // _buildContainerWidget(text){
  //   return Container(
  //     width: 150.w,
  //      height: 44.h,
  //     decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey, width: 1.w),
  //         borderRadius: BorderRadius.all(Radius.circular(5.w))
  //     ),
  //     child: Padding(
  //       padding: EdgeInsets.only(left: 12.w, top: 14.h, bottom: 14.h, right: 12.w),
  //       child: bold14Text(text)
  //     ),
  //   );
  // }
}
