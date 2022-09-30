import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playstore/component/androidapp.dart';
import 'package:playstore/component/gamecomponent.dart';
import 'package:playstore/component/iosApp.dart';
import 'package:playstore/component/iosArcade.dart';
import 'package:playstore/component/iosgame.dart';

import 'Global.dart';
import 'component/ioshomepage.dart';
import 'detailpage.dart';

class platformChanger extends StatefulWidget {
  const platformChanger({Key? key}) : super(key: key);

  @override
  State<platformChanger> createState() => _platformChangerState();
}

class _platformChangerState extends State<platformChanger> {
  int initialNavigationIndex = 0;
  int initialCupertinotabindex = 0;

  @override
  Widget build(BuildContext context) {
    return (Global.isAppStore == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              'detail_page': (context)=>const detailPage(),
            },
            home: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 38),
                  Container(
                    height: 50,
                    width: 340,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black45,
                              blurRadius: 4,
                              spreadRadius: 1)
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        const Icon(Icons.menu),
                        const SizedBox(width: 15),
                        const Text(
                          'Search For App & Games',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const Spacer(),
                        Switch(
                          value: Global.isAppStore,
                          onChanged: (val) {
                            setState(() {
                              Global.isAppStore = val;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 630,
                    child: IndexedStack(
                      index: initialNavigationIndex,
                      children: [
                        const gameComponent(),
                        const appPage(),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.error_outline,size: 45,),
                              SizedBox(height: 15),
                              Text('There Are No Any Offer Available..')
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.work_history_outlined),
                              SizedBox(height: 10),
                              Text('Work In Progress...')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 70,
                    child: BottomNavigationBar(
                      currentIndex: initialNavigationIndex,
                      onTap: (val) {
                        setState(() {
                          initialNavigationIndex = val;
                        });
                      },
                      items: const [
                        BottomNavigationBarItem(
                            backgroundColor: Colors.grey,
                            icon: Icon(Icons.videogame_asset_sharp),
                            label: 'Games'),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.grey,
                            icon: Icon(
                              Icons.app_registration_sharp,
                            ),
                            label: 'Apps'),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.grey,
                            icon: Icon(Icons.local_offer_outlined),
                            label: 'Offer'),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.grey,
                            icon: Icon(
                              Icons.book,
                            ),
                            label: 'Books'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    '   ThursDay, Sept 29',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        '   TODAY',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                          value: Global.isAppStore,
                          onChanged: (val) {
                            setState(() {
                              Global.isAppStore = val;
                            });
                          }),
                      const SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(
                    height: 615,
                    child: IndexedStack(
                      index: initialCupertinotabindex,
                      children: [
                        const iosHomepage(),
                        const iosGame(),
                        const iosArcade(),
                        const iosApp(),
                        Container(
                          height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 25,vertical: 30),
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black12
                          ),
                          child: CupertinoTextField(
                            placeholder: "Search",
                            placeholderStyle: TextStyle(
                              color: Colors.black
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CupertinoTabBar(
                    currentIndex: initialCupertinotabindex,
                    onTap: (val) {
                      setState(() {
                        initialCupertinotabindex = val;
                      });
                    },
                    backgroundColor: Colors.grey,
                    activeColor: Colors.white,
                    inactiveColor: Colors.black,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.today_fill),
                        label: 'Today',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.game_controller),
                        label: 'Games',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.cube_box),
                        label: 'Arcade',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.app_badge),
                        label: 'Apps',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.search),
                        label: 'Search',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
