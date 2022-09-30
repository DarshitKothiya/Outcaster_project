import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Global.dart';

class iosArcade extends StatefulWidget {
  const iosArcade({Key? key}) : super(key: key);

  @override
  State<iosArcade> createState() => _iosArcadeState();
}

class _iosArcadeState extends State<iosArcade> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: Global.categories.length,
        itemBuilder: (context, index){
          return Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12
                    ),
                    child: Global.categories[index]['icon'],
                  ),
                  const SizedBox(width: 15),
                  Text(Global.categories[index]['name'])
                ],
              ),
              Divider(thickness: 2,indent: 75,)
            ],
          );
        }
    );
  }
}
