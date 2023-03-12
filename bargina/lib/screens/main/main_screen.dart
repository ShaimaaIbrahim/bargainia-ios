import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/screens/main/cart/cart_screen.dart';
import 'package:bargina/screens/main/home/home_Screen.dart';
import 'package:bargina/screens/main/viewmodel/main_viewmodel.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/circle_image.dart';
import 'package:bargina/widgets/search_textfield.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Locator.dart';
import '../../services/shared_prefrence_services.dart';
import '../../utils/texts.dart';
import '../auth/model/login_model.dart';
import 'account/account_screen.dart';
import 'category/category_screen.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  LoginModel? user;
  bool _isLogin = false;


  // List pages = [
  //    HomeScreen(viewModel: viewModel),
  //    CategoryScreen(),
  //    CartScreen(),
  //    AccountScreen(),
  // ];

  @override
  Widget build(BuildContext context) {

    return BaseScreen<MainViewModel>(
      onModelReady: (_) async{
         _.getMyAccount(context);
           _checkLogin();
      },
      builder: (_, vm, child){
        var title = 'Discover';
        switch(vm.current){
          case 0:
            title = 'Discover';
            break;
          case 1:
            title = 'Category';
            break;
          case 2:
            title = 'Cart';
            break;
          case 3:
            title = 'Profile';
            break;
        }
        return  Scaffold(
          drawer:  SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Drawer(
              child: ListView(
                children: [
                  vm.myAccountModel == null ? Container():  DrawerHeader(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleImage(url: 'https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?t=st=1649818795~exp=1649819395~hmac=b6f10b713a9d2e05b914d4567d44bd5db0e81c2997248bd91ad56609a77095c2', radius: 40.r,),
                          widthSpace(17.w),
                          vm.myAccountModel !=null ?  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              bold20Text('${vm.myAccountModel!.firstName ?? ''}  ${vm.myAccountModel!.lastName ?? ''}'),
                              bold9Text('${vm.myAccountModel!.email}')
                            ],
                          ): Container()
                        ],
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearchTextField(width: 265.w, color: HexColor('#969CA2')),
                        heightSpace(25.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/account.png', ),
                            widthSpace(12.w),
                            med14Text('Account', color:HexColor('#1E272E') ),
                            const Spacer(),
                            Image.asset('assets/icons/next.png', ),
                          ],
                        ).onTap((){
                          locator<NavigationService>().navigateTo(RouteName.MyAccount);
                        }),
                        heightSpace(10.h),
                        Divider( height: 2.h, color: Colors.grey[500],),
                        heightSpace(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/support.png', ),
                            widthSpace(12.w),
                            med14Text('Support', color: HexColor('#1E272E')),
                            const Spacer(),
                            Image.asset('assets/icons/next.png', ),

                          ],
                        ).onTap((){
                          locator<NavigationService>().navigateTo(RouteName.Support);

                        }),
                        heightSpace(10.h),
                        Divider( height: 2.h, color: Colors.grey[500],),
                        heightSpace(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/Language_Icon.png', ),
                            widthSpace(12.w),
                            med14Text('Language', color: HexColor('#1E272E')),
                            Spacer(),
                            Row(
                              children: [
                                med14Text('English', color: HexColor('#1E272E')),
                                widthSpace(5.w),
                                Image.asset('assets/icons/next.png', ),
                              ],
                            ),
                          ],
                        ).onTap((){
                          locator<NavigationService>().navigateTo(RouteName.LangPage);

                        }),
                        heightSpace(10.h),
                        Divider( height: 2.h, color: Colors.grey[500],),
                        heightSpace(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/share.png', ),
                            widthSpace(12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                med14Text('Invite your friends', color: HexColor('#1E272E')),
                                bold9Text('Share Baragainia App with your friends!', color: Colors.grey)
                              ],
                            ),
                            Spacer(),
                            Image.asset('assets/icons/next.png', ),
                          ],
                        ).onTap((){
                          locator<NavigationService>().navigateTo(RouteName.LangPage);

                        }),
                        heightSpace(10.h),
                        Divider( height: 2.h, color: Colors.grey[500],),
                        heightSpace(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Image.asset('assets/icons/About_Icon.png', ),
                            widthSpace(12.w),
                            med14Text('About Baragainia App.', color: HexColor('#1E272E')),
                            Spacer(),
                            Image.asset('assets/icons/next.png', ),

                          ],
                        ).onTap((){
                          locator<NavigationService>().navigateTo(RouteName.AboutApp);

                        }),
                        heightSpace(10.h),
                        Divider( height: 2.h, color: Colors.grey[500],),
                        heightSpace(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Image.asset('assets/icons/Terms_Icon.png', ),
                            widthSpace(12.w),
                            med14Text('Terms and Condition', color: HexColor('#1E272E')),
                            Spacer(),
                            Image.asset('assets/icons/next.png', ),

                          ],
                        ).onTap((){
                          locator<NavigationService>().navigateTo(RouteName.TermsConditions);

                        }),
                        heightSpace(50.h),
                        _isLogin ? StyledButton(function: (){
                             locator<AccountViewModel>().logout(context);
                        },  fillColor: secondaryColor, radius: true, child: bold16Text('LOGOUT', color: whiteColor),) : Container()
                        //  Divider( height: 2.h, color: blackColor,),
                      ],
                    ),
                  )
                ],
              ),),
          ),
          appBar:AppBar(
            backgroundColor: primaryColor,
            elevation: 0.0,
            title: reg20Text(title, color: whiteColor),
            centerTitle: true,
            leading: Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: Image.asset('assets/icons/filter1.png', color: whiteColor, width: 10.w, height: 5.h,).onTap((){
                    Scaffold.of(context).openDrawer();
                  }),
                );
              },
            ),
            actions: [
              Icon(Icons.search, color: whiteColor, size: 20.w,).onTap((){
                locator<NavigationService>().navigateTo(RouteName.SEARCH);
              })
            ],
          ),
          backgroundColor:  HexColor('#FFFFFF'),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: vm.current,
            onTap: (id)=> vm.setCurrent(id),
            selectedItemColor: secondaryColor,
            unselectedItemColor: secondaryColor,
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                label: tr('home'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label : tr('categories')),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart),
                  label : tr('cart')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: tr('profile'))
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              //  child: pages[vm.current]
              child: vm.current ==0 ? HomeScreen(viewModel: vm) : vm.current ==1 ? CategoryScreen(viewModel: vm,) : vm.current==2 ? CartScreen(viewModel: vm,) : AccountScreen(viewModel: vm,),

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
}

