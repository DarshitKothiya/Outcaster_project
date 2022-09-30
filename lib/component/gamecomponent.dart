import 'package:flutter/material.dart';

import '../Global.dart';

class gameComponent extends StatefulWidget {
  const gameComponent({Key? key}) : super(key: key);

  @override
  State<gameComponent> createState() => _gameComponentState();
}

class _gameComponentState extends State<gameComponent>
    with TickerProviderStateMixin {
  late TabController myTabController;
  late PageController myPageController;
  int initialPageIndex = 0;

  @override
  void initState() {
    super.initState();
    myTabController = TabController(length: 5, vsync: this);
    myPageController = PageController(initialPage: initialPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: myTabController,
          physics: const BouncingScrollPhysics(),
          isScrollable: true,
          tabs: const [
            Tab(
                child: Text(
              'For You',
              style: TextStyle(color: Colors.black, fontSize: 16),
            )),
            Tab(
                child: Text(
              'Top Charts',
              style: TextStyle(color: Colors.black, fontSize: 16),
            )),
            Tab(
                child: Text(
              'Kids',
              style: TextStyle(color: Colors.black, fontSize: 16),
            )),
            Tab(
                child: Text(
              'Premium',
              style: TextStyle(color: Colors.black, fontSize: 16),
            )),
            Tab(
                child: Text(
              'Categories',
              style: TextStyle(color: Colors.black, fontSize: 16),
            )),
          ],
        ),
        SizedBox(
          height: 580,
          width: 400,
          child: TabBarView(
            controller: myTabController,
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                physics: const BouncingScrollPhysics(),
                children: [
                  const Text(
                    '   Top Related Games',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 200,
                    width: 400,
                    child: PageView(
                      controller: myPageController,
                      scrollDirection: Axis.horizontal,
                      children: Global.mainPoster
                          .map(
                            (e) => GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, 'detail_page',arguments: e);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(e['poster']),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '   Recommended For You',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    width: 400,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: Global.recommended
                            .map(
                              (e) => GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushNamed('detail_page',arguments: e);
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 210,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(e['poster']),
                                                fit: BoxFit.cover)),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            height: 65,
                                            width: 65,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image:
                                                        NetworkImage(e['logo']),
                                                    fit: BoxFit.cover)),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e['name'],
                                                style:
                                                    const TextStyle(fontSize: 16),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                '${e['rating']}   ${e['size']}',
                                                style:
                                                    const TextStyle(fontSize: 16),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '   Limited Time Event',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 260,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 180,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.ytimg.com/vi/ulxDWZScC5M/maxresdefault.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '    Subway Surfers   • Ends in 1d',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "             Make the world a greener place! ",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '   Multiplayer Games',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    width: 400,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: Global.multiPlayer
                            .map(
                              (e) => GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushNamed('detail_page',arguments: e);
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 210,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(e['poster']),
                                                fit: BoxFit.cover)),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            height: 65,
                                            width: 65,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image:
                                                        NetworkImage(e['logo']),
                                                    fit: BoxFit.cover)),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e['name'],
                                                style:
                                                    const TextStyle(fontSize: 16),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                '${e['rating']}   ${e['size']}',
                                                style:
                                                    const TextStyle(fontSize: 16),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: Global.topFree.map((e) {
                    int index = Global.topFree.indexOf(e) + 1;
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
                  }).toList()),
              ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: Global.kidsGame.map((e) {
                    int index = Global.kidsGame.indexOf(e) + 1;
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
                  }).toList()),
              ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: Global.premiumGame.map((e) {
                    int index = Global.premiumGame.indexOf(e) + 1;
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
                  }).toList()),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                itemCount: Global.categories.length,
                  itemBuilder: (context, index){
                  return ListTile(
                    onTap: (){},
                    leading: Global.categories[index]['icon'],
                    title: Text('${Global.categories[index]['name']}'),
                  );
                  }
              )
            ],
          ),
        ),
      ],
    );
  }
}
