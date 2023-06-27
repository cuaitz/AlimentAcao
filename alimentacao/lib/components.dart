import 'package:flutter/material.dart';


class Components {
  static const Color colorIce = Color(0xffEEF4F9);
  static const Color colorBeige = Color(0xffEEF4F9);
  static const Color colorGreen = Color(0xff87BF0A);
  static const Color colorPurple = Color(0xff981D97);
  static const Color colorLightPurple = Color(0xffE174E0);


  static Padding h1(String text, {Color? color=Components.colorPurple, TextAlign? textAlign}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: quickText(text, fontSize: 32, fontWeight: FontWeight.w700, color: color, textAlign: textAlign)
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
  
  static AppBar appBar(String title, {Color backgroundColor = Components.colorGreen}) {
    return AppBar(
      backgroundColor: backgroundColor,
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
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 10),
                    Image(
                      image: AssetImage(
                        'assets/img/icon/instagram.png'
                      ),
                      width: 50,
                      height: 50,
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

  static ElevatedButton uiButton(String text, Color backgroundColor, void Function() onClick, {Color? textColor}) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(60),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        )
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: textColor
        ),
      )
    );
  }

  static TextFormField uiTextField(String labelText, Color themeColor, {String? Function(String?)? validator, TextEditingController? controller, Color? backgroundColor, String? hintText, bool obscureText = false}) {
    return TextFormField(
      validator: validator ?? (value) {
        if (value!.isEmpty) { return 'Preencha este campo'; }
        return null;
      },
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: backgroundColor,
        labelText: labelText,
        labelStyle: TextStyle(
          color: themeColor,
          fontWeight: FontWeight.w700,
          fontSize: 20
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: themeColor,
            width: 2
          )
        )
      )
    );
  }
}
