import 'package:flutter/material.dart';

void main(){
  runApp(
      const skipperLogin()
  );
}

class skipperLogin extends StatefulWidget {
  const skipperLogin({Key? key}) : super(key: key);

  @override
  State<skipperLogin> createState() => _skipperLoginState();
}

class _skipperLoginState extends State<skipperLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpswController = TextEditingController();
  TextEditingController loginNameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  int initialstepindex = 0;

  String Username = '';
  String Password = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stepper App'),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Stepper(
          currentStep: initialstepindex,
          onStepContinue: () {
            setState(() {
              if (initialstepindex == 0) {
                if (signupKey.currentState!.validate()) {
                  Username = nameController.text;
                  Password = confirmpswController.text;
                  initialstepindex = ++initialstepindex;
                }
              } else if (initialstepindex == 1) {
                if (loginKey.currentState!.validate()) {
                  initialstepindex = ++initialstepindex;
                }
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (initialstepindex > 0) {
                initialstepindex = --initialstepindex;
              }
            });
          },
          controlsBuilder: (context, detail){
            return Row(
              children: [
                (initialstepindex != 2)?Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(onPressed: detail.onStepContinue, child: const Text('Continue')),
                ):Container(),
                (initialstepindex==2)?const Spacer(flex: 2):const Spacer(flex:1),
                (initialstepindex == 1)?Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: OutlinedButton(onPressed: detail.onStepCancel, child: const Text('Cancel')),
                ):Container(),
                const Spacer(),
              ],
            );
          },
          steps: [
            Step(
                title: const Text('Sign Up'),
                isActive: (initialstepindex >= 0) ? true : false,
                state: (initialstepindex > 0) ? StepState.complete : StepState.indexed,
                content: Form(
                  key: signupKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Name First';
                          }
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Full Name *'),
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mail), hintText: 'Email ID'),
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter a Password';
                          } else if (passwordController.text.length < 8) {
                            return 'Enter Valid Password';
                          }
                        },
                        controller: passwordController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            hintText: 'Password *'),
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter a Password';
                          } else if (passwordController.text.isEmpty) {
                            return 'Enter Password First';
                          } else if (passwordController.text != val) {
                            return 'Enter Valid Password';
                          }
                        },
                        controller: confirmpswController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            hintText: 'Confirm Password *'),
                      ),
                    ],
                  ),
                )),
            Step(
                title: const Text('Login'),
                isActive: (initialstepindex >= 1) ? true : false,
                state: (initialstepindex >= 1) ? StepState.complete : StepState.indexed,
                content: Form(
                  key: loginKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) {
                          if (val != Username) {
                            return 'Enter Valid Username';
                          }
                        },
                        controller: loginNameController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Full Name *'),
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val != Password) {
                            return 'Enter Valid Password';
                          }
                        },
                        controller: loginPasswordController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            hintText: 'Password *'),
                      ),
                    ],
                  ),
                )),
            Step(
              title: Text('Home'),
              state: (initialstepindex == 2) ? StepState.complete : StepState.indexed,
              content: Text('Welcome To Home🎉🎉🎉'),
            )
          ],
        ),
      ),
    );
  }
}
