import 'package:flutter/material.dart';

class detailPage extends StatefulWidget {
  const detailPage({Key? key}) : super(key: key);

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        actions: [
          Row(
            children: const [
              Icon(Icons.search),
              SizedBox(width: 15),
              Icon(Icons.more_vert),
              SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage(res['logo']))),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      res['name'],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Krafton Studio',
                      style: const TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Contain ads - inApp purchase',
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '4.6 ⭐',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '9.5K review',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '5M+',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Download',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.error_outline),
                    SizedBox(height: 5),
                    Text(
                      'Rated For 3+',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: 400,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Download'),
              ),
            ),
            const SizedBox(height: 15),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 180,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(res['poster']),
                        fit: BoxFit.cover
                      )
                  ),
                ),
                Container(
                  height: 180,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black26
                  ),
                  child: Icon(Icons.play_circle,size: 70,color: Colors.white,),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Text('About This Game',style: TextStyle(fontSize: 18,color: Colors.black87),),
                Spacer(),
                Icon(Icons.arrow_forward_rounded)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.green)
                  ),
                  child: Text('Action'),
                ),
                const SizedBox(width: 10),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.green)
                  ),
                  child: Text("Editor's choice"),
                ),
              ],
            ),
            const SizedBox(height: 25,),
            const Text('Rating & Reviews',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
            Row(
              children: [
                Text('4.6',style: TextStyle(fontSize: 45),),
                const SizedBox(width: 20),
                Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text('5'),
                        const SizedBox(width: 10,),
                        Stack(
                          children: [
                            Container(
                              height: 10,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black12
                              ),
                            ),
                            Container(
                              height: 10,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.green
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('4'),
                        const SizedBox(width: 10,),
                        Stack(
                          children: [
                            Container(
                              height: 10,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black12
                              ),
                            ),
                            Container(
                              height: 10,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.green
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('3'),
                        const SizedBox(width: 10,),
                        Stack(
                          children: [
                            Container(
                              height: 10,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black12
                              ),
                            ),
                            Container(
                              height: 10,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.green
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('2'),
                        const SizedBox(width: 10,),
                        Stack(
                          children: [
                            Container(
                              height: 10,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black12
                              ),
                            ),
                            Container(
                              height: 10,
                              width: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.green
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('1'),
                        const SizedBox(width: 10,),
                        Stack(
                          children: [
                            Container(
                              height: 10,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black12
                              ),
                            ),
                            Container(
                              height: 10,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.green
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
