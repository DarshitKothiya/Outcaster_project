import 'package:flutter/material.dart';

void main(){
  runApp(
      const homepage()
  );
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool isIos = false;

  bool security1switchval = false;
  bool security2switchval = false;
  bool security3switchval = false;

  @override
  Widget build(BuildContext context) {
    return (isIos == false)
        ? MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Setting UI'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          actions: [
            Switch(
                value: isIos,
                onChanged: (val) {
                  return setState(() {
                    isIos = val;
                  });
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const Text(
                '  Common',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepOrangeAccent),
              ),
              const ListTile(
                leading: Icon(
                  Icons.explore,
                  size: 30,
                ),
                title: Text('Language'),
                subtitle: Text('English'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(
                  Icons.cloud_queue_sharp,
                  size: 30,
                ),
                title: Text('Enviroment'),
                subtitle: Text('Production'),
              ),
              const SizedBox(height: 5),
              const Text(
                '  Account',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepOrangeAccent),
              ),
              const SizedBox(height: 22),
              Row(
                children: const [
                  SizedBox(width: 15),
                  Icon(
                    Icons.call,
                    color: Colors.black87,
                    size: 27,
                  ),
                  SizedBox(width: 25),
                  Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 5),
              Row(
                children: const [
                  SizedBox(width: 15),
                  Icon(
                    Icons.email_outlined,
                    color: Colors.black87,
                    size: 27,
                  ),
                  SizedBox(width: 25),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 5),
              Row(
                children: const [
                  SizedBox(width: 15),
                  Icon(
                    Icons.login_outlined,
                    color: Colors.black87,
                    size: 27,
                  ),
                  SizedBox(width: 25),
                  Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                '  Security',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepOrangeAccent),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 15),
                  const Icon(Icons.phonelink_lock_sharp),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 50,
                    width: 310,
                    child: SwitchListTile(
                        title: const Text('Lock app in background'),
                        value: security1switchval,
                        onChanged: (val) {
                          setState(() {
                            security1switchval = val;
                          });
                        }),
                  )
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const SizedBox(width: 15),
                  const Icon(Icons.fingerprint),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 50,
                    width: 310,
                    child: SwitchListTile(
                        title: const Text('Use Fingerprint'),
                        value: security2switchval,
                        onChanged: (val) {
                          setState(() {
                            security2switchval = val;
                          });
                        }),
                  )
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const SizedBox(width: 15),
                  const Icon(Icons.lock_open),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 50,
                    width: 310,
                    child: SwitchListTile(
                        title: const Text('Change Password'),
                        value: security3switchval,
                        onChanged: (val) {
                          setState(() {
                            security3switchval = val;
                          });
                        }),
                  )
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                '  Misc',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepOrangeAccent),
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  SizedBox(width: 15),
                  Icon(
                    Icons.document_scanner,
                    color: Colors.black87,
                    size: 27,
                  ),
                  SizedBox(width: 25),
                  Text(
                    'Terms of Services',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              Row(
                children: const [
                  SizedBox(width: 15),
                  Icon(
                    Icons.book,
                    color: Colors.black87,
                    size: 27,
                  ),
                  SizedBox(width: 25),
                  Text(
                    'Open source licenses',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    )
        : CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.deepOrangeAccent,
          middle: const Text('Setting UI'),
          trailing: CupertinoSwitch(
              value: isIos,
              onChanged: (val) {
                setState(() {
                  isIos = val;
                });
              }),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const Text(
                '  Common',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.white,
                height: 100,
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: const [
                        SizedBox(width: 10),
                        Icon(
                          CupertinoIcons.globe,
                          color: Colors.black87,
                          size: 27,
                        ),
                        SizedBox(width: 25),
                        Text(
                          'Language',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          'English',
                          style:
                          TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          CupertinoIcons.forward,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: const [
                        SizedBox(width: 10),
                        Icon(
                          CupertinoIcons.cloud,
                          color: Colors.black87,
                          size: 27,
                        ),
                        SizedBox(width: 25),
                        Text(
                          'Environment',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          'Production',
                          style:
                          TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          CupertinoIcons.forward,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '  Common',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.white,
                height: 150,
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: const [
                        SizedBox(width: 15),
                        Icon(
                          CupertinoIcons.phone,
                          color: Colors.black87,
                          size: 27,
                        ),
                        SizedBox(width: 25),
                        Text(
                          'Phone Number',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Icon(CupertinoIcons.forward, color: Colors.grey)
                      ],
                    ),
                    Divider(),
                    Row(
                      children: const [
                        SizedBox(width: 15),
                        Icon(
                          CupertinoIcons.mail,
                          color: Colors.black87,
                          size: 27,
                        ),
                        SizedBox(width: 25),
                        Text(
                          'Email',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Icon(CupertinoIcons.forward, color: Colors.grey)
                      ],
                    ),
                    Divider(),
                    Row(
                      children: const [
                        SizedBox(width: 15),
                        Icon(
                          Icons.login_outlined,
                          color: Colors.black87,
                          size: 27,
                        ),
                        SizedBox(width: 25),
                        Text(
                          'Sign Out',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Icon(CupertinoIcons.forward, color: Colors.grey)
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                '  Security',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              const SizedBox(height: 15),
              Container(
                color: Colors.white,
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        const Icon(Icons.phonelink_lock_sharp,color: Colors.black,),
                        const SizedBox(width: 30),
                        const Text('Lock app in background'),
                        Spacer(),
                        CupertinoSwitch(
                            value: security1switchval,
                            onChanged: (val) {
                              setState(() {
                                security1switchval = val;
                              });
                            }),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        const Icon(Icons.fingerprint,color: Colors.black,),
                        const SizedBox(width: 30),
                        const Text('Fingerprint'),
                        Spacer(),
                        CupertinoSwitch(
                            value: security2switchval,
                            onChanged: (val) {
                              setState(() {
                                security2switchval = val;
                              });
                            }),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        const Icon(CupertinoIcons.lock,color: Colors.black,),
                        const SizedBox(width: 30),
                        const Text('Change Password'),
                        Spacer(),
                        CupertinoSwitch(
                            value: security3switchval,
                            onChanged: (val) {
                              setState(() {
                                security2switchval = val;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                '  Misc',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: const [
                        SizedBox(width: 15),
                        Icon(
                          Icons.document_scanner,
                          color: Colors.black87,
                          size: 27,
                        ),
                        SizedBox(width: 25),
                        Text(
                          'Terms of Services',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        SizedBox(width: 15),
                        Icon(
                          Icons.book,
                          color: Colors.black87,
                          size: 27,
                        ),
                        SizedBox(width: 25),
                        Text(
                          'Open source licenses',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
