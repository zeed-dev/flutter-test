import 'package:flutter/material.dart';
import 'package:test_comp/constants/const.dart';
import 'package:test_comp/constants/ext.dart';
import 'package:test_comp/widgets/button_widget.dart';
import 'package:test_comp/widgets/textfield_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _numberCtrl = TextEditingController();
  String ressult = "";

  String? _calculateBilPrima(int bilPrima) {
    ressult = "";
    if (bilPrima == 1) {
      return null;
    }

    for (int i = 2; i <= bilPrima; i++) {
      if (bilPrima % i != 0 || i == 2) {
        ressult += "$i ,";
      }
    }

    return ressult;
  }

  Widget _buildHeaderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "$imagePath/as2.png",
          width: 50,
          fit: BoxFit.cover,
        ),
        Text(
          "Test Apps",
          style: kSubtitle.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: margin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderWidget(),
                verticalSpace(30),
                Text(
                  "Bilangan Prima",
                  style: kSubtitle.copyWith(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpace(15),
                Text(
                  "Masukan angkka yang menghasilkan bilangan prima",
                  style: kSubtitle.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                verticalSpace(30),
                TextFieldWidget(
                  controller: _numberCtrl,
                  onChange: (val) {},
                  label: "Input Angka",
                ),
                verticalSpace(30),
                Text(
                  "Bilangan Prima",
                  style: kSubtitle.copyWith(
                    fontSize: 20,
                  ),
                ),
                Text(
                  ressult.isNotEmpty
                      ? ressult.substring(0, ressult.length - 1)
                      : "-",
                  style: kSubtitle.copyWith(fontSize: 20),
                ),
                ButtonWidget(
                  label: "GENRATE BILANGAN PRIMA",
                  onPressed: () {
                    setState(() {
                      _calculateBilPrima(int.parse(_numberCtrl.text));
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
