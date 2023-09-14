import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text validation'),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}
class MyCustomForm extends StatefulWidget{
  @override
  State<MyCustomForm> createState() => MyCustomFormState();
}
class MyCustomFormState extends State<MyCustomForm>{
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text('SIGNOUT FORM', style: TextStyle(color: Colors.black),),
          Padding(padding: EdgeInsets.all(20),
            child:TextFormField(
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please enter value';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
              onPressed: (){
                if(formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')));
                    }
                 }, child: Text('LOGIN'),
              ),
        ],
      ),
    );
  }
}
