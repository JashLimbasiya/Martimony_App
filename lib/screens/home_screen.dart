import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wed_app/constant.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/menu.svg", height: 35,),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Matrimony App",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/notification.svg", height: 23,),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Form(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search Profiles",
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.90),
                      border: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: SvgPicture.asset('assets/icons/search.svg',),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("See all",
                      style: TextStyle(
                        color: Colors.red
                      ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset("assets/images/female_1.png", height: 170),
                      ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Image.asset("assets/images/male_1.png", height: 170),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Image.asset("assets/images/female_2.png", height: 170),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Image.asset("assets/images/male_2.png", height: 170),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("See all",
                        style: TextStyle(
                            color: Colors.red
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset("assets/images/male_2.png", height: 170),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Image.asset("assets/images/female_2.png", height: 170),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Image.asset("assets/images/female_1.png", height: 170),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      child: Image.asset("assets/images/male_1.png", height: 170),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
    borderSide: BorderSide.none);
