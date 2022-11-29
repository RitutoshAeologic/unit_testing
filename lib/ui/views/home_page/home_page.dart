import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unit_testing/ui/views/sign_in_page/sign_in_page.dart';
import 'package:unit_testing/ui/widgets/text_button_widget.dart';

import '../../../core/constant/color_constant.dart';
import '../../../core/constant/font_constant.dart';
import '../../../core/constant/icon_constant.dart';
import '../../../core/constant/route_constant.dart';
import '../sign_up_page/sign_up_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(AppStrings.appTitleText),
          backgroundColor: AppColors.appBarColor,
          centerTitle: true

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Container(
            height: MediaQuery.of(context).size.height*0.85,
            decoration: const BoxDecoration(
              color: AppColors.homePageBg,
                // gradient: LinearGradient(
                //   colors: [
                //     AppColors.appBarColor,
                //     AppColors.signUpColor,
                //     AppColors.appLoginTextColor,
                //   ],
                // ),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  const Center(child:
                  Text(
                      AppStrings.applicationLogInText,
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                          color: AppColors.appLoginTextColor
                      ))),
                  const SizedBox(height: 30),
                  Center(
                      child: Image.asset(AppIcons.logIn,
                         scale: 1.5,
                         // height: 120
                        )
                  ),
                  const SizedBox(height: 10),
                  Center(child: TextButtonWidget(title: AppStrings.newUserText, onTap: (){})),
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.54,
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
                        //color: AppColors.appBarColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20.0))),
                        child: const Text(AppStrings.signUpText,
                          style: TextStyle(color: AppColors.white,fontSize: 22,fontStyle: FontStyle.italic),
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context,
                              Routes.signUpScreen);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(thickness: 2,color: AppColors.textFieldBorder,),
                  const SizedBox(height: 10),
                  Center(child: TextButtonWidget(title: AppStrings.existingUserText, onTap: (){})),
                  const SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      height: MediaQuery.of(context).size.height*0.08,
                      child: MaterialButton(
                        color: AppColors.appBarColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20.0))),
                        child: const Text(AppStrings.signInText,
                          style: TextStyle(color: AppColors.white),
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context,
                              Routes.signInScreen);
                        },

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
