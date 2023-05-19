import 'package:covid_19/services/model_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'predict_screen.dart';
bool isChecked = false;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 40.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Corona Virus Pandemic',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffa89250),
                      ),
                    ),
                    Text(
                      'Stay Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Stay Safe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 20.w,
                      height: 5.h,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: const Size(110, 40),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                        try {
                          ModelService service = ModelService();
                          await service.upload();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PredictScreen(),),);
                        } catch (e) {
                          error = e;
                        }
                      },
                      child: const Text(
                        'UPLOAD',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                    )
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/photo.png',
            height: 300.h,
            width: 180.w,
          ),
        ],
      ),
    );
  }
}

