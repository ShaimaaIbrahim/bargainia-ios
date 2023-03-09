import 'package:bargina/screens/auth/data/products/all_categories_model.dart';
import 'package:bargina/screens/main/BaseViewModel.dart';
import 'package:bargina/screens/main/cart/model/cart_entity.dart';
import 'package:bargina/screens/main/home/final_add_product.dart';
import 'package:bargina/screens/main/model/condition_model.dart';
import 'package:bargina/screens/main/model/review_model.dart';
import 'package:bargina/screens/main/search/search_results_page.dart';
import 'package:bargina/services/db_services.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/services/shared_prefrence_services.dart';
import 'package:bargina/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Locator.dart';
import '../../../../enums/ScreenState.dart';
import '../../../../models/Resources.dart';
import '../../../../models/Status.dart';
import '../../../../services/api_services.dart';
import '../../../../utils/common_functions.dart';
import '../../../auth/data/products/Product_details.dart';
import '../../../auth/model/Fee_model.dart';
import '../../account/model/my_product_model.dart';
import '../../model/sell_sub_category_model.dart';
import 'package:image_picker/image_picker.dart';
import '../../model/sub_category_product_model.dart';


class HomeViewModel extends BaseViewModel{


  final ApiService _apiService = ApiService();
  FeeModel? fees;


  int count = 0;
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  List<dynamic>? like4CardCatProducts;
  bool newProduct = true;

  setNewPage(){
    newProduct = true;
    notifyListeners();
  }
  setUsedPage(){
    newProduct = false;
    notifyListeners();
  }

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
      notifyListeners();
    }
    print("Image List Length:" + imageFileList!.length.toString());
  }

    getCartItemsCount() async{
   var items=  await locator<DbServices>().retrieveCartItems();
   count = items.length;
   notifyListeners();
  }

  bool visible = false;

  String selectedPrice ="";
  String selectedDate ="";

  int quantity =1;


  int currentPage = 0;

  changeCurrentPage(i) {
    currentPage = i;
    notifyListeners();
  }

  Map<String, String > mapInputs = {};
  SubCategoryProductModel? subcategoryProductModel;

  List<bool> checkCategory=[];
  List<dynamic>? categories;

  List<dynamic>? subcategoryProducts;

  List<String> prices = ['lowest', 'high'];
  List<String> dates =['newest', 'old'];

  List<bool> checkPrices = [false, false];
  List<bool> checkDates  =  [false, false];

  //add review page variables
  double currentRating =0.0;
  TextEditingController review = TextEditingController();

  dynamic selectedCity;
  dynamic selectedCategory;
  Color selectedColor = blackColor;
  int selectedIndex=0;
  List<dynamic>? inputs;
  List<dynamic> newInputs=[];
  List<dynamic> conditions =[];
  List<dynamic>? reviews;
  List<dynamic>? like4CardCategories;
  dynamic selectedCondition;
  dynamic input;
  List<dynamic>? carriors;
  dynamic carrior;
  List<dynamic>? products;
  List<dynamic>? filters;
  List<dynamic>? sellsubcat;
  List<dynamic>? cities;
  ProductDetails? productDetails;


  var initInputs = [];


  List<dynamic> durations =[];
  dynamic selectedDuration = '';

  TextEditingController weightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();


  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController feebarginatController = TextEditingController();
  TextEditingController countryFeeController = TextEditingController();

  TextEditingController totalController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  TextEditingController headlineController = TextEditingController();

  Future<void> getCategories(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getAllCategories();
    switch (response.status) {
      case Status.SUCCESS:
        categories = response.data!;
        categories!.forEach((element) {
          checkCategory.add(false);
        });
        break;
      case Status.ERROR:
        categories = [];
        //showSnackBar(response.errorMessage!, context);
        break;
    }
    setState(ViewState.Idle);
  }


  Future<void> getAllCities(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getAllCities();
    switch (response.status) {
      case Status.SUCCESS:
        cities = response.data!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
        //showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  Future<void> getProductsByCityId(BuildContext context , id) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getProductsByCityId(id);
    switch (response.status) {
      case Status.SUCCESS:
          products = response.data!;
          notifyListeners();
        break;
      case Status.ERROR:
        //showSnackBar(response.errorMessage!, context);
        break;
    }
   // setState(ViewState.Idle);
  }

  Future<void> getProductsByCategoryId(BuildContext context,int id) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getProductsByCategoryId(id);
    switch (response.status) {
      case Status.SUCCESS:
        products = response.data!;
        break;
      case Status.ERROR:
        //showSnackBar(response.errorMessage!, context);
        break;
    }
    setState(ViewState.Idle);
  }

  Future<void> getSubCatProductsByCategoryId(BuildContext context,int id) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getSellCategoriesProducts(id);
    switch (response.status) {
      case Status.SUCCESS:
        products = response.data!;
        break;
      case Status.ERROR:
       // showSnackBar(response.errorMessage!, context);
        break;
    }
    setState(ViewState.Idle);
  }

  Future<void> getProductDetails(BuildContext context,int id) async{
    setState(ViewState.Busy);
    Resource<ProductDetails> response = await _apiService.getProductDetails(id);
    switch (response.status) {
      case Status.SUCCESS:
        productDetails = response.data!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
       // showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  void setClick(int i, BuildContext context) {
    selectedIndex =i;
    selectedCity = cities![selectedIndex];
     getProductsByCityId(context, selectedCity.id);
     notifyListeners();
  }

  void setVisible() {
    visible = !visible;
    notifyListeners();
  }

  Future<void> applyFilters(BuildContext context) async{
      setState(ViewState.Busy);
      Resource<List<dynamic>> response = await _apiService.filterProducts(selectedCategory.id, selectedDate, selectedPrice);
    switch (response.status) {
      case Status.SUCCESS:
        products = response.data!;
        setVisible();
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  increseQuantity(){
    quantity++;
    notifyListeners();
  }

  decreseQuantity(){
     if(quantity< 2) return;
       quantity--;
     notifyListeners();
  }

   selectCategory(int index) {
    for (int i=0; i< checkCategory.length ; i++) {
      if(index!=i) checkCategory[i]= false;
    }
    checkCategory[index]= !checkCategory[index];
    selectedCategory = categories![index];
    notifyListeners();
  }


  void selectPrice(int index) {
    for (int i=0; i< checkPrices.length ; i++) {
      if(index!=i) checkPrices[i]= false;
    }
    checkPrices[index]= !checkPrices[index];
    selectedPrice = prices[index];
    notifyListeners();
  }


  void selectDate(int index) {
    for (int i=0; i< checkDates.length ; i++) {
      if(index!=i) checkDates[i]= false;
    }
    checkDates[index]= !checkDates[index];
    selectedDate = dates[index];
    notifyListeners();
  }

  void getSellCategories(BuildContext context) async{
      setState(ViewState.Busy);
      Resource<List<dynamic>> response = await _apiService.getSellCategories();
      switch (response.status) {
        case Status.SUCCESS:
          products = response.data!;
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          setState(ViewState.Idle);
         // showSnackBar(response.errorMessage!, context);
          break;
      }
  }

  void getSellSubCategories(BuildContext context, int id) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getSellSubCategories(id);
    switch (response.status) {
      case Status.SUCCESS:
        sellsubcat = response.data!;
        break;
      case Status.ERROR:
        //showSnackBar(response.errorMessage!, context);
        break;
    }
    setState(ViewState.Idle);
  }

  void getCategoryInputs(BuildContext context, int id,product) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getCategoryInputs(id);
    switch (response.status) {
      case Status.SUCCESS:
        inputs = response.data!;

        if(product==null){
          for(int i= 0; i< inputs!.length; i++){
            if(inputs![i].options.isNotEmpty){
              initInputs.add(inputs![i].options![0].valueEn);
              newInputs = inputs!;
              mapInputs.putIfAbsent(inputs![i].classfield, () => inputs![i].options![0].valueEn);
            }
          }
        }else{
          for (var element in inputs!) {
            for(int i=0 ;i< product!.productInputs!.length ; i++){
              if(element.id == product.productInputs![i].inputId){
                for(int j =0; j< element.options.length; j++){
                  if(element.options[j].id.toString() == product.productInputs![i].value){
                    initInputs.add(element.options[j].valueEn);
                    newInputs.add(element);
                    mapInputs.putIfAbsent(element.classfield, () => element.options![0].valueEn);
                  }
                }
              }
            }
          }
        }
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        //showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  void getShippingCarriors(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getShippingCarriors();
    switch (response.status) {
      case Status.SUCCESS:
        carriors = response.data!;
        carrior = carriors![0];
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        //showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  void getSellCategoriesProducts(BuildContext context, id) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getSellCategoriesProducts(id);
    switch (response.status) {
      case Status.SUCCESS:
        subcategoryProducts = response.data;
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
    setState(ViewState.Idle);
  }

  void getSellConditions(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getSellConditions();
    switch (response.status) {
      case Status.SUCCESS:
        conditions = response.data!;
        selectedCondition = conditions[0];
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }

  }

  void getDurations(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getDurations();
    switch (response.status) {
      case Status.SUCCESS:
        durations = response.data!;
        selectedDuration = durations[0];
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  void addToCart(BuildContext context, ProductDetails productDetails, quantity) async{
    setState(ViewState.Busy);

    locator<DbServices>().insertCartItem(CartEntity(name: productDetails.title,
        quantity: quantity, id: productDetails.id, mainImg: productDetails.image,
        price: productDetails.price.toString(),
     priceAfterDiscount: productDetails.priceDiscount.toString()));

    List<CartEntity> carts = await  locator<DbServices>().retrieveCartItems();

    print('cartItems are ${carts.length}');

    setState(ViewState.Idle);
    showSnackBar('added successfully', context);
  }

  void setInitInput(newValue, index) {
    initInputs[index] = newValue;
    mapInputs[inputs![index].classfield] = newValue;
    notifyListeners();
    print('mapInputs=== ${mapInputs}');
    print('newValue=== ${newValue}');

  }

  saveProduct(BuildContext context, catId) async{
    setState(ViewState.Busy);
//imageFileList!.isEmpty || heightController.text.isEmpty || weightController.text.isEmpty || widthController.text.isEmpty ||
    if(priceController.text.isEmpty){

      showSnackBar('do not leave price empty', context);

    }else{
      Resource response = await _apiService.saveProducts(catId,heightController.text,
          weightController.text, widthController.text,
          selectedCondition.id , priceController.text, carrior.id,
          descriptionController.text, quantityController.text, mapInputs,
          imageFileList!, selectedDuration.title, headlineController.text);
      switch (response.status) {
        case Status.SUCCESS:
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> FinalAddProductScreen(code: response.data)));
          break;
        case Status.ERROR:
          showSnackBar(response.errorMessage!, context);
          break;
      }
      setState(ViewState.Idle);
    }

  }



  updateProduct(BuildContext context, id) async{
    setState(ViewState.Busy);

    Resource response = await _apiService.updateProducts(heightController.text,
        weightController.text, widthController.text,
        selectedCondition.id , priceController.text, carrior.id,
        descriptionController.text, quantityController.text, mapInputs, id);
    switch (response.status) {
      case Status.SUCCESS:
          locator<NavigationService>().goBack();
        //Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> FinalAddProductScreen(code: response.data)));
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
    setState(ViewState.Idle);
  }


  Future<void> getLike4CardsCategoriesProducts(BuildContext context, id) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getLike4CardPrdouctsByCategory(id);
    switch (response.status) {
      case Status.SUCCESS:
        like4CardCatProducts = response.data!;
        break;
      case Status.ERROR:
        like4CardCatProducts = [];
       // showSnackBar(response.errorMessage!, context);
        break;
    }
    setState(ViewState.Idle);
  }

  void setCarriorId(newValue) {
    this.carrior = newValue;
    notifyListeners();
  }

  void setDuration(newValue) {
    this.selectedDuration = newValue;
    notifyListeners();
  }

  void setRating(double rating) {
    currentRating = rating;
    notifyListeners();
  }


  Future<void> addREview(BuildContext context, id) async{
    print('add produd id $id');
    setState(ViewState.Busy);
    locator<SharedPreferencesServices>().getUserAuthInfo().then((value) async{
      Resource<dynamic> response = await _apiService.addReview(productDetails!.id, '${value.user!.firstName} ${value.user!.lastName}' ,review.text, currentRating.toString() );
      switch (response.status) {
        case Status.SUCCESS:
          locator<NavigationService>().goBack();
          break;
        case Status.ERROR:
          break;
      }
      setState(ViewState.Idle);
    });

  }

  Future<void> getProducReviews(BuildContext context, id) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.showProductReviews(id);
    switch (response.status) {
      case Status.SUCCESS:
        reviews= response.data;
        break;
      case Status.ERROR:
        reviews =[];
        break;
    }
    setState(ViewState.Idle);
  }

  void getFees(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<FeeModel> response = await _apiService.getFees();
    switch (response.status) {
      case Status.SUCCESS:
        fees = response.data;
        feebarginatController.text = fees!.barginiaFee!;
        countryFeeController.text = fees!.fee!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        feebarginatController.text = '';
        break;
    }
   // setState(ViewState.Idle);
  }

  //set initial values for modified product--------------------------
  void setInitalEditValues(MyProductModel? productsModel) {
    //set initial weight, height, width for product
     weightController.text = productsModel!.weight ?? '0';
     widthController.text = productsModel.width ?? '0';
     heightController.text = productsModel.height ?? '0';

     //set initial price and quantity for product
     priceController.text = productsModel.total ==null  ? '0.0' : productsModel.total.toString();
     quantityController.text = productsModel.quantatity ==null  ? '0' : productsModel.quantatity.toString();

     //set initial description for product
     descriptionController.text = productsModel.description ==null  ? 'no description' : productsModel.description.toString();

     print('staaaaaaaaaaaaaaaaaaaatt');

     // set initial inputs for this product

     print('enddddddddddddddddddddddddddddddd');

    ///////////////////////////////////////////////////
  }

  void increaseCount() {
    count = count+ 1;
    notifyListeners();
  }

  void calculateTotal(_) {
    totalController.text = (int.parse(_) + int.parse(countryFeeController.text) + int.parse(feebarginatController.text)).toString();
    notifyListeners();
  }

}
