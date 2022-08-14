import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kalori_dikonsumsi_controller.dart';

class KaloriDikonsumsiView extends GetView<KaloriDikonsumsiController> {
  const KaloriDikonsumsiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KaloriDikonsumsiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KaloriDikonsumsiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}