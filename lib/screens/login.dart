import 'package:flutter/material.dart';
import '../constant.dart';
import 'home_screen.dart';
import 'bottom_navigation.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Second.jpeg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.alternate_email,
                                color: kPrimaryColor,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "User Can't Empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Email Address",
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.lock,
                              color: kPrimaryColor,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Enter Password";
                                } else if(value.length<6){
                                  return "Password Length should be 6";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 18
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                ),
                                child: Icon(
                                  Icons.facebook,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                ),
                                child: Icon(
                                  Icons.chat_bubble,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return BottomNavigation();
                                  },
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kPrimaryColor,
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
