 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_testing/core/services/auth.dart';

 class MockUser extends Mock implements User {}

 final MockUser _mockUser = MockUser();

 class MockFirebaseAuth extends Mock implements FirebaseAuth {
   @override
   Stream<User> authStateChanges() {
     return Stream.fromIterable([
       _mockUser,
     ]);
   }
 }

 void main() {
   final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
   final Auth auth = Auth(auth: mockFirebaseAuth);
   setUp(() {});
   tearDown(() {});

   test("emit occurs", () async {
     expectLater(auth.user, emitsInOrder([_mockUser]));
   });

   test("sign in exception", () async {
     when(
       mockFirebaseAuth.signInWithEmailAndPassword(
           email: "tadas@gmail.com", password: "123456"),
     ).thenAnswer((realInvocation) =>
     throw FirebaseAuthException(message: "You screwed up", code: ''));

     expect(await auth.signIn(email: "tadas@gmail.com", password: "123456"),
         "You screwed up");
   });

   test("sign out", () async {
     when(
       mockFirebaseAuth.signOut(),
     ).thenAnswer((realInvocation) => throw FirebaseAuthException(code: 'code'));

     expect(await auth.signOut(email: '', password: ''), "Success");
   });

   test("create account exception", () async {
     when(
       mockFirebaseAuth.signOut(),
     ).thenAnswer((realInvocation) =>
     throw FirebaseAuthException(message: "You screwed up", code: ''));

     expect(await auth.signOut(email: '', password: ''), "You screwed up");
   });
 }