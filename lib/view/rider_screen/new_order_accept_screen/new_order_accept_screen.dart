import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/model/get_order_model.dart';
import 'package:http/http.dart' as http;

import '../../../GetXModel/GetUserModel.dart';
import '../../../component/widgets/loading_indicator.dart';

class NewOrderAcceptScreen extends StatefulWidget {
  const NewOrderAcceptScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderAcceptScreen> createState() => _NewOrderAcceptScreenState();
}

class _NewOrderAcceptScreenState extends State<NewOrderAcceptScreen> {
  bool isLoading = false;

  setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
  Data? data;
  Set<Marker> markers = {};
  void _onMapCreated(GoogleMapController controller) async {
    // Data data = Get.arguments as Data;
    await Geolocator.requestPermission();
    Position location = await Geolocator.getCurrentPosition();
    setState(() {
      markers.add(
        Marker(
            markerId: const MarkerId('5'),
            position: LatLng(data!.location!.coordinates!.first,
                data!.location!.coordinates![1]),
            infoWindow: const InfoWindow(
              title: 'My Location',
            )),
      );
      _controller.complete(controller);
    });
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final user = Get.find<GetUserModel>();
  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.844780, 67.081071),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
     data = Get.arguments as Data;
    markers.add(Marker(
        markerId: const MarkerId('1'),
        infoWindow: InfoWindow(title: data!.recieverName),
        position: LatLng(
            data!.location!.coordinates![0], data!.location!.coordinates![1])));

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: appBlueColor,
                ),
              ),
              title: const Text("New Order"),
              centerTitle: true,
            ),
            bottomNavigationBar: Container(
              height: width * 0.3,
              color: appBlackColor,
              padding: EdgeInsets.symmetric(
                  vertical: width * 0.04, horizontal: width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "You will recieve",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04),
                      ),
                      Row(
                        children: [
                          Text(
                            "10",
                            style: TextStyle(
                                color: appYellowColor,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.04),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            "BHD",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.04),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        setLoading(true);
                        final Uri uri = Uri.parse(
                            'https://jackdelivery-full-backend.onrender.com/api/update/${data!.sId}');
                        final Map<String, dynamic> orderData = {
                          'Orderstatus': 'Delivered'
                        };

                        try {
                          final response = await http.put(uri,
                              headers: {
                                'Authorization':
                                    'Bearer ${user.user!.value.user!.token}'
                              },
                              body: orderData);
                          var dd = jsonDecode(response.body);
                          print(dd.toString());
                          if (response.statusCode == 200) {
                            setLoading(false);
                            Get.snackbar(
                                "Congratulation", "Order Accept Successfully",
                                margin: EdgeInsets.symmetric(
                                    vertical: width * 0.05,
                                    horizontal: width * 0.04));
                            Get.toNamed('/rider_main/');
                          } else {
                            setLoading(false);
                            Get.snackbar("Something went wrong",
                                "Order Can`t be Updated",
                                margin: EdgeInsets.symmetric(
                                    vertical: width * 0.05,
                                    horizontal: width * 0.04));
                          }
                        } catch (error) {
                          setLoading(false);
                          Get.snackbar(
                              "Something went wrong", "Order Can`t be Updated",
                              margin: EdgeInsets.symmetric(
                                  vertical: width * 0.05,
                                  horizontal: width * 0.04));
                        }
                      },
                      child: const Text("Accept"))
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.04, horizontal: width * 0.04),
                child: Column(
                  children: [
                    SizedBox(
                      height: width * 0.7,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GoogleMap(
                          markers: markers,
                          mapType: MapType.normal,
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: _kGooglePlex,
                          zoomControlsEnabled: false,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.05),
                            ),
                            InkWell(
                              onTap: () => Get.back(),
                              child: Text(
                                "Decline",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.05),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: width * 0.03,
                        ),
                        Theme(
                          data: ThemeData(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(primary: appRedColor)),
                          child: Stepper(
                            controlsBuilder: (context, onStepContinue) {
                              return const SizedBox();
                            },
                            steps: [
                              Step(
                                  isActive: true,
                                  title: const Text("Pickup location"),
                                  subtitle: Text(data!.nearestLandmark!),
                                  content: Container()),
                              Step(
                                  isActive: true,
                                  title: const Text("Dropoff location"),
                                  subtitle: Text(data!.address!),
                                  content: Container()),
                            ],
                          ),
                        )
                      ],
                    ),
                    ListTile(
                      title: const Text("Estimated delivery time"),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Icons.timelapse,
                            color: appRedColor,
                          ),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          const Text("30 mints")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          isLoading
              ? Positioned.fill(
                  child: LoadingIndicator(),
                )
              : Container(),
        ],
      ),
    );
  }
}
