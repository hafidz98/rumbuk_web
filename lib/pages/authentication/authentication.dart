import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/layout.dart';
import 'package:rumbuk_web/routing/routes.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Container(child: Image.asset("assets/icons/icon1.png"), height: 24,),
                ),
                Expanded(child: Container())
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Login",
                  style: GoogleFonts.roboto(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                CustomText(
                  text: 'Welcome back to the admin panel',
                  color: lightGrey,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "youremail@mail.com",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "abc123!@#",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {value = false;}),
                    CustomText(text: "Remember me")
                  ],
                ),
                CustomText(
                  text: "Forgot password?",
                  color: active,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Get.offAllNamed(rootRoute);
              },
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20), color: active),
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: CustomText(
                  text: "Login",
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "Do not have admin credentials? "),
              TextSpan(
                  text: "Request credentials!",
                  style: TextStyle(color: active)),
            ]))
          ],
        ),
      )),
    );
  }
}
