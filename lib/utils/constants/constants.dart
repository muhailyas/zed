import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zed/utils/colors/colors.dart';

customFontStyle({double size=20,Color color =whiteColor,double letterSpacing=0,FontWeight fontWeight=FontWeight.w400,FontStyle italic=FontStyle.normal}){
  return GoogleFonts.overpass(
    fontSize: size,
    color: color,
    letterSpacing: letterSpacing,
    fontWeight: fontWeight,
    fontStyle: italic
  );
}
//

// reactive height
double screenHeight=0;
double screenWidth=0;
setScreenSize(BuildContext context){
  screenHeight=MediaQuery.of(context).size.height;
  screenWidth=MediaQuery.of(context).size.width;
}

// constant heights
SizedBox height10 = SizedBox(height: screenHeight *0.02); 
SizedBox height20 = SizedBox(height: screenHeight *0.04); 