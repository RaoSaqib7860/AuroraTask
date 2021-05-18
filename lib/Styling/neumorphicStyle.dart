import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppStyle{
  static NeumorphicStyle neumorphicStyle = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
    //
    depth: -3,
    intensity: 10,

    color: Color(0xff004A97).withOpacity(0.2),
    //color: Colors.white,
    lightSource: LightSource.bottomRight,
    shadowLightColor: const Color(0xff004A97)
        .withOpacity(0.5),
    shadowDarkColor: const Color(0xff004A97)
        .withOpacity(0.5),
    border: NeumorphicBorder(
      color: const Color(0xff004A97),
      width: 0,
    ),
  );
}