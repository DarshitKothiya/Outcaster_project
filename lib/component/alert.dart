import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/global.dart';


class mydialoge extends StatefulWidget {
  const mydialoge({Key? key}) : super(key: key);

  @override
  State<mydialoge> createState() => _mydialogeState();
}

class _mydialogeState extends State<mydialoge> {
  File? myImage;
  XFile? photo;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> textFormKey = GlobalKey<FormState>();

  int initailstepindex = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: SizedBox(
        height: 500,
        width: 300,
        child: Form(
          key: textFormKey,
          child: ListView(
            children: [
              Stepper(
                currentStep: initailstepindex,
                onStepTapped: (val){
                  setState((){
                    initailstepindex = val;
                  });
                },
                onStepContinue: (){
                  setState((){
                    if(initailstepindex<3){
                      initailstepindex= ++initailstepindex;
                    }
                  });
                },
                onStepCancel: (){
                  setState((){
                    if(initailstepindex>0){
                      initailstepindex= --initailstepindex;
                    }
                  });
                },
                controlsBuilder: (context, detail){
                  return Row(
                    children: [
                      (initailstepindex != 3)?Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(onPressed: detail.onStepContinue, child: const Text('Continue')),
                      ):Container(),
                      (initailstepindex==3)?const Spacer(flex: 2):const Spacer(flex:1),
                      (initailstepindex != 0)?Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: OutlinedButton(onPressed: detail.onStepCancel, child: const Text('Cancel')),
                      ):Container(),
                      const Spacer(),
                    ],
                  );
                },
                steps: [
                  Step(
                    title: const Text('Profile Photo'),
                    content: GestureDetector(
                      onTap: () async{
                        final ImagePicker _picker = ImagePicker();
                        photo = await _picker.pickImage(
                            source: ImageSource.camera);

                        setState((){
                          myImage = File(photo!.path);
                        });
                      },
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey,
                        backgroundImage: (myImage != null)?FileImage(myImage!):null,
                        child: (myImage == null)?const Text('ADD',style: TextStyle(color: Colors.white),):const Text(''),
                      ),
                    ),
                    isActive: (initailstepindex >= 0) ? true : false,
                    state: (initailstepindex ==1 && myImage==null)?StepState.error:StepState.indexed,
                  ),
                  Step(
                    title: const Text('Enter Name'),
                    content: SizedBox(
                      height: 50,
                      width: 230,
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Name First';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Name Here..',
                          border: OutlineInputBorder(),

                        ),
                      ),
                    ),
                    isActive: (initailstepindex >= 1) ? true : false,
                  ),
                  Step(
                    title: const Text('Enter Desc'),
                    content: SizedBox(
                      height: 50,
                      width: 230,
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Desc First';
                          }
                          return null;
                        },
                        controller: descController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Desc Here..',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    isActive: (initailstepindex >= 2) ? true : false,
                  ),
                  Step(
                    title: const Text('Enter Mobile No.'),
                    content: SizedBox(
                      height: 50,
                      width: 230,
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Mobile no. First';
                          }else if(val.length<10){
                            return 'Enter Valid Number...';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: numberController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Mobile No. Here..',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    isActive: (initailstepindex >= 3) ? true : false,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: (){
                    setState((){
                      if(myImage != null){
                        if (textFormKey.currentState!
                            .validate()) {
                          File image = File(photo!.path);
                          String name = nameController.text;
                          String desc = descController.text;
                          num mobile = int.parse(numberController.text);
                          String time = "1:38 PM";
                          String day = "Monday";

                          Map newContact = {'image':image,'name':name,'desc':desc,'mobile':mobile,'time':time,'day':day};
                          Global.allcontact.add(newContact);
                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                        }
                      }
                    });
                  },
                  child: Text('Add Contact'),
                ),
              )
            ],
          ),
        ),
      ),);
  }
}
