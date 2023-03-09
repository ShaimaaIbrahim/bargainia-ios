
import 'package:bargina/screens/main/search/search_results_page.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../screens/main/search/viewmodel/search_viewmodel.dart';
import '../utils/colors.dart';
class SearchTextField extends StatelessWidget {

  final double width;
  final Color color;
  final SearchViewModel? vm;


  const SearchTextField({Key? key, required this.width, required this.color, this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width:  width,
      child: TextField(
        onChanged: (val) {
             vm!.searchProducts(context, val);
        },
        onTap: () {},
        onSubmitted: (val){
            vm!.saveSearch(val);
           // Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchResultsPage(
           //   products : vm!.products
           // )));
        },
        decoration: InputDecoration(
            hintText: 'search',
            hintStyle: TextStyle(color: additionColor, fontSize: 16),
            prefixIcon: Icon(Icons.search, color: lightGrey,),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.r)),
            suffixIcon: const Icon(Icons.close).onTap((){

            }),
            focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30.r)),
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            fillColor: color,
            filled: true),
      ),
    );
  }
}