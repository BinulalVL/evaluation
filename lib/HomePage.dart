import 'package:evaluation/ModelClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }
  List Data=[];

 void getdata()async {
   var response = await http.get(
       Uri.parse('https://jsonplaceholder.typicode.com/users'));
   if (response.statusCode == 200) {
     setState(() {
       Data = userDataFromJson(response.body);
       print(Data);
     });

   //  print(Data[0].name);
   } else {
     print('error');
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 80.0),
        child: Container(

          child: ListView.builder(itemCount:Data.length,itemBuilder: (context, index) {
            return Container(
              child:
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Id : '),
                      Text(Data[index].id.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Name : '),
                      Text(Data[index].name),
                    ],
                  ),Row(
                    children: [
                      Text('Username : '),
                      Text(Data[index].username),
                    ],
                  ),Row(
                    children: [
                      Text('Email : '),
                      Text(Data[index].email),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            );


          },),
        ),
      ),
    );
  }
}
