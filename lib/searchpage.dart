import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 720,
            child: Column(
              children: [
                const SizedBox(height: 50),

                SizedBox(
                  height: 45,
                  width: 320,
                  child: CupertinoTextField(
                    placeholder: 'Search',
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 80,
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  icon: Icon(
                    CupertinoIcons.home,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.search,color: Colors.blue,),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'cartPage');
                  },
                  icon: Icon(CupertinoIcons.cart),
                ),
              ],
            ),
          )
        ],
      ),
    );;
  }
}
