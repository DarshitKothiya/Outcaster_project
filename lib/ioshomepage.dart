import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/drawer.dart';
import 'global.dart';

class iosHomepage extends StatefulWidget {
  const iosHomepage({Key? key}) : super(key: key);

  @override
  State<iosHomepage> createState() => _iosHomepageState();
}

class _iosHomepageState extends State<iosHomepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return const myDrawer();
              },
            );
          },
          child: const Icon(Icons.menu),
        ),
        middle: const Text('Platform Convertor'),
        trailing: CupertinoSwitch(
            value: Global.isIos,
            onChanged: (val) {
              setState(() {
                Global.isIos = val;
              });
            }),
      ),
      child: Container(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
