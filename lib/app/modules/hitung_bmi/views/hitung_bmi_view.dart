// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:monitoring_kalori/app/data/theme/appTheme.dart';
import 'package:select_form_field/select_form_field.dart';

import '../controllers/hitung_bmi_controller.dart';

class HitungBmiView extends GetView<HitungBmiController> {
  const HitungBmiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final List<Map<String, dynamic>> _items = [
      {
        'value': '1',
        'label': 'Man',
        'icon': Icon(Icons.man),
      },
      {
        'value': '2',
        'label': 'Woman',
        'icon': Icon(Icons.woman),
      },
    ];

    return Scaffold(
        backgroundColor: appThemeData.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                  child: Container(
                child: Column(children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Count BMI first to continue",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Form(
                      key: controller.bmiFormKey,
                      child: Column(
                        children: [
                          heightField(),
                          weightField(),
                          ageField(),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text('gender'),
                                ),
                                radioMale(),
                                radioFemale(),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            decoration:
                                FormHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: FormHelper().buttonStyle(),
                              onPressed: () {
                                controller.calcBMI();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 40),
                                child: Text(
                                  'Submit'.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                ]),
              ))
            ],
          ),
        ));
  }

  Widget heightField() {
    return TextFormField(
      controller: controller.heightc,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        LengthLimitingTextInputFormatter(3),
      ],
      decoration: FormHelper().textInputDecoration(
        'height (cm)',
        'enter your height',
      ),
      onSaved: (value) => controller.height = int.parse(value!),
      keyboardType: TextInputType.number,
      validator: (value) => controller.Validates(value!),
    );
  }

  Widget weightField() {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(3),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      controller: controller.weightc,
      decoration: FormHelper().textInputDecoration(
        'weight(kg)',
        'enter your weight',
      ),
      onSaved: (value) => controller.weight = int.parse(value!),
      keyboardType: TextInputType.number,
      validator: (value) => controller.Validates(value!),
    );
  }

  Widget ageField() {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        LengthLimitingTextInputFormatter(2),
      ],
      controller: controller.agec,
      decoration: FormHelper().textInputDecoration(
        'Umur',
        'enter your umur',
      ),
      onSaved: (value) => controller.age = int.parse(value!),
      keyboardType: TextInputType.number,
      validator: (value) => controller.Validates(value!),
    );
  }

  Widget radioMale() {
    return Row(
      children: [
        Obx(() => Radio(
              value: "Male",
              groupValue: controller.selectedGender.value,
              onChanged: (value) {
                controller.onChangeGender(value);
              },
              activeColor: appThemeData.accentColor,
              fillColor: MaterialStateProperty.all(appThemeData.primaryColor),
            )),
        Text("Male"),
      ],
    );
  }

  Widget radioFemale() {
    return Row(
      children: [
        Obx(() => Radio(
              value: "Female",
              groupValue: controller.selectedGender.value,
              onChanged: (value) {
                controller.onChangeGender(value);
              },
              activeColor: appThemeData.accentColor,
              fillColor: MaterialStateProperty.all(appThemeData.primaryColor),
            )),
        Text("Female"),
      ],
    );
  }
}
