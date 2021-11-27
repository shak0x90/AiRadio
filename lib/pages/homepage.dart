import 'package:ai_radio/model/radio.dart';
import 'package:ai_radio/utlis/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MyRadio>? radios;
  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  fetchRadios() async {
    print("a");
    final radioJason = await rootBundle.loadString("assets/radios.json");
    print("fuckjson");
    radios = MyRadiolist.fromJson(radioJason).radios;
    print("fuckjson2");
    print(radios);
    print("fuckjson3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(LinearGradient(
                colors: [
                  Ai_colors.primaryColor1,
                  Ai_colors.prmaryColor2,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ))
              .make(),
          AppBar(
            title: "AI Radio".text.xl4.white.make().shimmer(
                  primaryColor: Vx.purple300,
                  secondaryColor: Vx.white,
                ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ).h(100).p16()
        ],
      ),
    );
  }
}
