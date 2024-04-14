import 'package:connectivity_stream/app/modules/network/controllers/network_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  NetworkController _controller = Get.find<NetworkController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: Obx(
        () => Text(
          _controller.connectionStatus.value.toString(),
          style: const TextStyle(fontSize: 20),
        ),
      )),
    );
  }
}
