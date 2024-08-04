import 'package:local_harvest/app/helper/all_imports.dart';

class FarmerHomeController extends CommonController {
  TextEditingController searchController = TextEditingController();
  List<Map> products = [];
  List<Map> filteredData = [];
  List categories = [
    AppStrings.products,
    AppStrings.farmers,
  ];

  void getProducts() async {
    filteredData = (products)
        .where(
          (element) => (element["title"])
              .toString()
              .toLowerCase()
              .startsWith(searchController.text.toLowerCase()),
        )
        .toList();

    update();
  }

  void initData() async {
    products = await DatabaseHelper.getProducts(
      farmerId: userDetails["uid"],
    );
    getProducts();
    update();
  }

  onChange(String value) {
    getProducts();
  }

  @override
  void onInit() {
    super.onInit();

    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
