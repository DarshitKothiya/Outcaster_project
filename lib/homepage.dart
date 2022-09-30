import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 140,
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            color: Colors.black12,
            child: const Text(
              'Cupertino Store',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 580,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: Global.allProduct.length,
              itemBuilder: (context, index) {
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
                            '${index + 1}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(
                            width: (index >= 9) ? 20 : 30,
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        Global.allProduct[index]['image']),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                Global.allProduct[index]['name'],
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                '₹ ${Global.allProduct[index]['price']}',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black45),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                setState(() {

                                  Global.allProduct[index]['iscart'] = !Global.allProduct[index]['iscart'];

                                  if(Global.allProduct[index]['iscart']==true){
                                    Global.totalPrice = Global.totalPrice + Global.allProduct[index]['price'];
                                    Global.myCart.add(Global.allProduct[index]);
                                  }else if(Global.allProduct[index]['iscart']==false){
                                    Global.myCart.remove(Global.allProduct[index]);
                                  }
                                });
                              },
                              icon: Icon(CupertinoIcons.add_circled)),
                          const SizedBox(width: 10)
                        ],
                      ),
                    ),
                    Divider(
                      indent: 40,
                      height: 1,
                      thickness: 2,
                    )
                  ],
                );
              },
            ),
          ),
          Container(
            height: 80,
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.home,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'searchPage');
                  },
                  icon: Icon(CupertinoIcons.search),
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
    );
  }
}
