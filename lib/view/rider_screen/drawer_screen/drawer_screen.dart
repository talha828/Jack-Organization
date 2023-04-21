import 'dart:convert';
import 'dart:io';
import "package:path/path.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jack_delivery/model/drawer_model.dart';
import 'package:jack_delivery/view/rider_screen/about_us_screen/about_us_screen.dart';
import 'package:jack_delivery/view/rider_screen/notification_screen/notification_screen.dart';
import 'package:jack_delivery/view/rider_screen/wallet_screen/wallet_screen.dart';
import '../../../GetXModel/GetUserModel.dart';
import '../../../backend/organization_backend/auth.dart';
import '../../../component/constant/constant.dart';
import '../../../component/widgets/loading_indicator.dart';
import '../../../generated/assets.dart';
import '../../../model/userModel.dart';
import '../../common_screen/splash_screen/splash_screen.dart';
import 'package:http/http.dart' as http;
import "package:http_parser/http_parser.dart";

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final ImagePicker picker = ImagePicker();

  bool isLoading = false;
  GetStorage box = GetStorage();
  final user = Get.find<GetUserModel>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: InkWell(
              onTap: () => Get.back(),
              child: Image.asset(
                Assets.iconMenu,
                scale: 16,
                color: appRedColor,
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: width / 8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                  user.user!.value.user!.profilePhoto!)),
                        ),
                        InkWell(
                          onTap: () async {
                            XFile? image = await picker.pickImage(
                                source: ImageSource.gallery, imageQuality: 1);

                            if (image != null) {
                              await uploadImage(
                                  await File(image.path),
                                  user.user!.value.user!.token!,
                                  width,
                                  (bool value) =>
                                      setState(() => isLoading = value));
                            } else {
                              Get.snackbar(
                                  "Invalid Image", "Please select a file",
                                  margin: EdgeInsets.symmetric(
                                      vertical: width * 0.05,
                                      horizontal: width * 0.04));
                              Get.toNamed('/rider_main/');
                            }
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.add_a_photo,
                              color: appYellowColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.user.value.user!.organizationName!
                              .toUpperCase()!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.06),
                        ),
                        SizedBox(
                          height: width * 0.03,
                        ),
                        Text(
                          user.user.value.user!.mobile!,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.04),
                        ),
                      ],
                    ),
                    // IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: appYellowColor,size: width * 0.07,))
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Get.to(const WalletScreen());
                              break;
                            case 1:
                              Get.to(const NotificationScreen());
                              break;
                            case 2:
                              Get.to(const AboutUsScreen());
                              break;
                            case 3:
                              box.write("user_type", null);
                              box.write("email", null);
                              box.write("password", null);
                              Get.to(const SplashScreen());
                              break;
                          }
                        },
                        minVerticalPadding: 2,
                        // contentPadding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        title: Text(
                          list[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          list[index].icon,
                          color: appYellowColor,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                      );
                    },
                    itemCount: list.length),
              ),
            ],
          ),
        ),
        isLoading
            ? Positioned.fill(
                child: LoadingIndicator(),
              )
            : Container(),
      ],
    ));
  }

  Future<void> uploadImage(
      File imageFile, String token, double width, var setLoading) async {


    setLoading(true);
    var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
            'https://jackdelivery-full-backend.onrender.com/api/upload/profile-photo'));
    request.headers['authorization'] =
    'Bearer $token';

    var multipartFile = await http.MultipartFile.fromPath(
        'image', imageFile.path,
        filename: basename(imageFile.path),
        contentType: MediaType(
            'image', 'jpg')); // replace 'jpg' with the actual image format

    // request.fields['_id'] =
    //     'yourUserId'; // replace 'yourUserId' with the actual user ID
    request.files.add(multipartFile);

    var response = await request.send();
    if (response.statusCode == 200) {
      // do something

      GetStorage box= GetStorage();
      String? userType=box.read("user_type");
      String? email=box.read("email");
      String? password=box.read("password");
      var  response =await Auth.login(email: email!, password: password!);
      var data = jsonDecode(response.body);
      user.user.value = UserModel.fromJson(data);
      setLoading(false);

      Get.snackbar("Congratulation", "Order Accept Successfully",
          margin: EdgeInsets.symmetric(
              vertical: width * 0.05, horizontal: width * 0.04));


      Get.toNamed('/rider_main/');

    } else {

      setLoading(false);
      print('Image upload failed with status code ${response.statusCode}');
      print('Response body: ${await response.stream.bytesToString()}');

    }

  }

  List<DrawerModel> list = [
    DrawerModel(
      title: "wallet".tr,
      icon: Icons.account_balance_wallet,
    ),
    DrawerModel(
      title: "notification".tr,
      icon: Icons.notifications,
    ),
    DrawerModel(
      title: "about_us".tr,
      icon: Icons.info,
    ),
    DrawerModel(
      title: "logout".tr,
      icon: Icons.logout_rounded,
    ),
  ];
  // Future<void> uploadProfileImage(File imageFile) async {
  //
  //   if (response.statusCode == 200) {
  //     print('Profile picture updated');
  //   } else {
  //     print('Error updating profile picture');
  //   }
  // }
}
