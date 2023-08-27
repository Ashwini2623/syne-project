import 'package:flutter/material.dart';
import 'package:project/views/hamburger_menu/hamburger_menu.dart';
import 'package:project/views/home_page/components/card_section.dart';
import 'package:project/views/home_page/components/transaction_section.dart';
import '../../../utils/constants.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const HamburgerMenu(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu, color: kBlackColor)),
        actions: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBlueColor.withOpacity(0.8),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 6.0,
                      color: kGreyColor,
                      offset: Offset(0.0, 2.0))
                ]),
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child:
                    const Icon(Icons.person_2, size: 24.0, color: kWhiteColor)),
          ),
        ],
      ),
      body: const SafeArea(
          child: CustomScrollView(
        slivers: [
          CardSection(),
          TransactionSection(),
        ],
      )),
    );
  }
}
