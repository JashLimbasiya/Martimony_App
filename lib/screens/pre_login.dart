import 'package:flutter/material.dart';
import 'package:wed_app/constant.dart';
import 'login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Second.jpeg"), fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Love is Life",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 33,
                          ),
                        )
                      ],
                    ),
                  ),
                  FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignupScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 25),
                        padding:
                            EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: kPrimaryColor,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Log in",
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
