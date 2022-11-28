import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unit_testing/ui/views/welcome_page/welcome_page.dart';
import '../../../core/constant/color_constant.dart';
import '../../../core/constant/font_constant.dart';
import '../../../core/constant/icon_constant.dart';
import '../../../core/utils/common_utils.dart';
import '../../widgets/get_text_field.dart';
import '../sign_up_page/sign_up_page.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
         },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.signInPageText),
          backgroundColor: AppColors.appBarColor,
          centerTitle: true

        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: SvgPicture.asset(AppIcons.user,
                    height: 90)
                  ),
                  const SizedBox(height: 50),
                  const Text(AppStrings.emailText,
                      style: TextStyle(color: AppColors.appBarColor)),
                  const SizedBox(height: 20),
                  GetTextField(
                      controller: emailTextController,
                      hint: AutofillHints.email,
                      obscure: false,
                    inputType: TextInputType.emailAddress,
                      onValidate: CommonUtils.isValidateEmail,
                  ),
                  const SizedBox(height: 20),
                  const Text(AppStrings.passwordText,
                      style: TextStyle(color: AppColors.appBarColor)),
                  const SizedBox(height: 20),
                  GetTextField(
                      controller: passwordTextController,
                      hint: AutofillHints.password,
                      obscure: true,
                    isVisible: true,
                    onValidate: CommonUtils.isPasswordValid,
                    ),
                  //const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){},
                          child: const Text(AppStrings.forgetPasswordText,
                          style: TextStyle(color: AppColors.appBarColor),)
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width*0.13,
                    child: MaterialButton(
                      color: AppColors.appBarColor,
                      onPressed: () async {
                        _formKey.currentState?.validate();
                        _formKey.currentState?.save();
                        if(CommonUtils.validateAndSignIn == true){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const WelcomePage(),));
                        }

                      },
                      shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.0))),
                      child: const Text(AppStrings.signInText,
                        style: TextStyle(color: AppColors.white,fontSize: 20),
                  ),
                ),
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(AppStrings.doNotHaveAccountText),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                          child: const Text(AppStrings.signUpText,
                            style: TextStyle(color: AppColors.signUpColor),)
                      ),
                    ],
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
