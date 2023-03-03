import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wed_app/constant.dart';
import 'package:wed_app/constant.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: kPrimaryColor,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Profile',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    height: height * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Text(
                                      'Jash Limbasiya',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 37,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Likes',
                                              style: GoogleFonts.poppins(
                                                color: Colors.grey[700],
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              '10M',
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Profile visits',
                                              style: GoogleFonts.poppins(
                                                color: Colors.grey[700],
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              '50M',
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/images.png'),
                                  radius: 80,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Portfolio',
                            style: GoogleFonts.poppins(
                              color: Colors.red,
                              fontSize: 27,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.2,
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.red[100],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'Hii!! I am Jash Limbasiya. '
                              'I love gaming. '
                              'I also likes to watch movies and series. ',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.16,
                            decoration: BoxDecoration(
                              color: Colors.red[100],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'I am looking for soulmate to be with my whole life with pure love.',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
