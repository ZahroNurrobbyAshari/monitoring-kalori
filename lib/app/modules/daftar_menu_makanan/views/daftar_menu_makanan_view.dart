// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/theme/appTheme.dart';
import '../../commons/navigation_drawer/views/navigation_drawer_view.dart';
import '../controllers/daftar_menu_makanan_controller.dart';

class DaftarMenuMakananView extends GetView<DaftarMenuMakananController> {
  const DaftarMenuMakananView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerView(),
        appBar: AppBar(
          title: Text('Daftar Menu Makanan'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 1.0],
                colors: [appThemeData.primaryColor, appThemeData.accentColor],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                  title: Text("Food Name"),
                  subtitle: Text(
                    "Kalori per 1 gram",
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
