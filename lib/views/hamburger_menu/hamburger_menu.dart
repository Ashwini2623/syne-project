import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/utils/custom_padding.dart';
import '../../../utils/constants.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  void logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you want to Exit !!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    context.pop();
                    exit(0);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('No'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 25,
      shadowColor: kCardColor,
      width: MediaQuery.of(context).size.width * 0.7,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [
                                kBlueColor,
                                kBlackColor,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: const Icon(
                          Icons.person,
                          color: kWhiteColor,
                        )),
                    kSizedBoxWidth(16.0),
                    const Flexible(
                      child: Text('Emma Larsen'),
                    ),
                  ],
                ),
              ),
            ),
            CustomPadding(
              h: 8.0,
              v: 16.0,
              child: ListTile(
                onTap: () {
                  context.pop();
                },
                title: Text(
                  'My Transactions',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            CustomPadding(
              h: 24.0,
              v: 24.0,
              child: OutlinedButton(
                onPressed: () {
                  logout(context);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.logout_outlined),
                    kSizedBoxWidth(8.0),
                    Text(
                      'Logout',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
