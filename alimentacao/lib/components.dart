import 'package:flutter/material.dart';


class Components {
  static const Color colorIce = Color(0xffEEF4F9);
  static const Color colorBeige = Color(0xffEEF4F9);
  static const Color colorGreen = Color(0xff87BF0A);
  static const Color colorPurple = Color(0xff981D97);


  static Padding h1(String text, {TextAlign? textAlign}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: quickText(text, fontSize: 32, fontWeight: FontWeight.w700, color: colorPurple, textAlign: textAlign)
    );
  }

  static Text h2(String text, {TextAlign? textAlign}) {
    return quickText(text, fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white, textAlign: textAlign);
  }

  static Text p(String text, {TextAlign? textAlign}) {
    return quickText(text, fontSize: 18, fontWeight: FontWeight.w700, color: colorGreen, textAlign: textAlign);
  }

  static Text quickText(String text, {double? fontSize, FontWeight? fontWeight, Color? color, TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color
      ),
    );
  }
  
  static AppBar appBar(String title) {
    return AppBar(
      backgroundColor: Components.colorGreen,
      elevation: 0,
      bottomOpacity: 0,
      title: Text(title),
      centerTitle: true,
    );
  }

  static Container footer() {
    return Container(
      decoration: const BoxDecoration(
        color: colorGreen,
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                h2("Nossas Redes"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage(
                        'assets/img/icon/facebook.png'
                      ),
                      width: 60,
                      height: 60,
                    ),
                    SizedBox(width: 10),
                    Image(
                      image: AssetImage(
                        'assets/img/icon/instagram.png'
                      ),
                      width: 60,
                      height: 60,
                    )
                  ],
                ),
              ],
            ),
            const Image(
              image: AssetImage(
                'assets/img/logo/logo_2.png',
              ),
              width: 80,
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  static ElevatedButton uiButton(String text, void Function() onClick) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(60),
        backgroundColor: colorGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        )
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      )
    );
  }
}
