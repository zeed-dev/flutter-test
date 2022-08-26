import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_comp/constants/const.dart';
import 'package:test_comp/constants/ext.dart';
import 'package:test_comp/pages/home_page.dart';
import 'package:test_comp/widgets/button_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Widget _buildDotWidget(double width, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      width: width,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? primaryColor : Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: margin),
          child: Column(
            children: [
              verticalSpace(50),
              Image.asset(
                "$imagePath/as1.png",
                width: 250,
                fit: BoxFit.cover,
              ),
              verticalSpace(20),
              Text(
                "Let's meet our summer\ncoffee drinks",
                textAlign: TextAlign.center,
                style: kSubtitle.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(25),
              Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                textAlign: TextAlign.center,
                style: kSubtitle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDotWidget(20, isActive: true),
                  _buildDotWidget(10, isActive: false),
                  _buildDotWidget(10, isActive: false),
                ],
              ),
              const Spacer(),
              ButtonWidget(
                label: "GET STARTED",
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: ((context) => const HomePage()),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
