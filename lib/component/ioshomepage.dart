import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Global.dart';

class iosHomepage extends StatefulWidget {
  const iosHomepage({Key? key}) : super(key: key);

  @override
  State<iosHomepage> createState() => _iosHomepageState();
}

class _iosHomepageState extends State<iosHomepage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: Global.mainPoster.map((e) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        height: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 310,
              decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(e['poster']),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(e['logo']),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e['name'],style: TextStyle(fontSize: 18),),
                    SizedBox(height: 5),
                    Text(e['type'],style: TextStyle(fontSize: 15,color: Colors.black54),)
                  ],
                ),
              ],
            )
          ],
        ),
      ),).toList(),
    );
  }
}
