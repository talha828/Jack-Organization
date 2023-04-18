import 'package:get/get.dart';

import '../model/add_order_details_model.dart';

class GetOrderDetailsModel extends GetxController{
  Rx<AddOrderDetails> order= AddOrderDetails().obs;
}