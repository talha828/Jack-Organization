import 'package:get/get.dart';

import '../model/userModel.dart';
class GetUserModel extends GetxController{
  Rx<UserModel> user = UserModel().obs;
}