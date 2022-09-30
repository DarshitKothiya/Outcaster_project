import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';

import '../global.dart';

class callspage extends StatefulWidget {
  const callspage({Key? key}) : super(key: key);

  @override
  State<callspage> createState() => _callspageState();
}

class _callspageState extends State<callspage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Global.allcontact.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 27,
                  backgroundImage: (index > 1)
                      ? FileImage(Global.allcontact[index]['image'])
                      : null,
                  child: (index <= 1)
                      ? Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                Global.allcontact[index]['image']),
                            fit: BoxFit.cover)),
                  )
                      : Container(),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${Global.allcontact[index]['name']}',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${Global.allcontact[index]['day']}, ${Global.allcontact[index]['time']}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    Uri uri =
                    Uri.parse('tel: ${Global.allcontact[index]['mobile']}');

                    try {
                      await launchUrl(uri);
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('There are something wrong'),
                          backgroundColor: Colors.redAccent,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: const Icon(CupertinoIcons.phone),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        )
        //   ListTile(
        //   leading: CircleAvatar(
        //     radius: 25,
        //     backgroundImage: (index > 1)
        //         ? FileImage(Global.allcontact[index]['image'])
        //         : null,
        //     child: (index <= 1)
        //         ? Container(
        //             decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 image: DecorationImage(
        //                     image:
        //                         NetworkImage(Global.allcontact[index]['image']),
        //                     fit: BoxFit.cover)),
        //           )
        //         : Container(),
        //   ),
        //   title: Text('${Global.allcontact[index]['name']}'),
        //   subtitle: Text(
        //       '${Global.allcontact[index]['day']}, ${Global.allcontact[index]['time']}'),
        //   trailing: IconButton(
        //       onPressed: () async {
        //         Uri uri =
        //             Uri.parse('tel: ${Global.allcontact[index]['mobile']}');
        //
        //         try {
        //           await launchUrl(uri);
        //         } catch (e) {
        //           print(e);
        //           ScaffoldMessenger.of(context).showSnackBar(
        //             SnackBar(
        //               content: Text('There are something wrong'),
        //               backgroundColor: Colors.redAccent,
        //               behavior: SnackBarBehavior.floating,
        //             ),
        //           );
        //         }
        //       },
        //       icon: Icon(Icons.call)),
        // )
        ;
      },
    );
  }
}
