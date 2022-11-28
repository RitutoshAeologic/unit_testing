import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/core/utils/common_utils.dart';

void main(){
  test(
      'valid email test', (){
    String? result = CommonUtils.isValidateEmail('asgfjfkf.com');
    expect(result, 'Please enter a valid email');
  });
  test(
      'empty email test', (){
    String? result = CommonUtils.isValidateEmail('');
    expect(result, 'Please type your email.');
  });
  test(
      'empty password test', (){
    String? result = CommonUtils.isPasswordValid('');
    expect(result, 'Please type your password.');
  });

  test(
      'valid password test', (){
    String? result = CommonUtils.isPasswordValid('pass');
    expect(result, 'Your password must be at least 8 alphanumeric length.');
  });

  test(
      'valid login test', (){
    String? result = CommonUtils.validateAndSignIn('unittesting@gmail.com', '12345678');
    expect(result, 'Log In Success');
  });

  test(
      'invalid login test', (){
    String? result = CommonUtils.validateAndSignIn('unittestinggmail.com', '123456');
    expect(result, 'please enter email and password in valid format');
  });
  test(
      'invalid email login test', (){
    String? result = CommonUtils.validateAndSignIn('unittestinggmail.com', '12345678');
    expect(result, 'please enter email in valid format');
  });
  test(
      'invalid password login test', (){
    String? result = CommonUtils.validateAndSignIn('unittesting@gmail.com', '123456');
    expect(result, 'please enter password in valid format');
  });
  test(
      'match confirm password test', (){
    String? result = CommonUtils.validateConfirmPassword('12345678', '12345678');
    expect(result, 'Password Match');
  });

  test(
      'clashing confirm password test', (){
    String? result = CommonUtils.validateConfirmPassword('12345677', '12345678');
    expect(result, 'Password not match');
  });

  test(
      'unconventional confirm password test', (){
    String? result = CommonUtils.validateConfirmPassword('12378', '12478');
    expect(result, 'password not matched and less than 8 alphanumeric length');
  });
  test(
      'short confirm password test', (){
    String? result = CommonUtils.validateConfirmPassword('12345', '12345');
    expect(result, 'Your password must be at least 8 alphanumeric length.');
  });
}