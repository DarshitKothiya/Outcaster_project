import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'global.dart';

class cartPage extends StatefulWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {

  DateTime initialDate = DateTime.now();
  String selectDate = '';
  int Selecthour = 0;

  @override
  Widget build(BuildContext context) {
    DateTime initialDate = DateTime.now();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            color: Colors.black12,
            child: const Text(
              'Shopping Cart',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 600,
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Name",
                    ),
                  )
                ),
                const SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Email",
                    ),
                  )
                ),
                const SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on_sharp),
                      hintText: "Location",
                    ),
                  )
                ),
                Row(
                  children: [
                    Text('Delivery Time',style: TextStyle(fontSize: 17,color: Colors.black54),),
                    const Spacer(),
                    Text(selectDate,style: TextStyle(fontSize: 17,color: Colors.black54),),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  height: 250,
                  width: double.infinity,
                  child: CupertinoDatePicker(
                    initialDateTime: initialDate,
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (val) {
                      setState(() {
                        int selecthour = 0;
                        if (val != null) {
                          if(val.hour>12){
                            setState(() {
                              selecthour = (val.hour)-12;
                            });
                          }

                          selectDate = '$selecthour:${val.minute}:${initialDate.second}';
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text('MY CART',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: (Global.myCart.length*100),
                  child: Column(
                    children: Global.myCart.map((e) => Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(e['image']),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          const SizedBox(width: 15),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(e['name'],style: TextStyle(fontSize: 18),),
                             const SizedBox(height: 5),
                             Text('₹ ${e['price']}'),
                           ],
                         )
                        ],
                      ),
                    )).toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Total : ',style: TextStyle(fontSize: 18),),
                    Text('₹ ${Global.totalPrice}',style: TextStyle(fontSize: 18),)
                  ],
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
                  onPressed: () {
                    Navigator.pushNamed(context, 'searchPage');
                  },
                  icon: Icon(CupertinoIcons.search),
                ),
                IconButton(
                  onPressed: () {
                  },
                  icon: Icon(CupertinoIcons.cart),
                  color: Colors.blue,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

}
