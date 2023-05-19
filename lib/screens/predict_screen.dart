import 'dart:io';
import 'package:covid_19/services/model_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'image_pick.dart';

class PredictScreen extends StatelessWidget {
  PredictScreen({Key? key}) : super(key: key);
  final ModelService service = ModelService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0.0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 50,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 20.w,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ' $resultStatusVgg',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  ' prediction : $resultProbVgg %',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Image.file(
                File(
                  '$imagePath',
                ),
                height: 500.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
