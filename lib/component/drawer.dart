import 'package:flutter/material.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black26,
          ),
        ),
        SizedBox(
          width: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                color: Colors.blueGrey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Spacer(flex: 2,),
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage('https://filmfare.wwmindia.com/thumb/content/2022/mar/salmankhantalksaboutsouthindian31648543539.jpg?width=1200&height=900'),
                    ),
                    SizedBox(height: 15),
                    Text('Salman Khan',style: TextStyle(fontSize: 18,color: Colors.white),),
                    SizedBox(height: 5),
                    Text('+91 7874764505',style: TextStyle(fontSize: 12,color: Colors.white60),),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 270,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        children: const [
                          Icon(Icons.people,color: Colors.blueGrey,size: 27,),
                          SizedBox(width: 20),
                          Text('New Group',style: TextStyle(color: Colors.blueGrey,fontSize: 16),),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: const [
                          Icon(Icons.people,color: Colors.blueGrey,size: 27,),
                          SizedBox(width: 20),
                          Text('New Contact',style: TextStyle(color: Colors.blueGrey,fontSize: 16),),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: const [
                          Icon(Icons.call,color: Colors.blueGrey,size: 27,),
                          SizedBox(width: 20),
                          Text('calls',style: TextStyle(color: Colors.blueGrey,fontSize: 16),),

                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: const [
                          Icon(Icons.bookmark_border,color: Colors.blueGrey,size: 27,),
                          SizedBox(width: 20),
                          Text('Saved Message',style: TextStyle(color: Colors.blueGrey,fontSize: 16),),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: const [
                          Icon(Icons.settings,color: Colors.blueGrey,size: 27,),
                          SizedBox(width: 20),
                          Text('Settings',style: TextStyle(color: Colors.blueGrey,fontSize: 16),),
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
