import 'package:flutter/material.dart';
import 'package:light_height_ecomerce_app/components/reusedcomponents.dart';
import 'package:light_height_ecomerce_app/presentation/viewsTemplate/BuildAppView.dart';
import 'package:light_height_ecomerce_app/presentation/viewsTemplate/ProductView.dart';
import 'package:light_height_ecomerce_app/utils/heightUtils.dart';

class App extends StatefulWidget{
  AppState createState()=> AppState();
}
class AppState extends State<App>{
  List<String> images = ["assets/adds1.png","assets/bg2.jpeg","assets/bg3.jpeg"];
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: false,
         backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
      actions: [
       
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child:const Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Store__",style:TextStyle(
                    color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold
                  )),
                  Icon(Icons.notification_add),
                ],
              
            ),
          ),
        )
      ],
      
      ),
      body: SingleChildScrollView(child: 
      SizedBox(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
             SizeUtils.sizedboxHeight(20),
             InputField(hintText: "Search", controller: search),
       
           SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return BuildAppView(index:index,image:images[index]);
                },
              ),
            ),
                 SizeUtils.sizedboxHeight(10),
            ProductView(),
               
      

        ],


      ),)
      
      ),
    );
  }

}