import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../global.dart';

class chatspage extends StatefulWidget {
  const chatspage({Key? key}) : super(key: key);

  @override
  State<chatspage> createState() => _chatspageState();
}

class _chatspageState extends State<chatspage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: Global.allcontact.map((e) {
        int index = Global.allcontact.indexOf(e);
        return GestureDetector(
          onLongPress: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'Are you Sure You Want Delete Contact',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Global.allcontact.remove(Global.allcontact[index]);
                            Navigator.pop(context);
                          });
                        },
                        child: const Text('Delete'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('cancel'),
                      ),
                    ],
                    contentPadding: EdgeInsets.all(0),
                  );
                });
          },
          onTap: () {
            setState(() {
              (Global.isIos == false)
                  ? showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          height: 300,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          child: Column(
                            children: [
                              const Spacer(),
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: (index > 1)
                                    ? FileImage(
                                        Global.allcontact[index]['image'])
                                    : null,
                                child: (index <= 1)
                                    ? Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    Global.allcontact[index]
                                                        ['image']),
                                                fit: BoxFit.cover)),
                                      )
                                    : Container(),
                              ),
                              const Spacer(),
                              Text('${Global.allcontact[index]['name']}'),
                              const SizedBox(height: 5),
                              Text('${Global.allcontact[index]['mobile']}'),
                              const Spacer(),
                              SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        Uri uri = Uri.parse(
                                            'sms: ${Global.allcontact[index]['mobile']}');

                                        try {
                                          await launchUrl(uri);
                                        } catch (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'There are something wrong'),
                                              backgroundColor: Colors.redAccent,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text('Send Message'))),
                              const Spacer(),
                              SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'))),
                              const Spacer(),
                            ],
                          ),
                        );
                      })
                  : showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          height: 300,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          child: Column(
                            children: [
                              const Spacer(),
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: (index > 1)
                                    ? FileImage(
                                        Global.allcontact[index]['image'])
                                    : null,
                                child: (index <= 1)
                                    ? Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    Global.allcontact[index]
                                                        ['image']),
                                                fit: BoxFit.cover)),
                                      )
                                    : Container(),
                              ),
                              const Spacer(),
                              Text('${Global.allcontact[index]['name']}'),
                              const SizedBox(height: 5),
                              Text('${Global.allcontact[index]['mobile']}'),
                              const Spacer(),
                              SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        Uri uri = Uri.parse(
                                            'sms: ${Global.allcontact[index]['mobile']}');

                                        try {
                                          await launchUrl(uri);
                                        } catch (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'There are something wrong'),
                                              backgroundColor: Colors.redAccent,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text('Send Message'))),
                              const Spacer(),
                              SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'))),
                              const Spacer(),
                            ],
                          ),
                        );
                      });
            });
          },
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
                      '${Global.allcontact[index]['desc']}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '${Global.allcontact[index]['time']}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
