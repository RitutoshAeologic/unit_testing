import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color_constant.dart';
import '../../../core/constant/font_constant.dart';
import '../../../core/constant/route_constant.dart';
import '../home_page/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 80),
          height: MediaQuery.of(context).size.height*0.091,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.appBarColor,
                  AppColors.signUpColor,
                  AppColors.appLoginTextColor,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textFieldBorder,
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 5),
                )
              ]),
          child: MaterialButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(20.0))),
            child: const Text(AppStrings.homePage,
              style: TextStyle(color: AppColors.white,fontSize: 22,fontStyle: FontStyle.italic),
            ),
            onPressed: (){
              Navigator.pushNamed(context,
                  Routes.homeScreen);
            }
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
           Center(
            child: Text('Successfully Login'),
          )
        ],
      ),
    );
  }
}
