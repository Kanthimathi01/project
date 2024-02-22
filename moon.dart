import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
class sk extends StatefulWidget {
  const sk({super.key});

  @override
  State<sk> createState() => _skState();
}

class _skState extends State<sk> {
  final _key = GlobalKey<FormState>();
  final _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FORM 1",style: TextStyle(fontSize: 45,color: Colors.white),textAlign: TextAlign.center,),
        backgroundColor: Colors.blue,
      ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _key,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Text required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                            controller: TextEditingController(),
                            decoration: InputDecoration(
                hintText: 'Enter name',
                            labelText: 'Name',
                          enabledBorder: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                            ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                controller: TextEditingController(),
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid password!';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                controller: TextEditingController(),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail_lock_rounded),
                  hintText: 'Password',
                  labelText: 'Password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please Enter a Phone Number";
                    }else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                      return "Please Enter a Valid Phone Number";
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Enter number',
                    labelText: 'Number',
                    enabledBorder: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers_rounded),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  if(_key.currentState!.validate())
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ok success")));
                    }
                }, child: Text("SUBMIT"),),
              ),

          ],
        ),
        ),
        );
  }
}
