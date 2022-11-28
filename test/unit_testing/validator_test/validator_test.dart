import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/core/utils/common_utils.dart';
import 'package:unit_testing/core/validator/validator.dart';

void main(){
  test(
    'empty email test', () {
      String result = Validator.emailValidator('');
      expect(result, 'Please enter email');
  }
  );
  test(
      'valid email test', () {
    String result = Validator.emailValidator('unittest@gmail.com');
    expect(result, 'Email is valid');
  }
  );
  test(
      'invalid email test', () {
    String result = Validator.emailValidator('unittestgmail.com');
    expect(result, 'Please enter email in valid format');
  }
  );
  test(
      'empty password test', () {
    String result = Validator.passwordValidator('');
    expect(result, 'Please enter password');
  }
  );
  test(
      'valid password test', () {
    String result = Validator.passwordValidator('Unit&Testing1');
    expect(result, 'Password is valid');
  }
  );
  // test(
  //     'valid password test', () {
  //   String result = Validator.passwordValidator('Unit&Testing');
  //   expect(result, 'Password should contain at least one digit');
  // }
  // );
  // test(
  //     'invalid password test', () {
  //   String result = Validator.passwordValidator('Unit&1');
  //   expect(result, 'Password must be more than 7 character');
  // }
  // );
}