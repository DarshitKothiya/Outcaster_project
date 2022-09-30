import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Global.dart';

class iosApp extends StatefulWidget {
  const iosApp({Key? key}) : super(key: key);

  @override
  State<iosApp> createState() => _iosAppState();
}

class _iosAppState extends State<iosApp> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: Global.kidsGame.map((e) {
          int index = Global.kidsGame.indexOf(e) + 1;
          return Column(
            children: [
              Container(
                height: 75,
                width: 400,
                margin: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$index',
                      style: const TextStyle(
                          fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(
                      width: (index != 10) ? 20 : 10,
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(e['logo']),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          e['name'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          e['type'],
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black45),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Text('GET',style: TextStyle(color: Colors.blue),)
                    ),
                    const SizedBox(width: 10)
                  ],
                ),
              ),
              Divider(indent: 40,height: 1,thickness: 2,)
            ],
          );
        }).toList());
  }
}
