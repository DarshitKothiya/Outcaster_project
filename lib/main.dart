import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main(){
  runApp(
      const project6()
  );
}

class project6 extends StatefulWidget {
  const project6({Key? key}) : super(key: key);

  @override
  State<project6> createState() => _project6State();
}

class _project6State extends State<project6> {
  File? myImage;
  XFile? photo;
  GlobalKey<FormState> textValidator = GlobalKey<FormState>();
  int initialstepindex = 0;
  String selectDOB = 'DD/MM/YYYY';
  DateTime initialDate = DateTime.now();
  int groupValue = 0;
  int radio1Value = 0;
  int radio2Value = 1;

  bool isEnglish = false;
  bool isGujarati = false;
  bool isHindi = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController religiousController = TextEditingController();
  TextEditingController biographyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const SizedBox(height: 35),
            Container(
              height: 55,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient:
                  LinearGradient(colors: [Colors.blue, Colors.green])),
              child: Row(
                children: const [
                  const SizedBox(width: 10),
                  Icon(
                    Icons.arrow_back,
                    size: 27,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Edit Your Profile',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 710,
              child: Form(
                key: textValidator,
                child: Stepper(
                  physics: const BouncingScrollPhysics(),
                  currentStep: initialstepindex,
                  onStepTapped: (val){
                    setState(() {
                      initialstepindex = val;
                    });
                  },
                  onStepContinue: () {
                    setState(() {
                      if (initialstepindex < 10) {
                        initialstepindex = ++initialstepindex;
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
                  steps: [
                    Step(
                      title: Text('Profile Photo'),
                      isActive: (initialstepindex>=0)?true:false,
                      content: GestureDetector(
                        onTap: () async {
                          final ImagePicker _picker = ImagePicker();
                          photo = await _picker.pickImage(
                              source: ImageSource.camera);

                          setState(() {
                            myImage = File(photo!.path);
                          });
                        },
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.grey,
                          backgroundImage:
                          (myImage != null) ? FileImage(myImage!) : null,
                          child: (myImage == null)
                              ? const Text(
                            'ADD',
                            style: TextStyle(color: Colors.white),
                          )
                              : const Text(''),
                        ),
                      ),
                    ),
                    Step(
                      title: const Text('Name'),
                      isActive: (initialstepindex>=1)?true:false,
                      content: TextFormField(
                        controller: nameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Name First...';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Your Name'),
                      ),
                    ),
                    Step(
                      title: const Text('Phone NO.'),
                      isActive: (initialstepindex>=2)?true:false,
                      content: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Phone no. First...';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Your Phone no.'),
                      ),
                    ),
                    Step(
                      title: const Text('Email'),
                      isActive: (initialstepindex>=3)?true:false,
                      content: TextFormField(
                        controller: emailController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Email First...';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Your Email'),
                      ),
                    ),
                    Step(
                      title: const Text('DOB'),
                      isActive: (initialstepindex>=4)?true:false,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(selectDOB),
                          ElevatedButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: initialDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2030),
                              );

                              setState(() {
                                if (pickedDate != null) {
                                  selectDOB =
                                  '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                                }
                              });
                            },
                            child: const Text('Select'),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      title: const Text('Gender'),
                      isActive: (initialstepindex>=5)?true:false,
                      content: SizedBox(
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RadioListTile(
                              title: Text('Male'),
                              value: radio1Value,
                              groupValue: groupValue,
                              onChanged: (val) {
                                setState(() {
                                  groupValue = val!;
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text('Female'),
                              value: radio2Value,
                              groupValue: groupValue,
                              onChanged: (val) {
                                setState(() {
                                  groupValue = val!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Step(
                      title: const Text('Location'),
                      isActive: (initialstepindex>=6)?true:false,
                      content: TextFormField(
                        controller: locationController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Location First...';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Your Location'),
                      ),
                    ),
                    Step(
                      title: const Text('Nationality'),
                      isActive: (initialstepindex>=7)?true:false,
                      content: TextFormField(
                        controller: nationalityController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Nationality First...';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Your Nationality'),
                      ),
                    ),
                    Step(
                      title: const Text('Religious'),
                      isActive: (initialstepindex>=8)?true:false,
                      content: TextFormField(
                        controller: religiousController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Religious First...';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Your Religious'),
                      ),
                    ),
                    Step(
                      title: const Text('Language'),
                      isActive: (initialstepindex>=9)?true:false,
                      content: SizedBox(
                        height: 168,
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title: Text('English'),
                              value: isEnglish,
                              onChanged: (val) {
                                setState(() {
                                  isEnglish = val!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: Text('Gujarati'),
                              value: isGujarati,
                              onChanged: (val) {
                                setState(() {
                                  isGujarati = val!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: Text('Hindi'),
                              value: isHindi,
                              onChanged: (val) {
                                setState(() {
                                  isHindi = val!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Step(
                      title: const Text('Biography'),
                      isActive: (initialstepindex>=10)?true:false,
                      content: TextFormField(
                        controller: biographyController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Biography First...';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Your Biography'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
