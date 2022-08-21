import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../commons/navigation_drawer/views/navigation_drawer_view.dart';
import '../controllers/pengaturan_controller.dart';

class PengaturanView extends GetView<PengaturanController> {
  const PengaturanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerView(),
      appBar: AppBar(
        title: const Text('PengaturanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PengaturanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
