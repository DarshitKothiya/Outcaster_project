import 'package:flutter/material.dart';

import '../Global.dart';

class appPage extends StatefulWidget {
  const appPage({Key? key}) : super(key: key);

  @override
  State<appPage> createState() => _appPageState();
}

class _appPageState extends State<appPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: Global.app.map((e) {
          int index = Global.app
              .indexOf(e) + 1;
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'detail_page',arguments: e);
            },
            child: Container(
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
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(e['logo']),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        e['name'],
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        e['type'],
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black45),
                      ),
                      Text(
                        '${e['rating']}   ${e['size']}',
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList());
  }
}
