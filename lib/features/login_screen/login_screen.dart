import 'package:flutter/material.dart';
import 'package:the_grand_marche/core/constants/colors/palletes.dart';
import 'package:the_grand_marche/core/constants/pictures/pictures.dart';
import 'package:the_grand_marche/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(width * .1),
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(Pictures.loginImage),
                      SizedBox(
                        height: width * .03,
                      ),
                      Text(
                        "Log In \nyour account",
                        style: TextStyle(
                            fontSize: width * .063,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "User Name",
                          hintStyle: TextStyle(
                              fontSize: width * .04,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * .03),
                              borderSide:
                                  const BorderSide(color: Pallets.orange)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * .03),
                              borderSide:
                                  const BorderSide(color: Pallets.orange)),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontSize: width * .04,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * .03),
                              borderSide:
                                  const BorderSide(color: Pallets.orange)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * .03),
                              borderSide:
                                  const BorderSide(color: Pallets.orange)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(width * .01)),
                                side: BorderSide(width: width * 0.002),
                                value: check,
                                onChanged: (value) {
                                  setState(() {
                                    check = value!;
                                  });
                                },
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                    fontSize: width * .04, color: Colors.black),
                              )
                            ],
                          ),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: width * .04,
                                fontWeight: FontWeight.bold,
                                color: Pallets.blue),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, width * 0.13),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    backgroundColor: Pallets.orange,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: width * .045,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
