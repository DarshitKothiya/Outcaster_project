import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/component/setting.dart';

import '../global.dart';
import 'alert.dart';
import 'calls.dart';
import 'chats.dart';
import 'drawer.dart';

class platformConvertor extends StatefulWidget {
  const platformConvertor({Key? key}) : super(key: key);

  @override
  State<platformConvertor> createState() => _platformConvertorState();
}

class _platformConvertorState extends State<platformConvertor>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<Widget> myPages = [
    const chatspage(),
    const callspage(),
    const settingpage()
  ];
  PageController pageController = PageController();
  int initailtabindex = 0;
  int initialCupertinotabindex = 0;

  @override
  initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return (Global.isIos == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                leading: const Icon(Icons.menu),
                backgroundColor: Colors.blueGrey,
                title: const Text('Platform Changer'),
                bottom: TabBar(
                  onTap: (val) {
                    setState(() {
                      pageController.animateToPage(val,
                          duration: const Duration(microseconds: 400),
                          curve: Curves.easeOutQuint);
                    });
                  },
                  controller: tabController,
                  indicatorColor: Colors.white,
                  tabs: const [
                    Tab(
                      text: 'Chat',
                    ),
                    Tab(
                      text: 'Call',
                    ),
                    Tab(
                      text: 'Setting',
                    ),
                  ],
                ),
                actions: [
                  Switch(
                    value: Global.isIos,
                    onChanged: (val) {
                      setState(() {
                        Global.isIos = val;
                      });
                    },
                  )
                ],
              ),
              floatingActionButton: (initailtabindex == 0)
                  ? StatefulBuilder(
                    builder: (context,setState){
                      return FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const mydialoge();
                                });
                          });
                        },
                        child: const Icon(Icons.add),
                        backgroundColor: Colors.blueGrey,
                      );
                    }
                  )
                  : null,
              body: PageView.builder(
                controller: pageController,
                onPageChanged: (val) {
                  setState(() {
                    tabController.animateTo(val);
                    initailtabindex = val;
                  });
                },
                itemCount: myPages.length,
                itemBuilder: (context, index) {
                  return myPages[index];
                },
              ),
              drawer: const myDrawer(),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              backgroundColor: Colors.white,
              navigationBar: CupertinoNavigationBar(
                leading: StatefulBuilder(
                  builder: (context, setState) {
                    return GestureDetector(
                      onTap: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return myDrawer();
                          },
                        );
                      },
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                backgroundColor: Colors.blueGrey,
                middle: const Text(
                  'Platform Convertor',
                ),
                trailing: CupertinoSwitch(
                    value: Global.isIos,
                    onChanged: (val) {
                      setState(() {
                        Global.isIos = val;
                      });
                    }),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 670,
                    width: double.infinity,
                    child: IndexedStack(
                      index: initialCupertinotabindex,
                      children: const [chatspage(), callspage(), settingpage()],
                    ),
                  ),
                  const Spacer(),
                  CupertinoTabBar(
                    currentIndex: initialCupertinotabindex,
                    onTap: (val){
                      setState(() {
                        initialCupertinotabindex =val;
                      });
                    },
                    backgroundColor: Colors.blueGrey,
                    activeColor: Colors.white,
                    inactiveColor: Colors.black,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.chat_bubble_2),
                        label: 'Chats',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.phone),
                        label: 'Calls',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.settings),
                        label: 'Settings',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
