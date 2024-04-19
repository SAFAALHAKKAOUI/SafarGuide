import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';

import '../models/trip.dart';
import '../utils.dart';

class Scene1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: TextButton(
        // page1N7N (1:2)
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(19 * fem, 5 * fem, 22 * fem, 5 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/page1-bg.png',
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment
                  .center, //pour centrer verticalement et horizontalement
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // autogroupgbgyZDn (6dxW18zkrf4ZwGFgHGgbGY)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 323 * fem, 5 * fem, 0 * fem),
                  padding:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 353 * fem),
                  width: 192 * fem,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // logoministereT4G (14:261)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 1 * fem, 0 * fem),
                        width: 75 * fem,
                        height: 76 * fem,
                        child: Image.asset(
                          'assets/images/logoministere.png',
                        ),
                      ),
                      Container(
                        // vvoyagecomkp4 (4:10)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 350 * fem),
                        child: Text(
                          'V_voyage.com',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 24 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.5 * ffem / fem,
                            color: Color(0xff000000),
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
    );
  }
}
