import 'package:crawford2u/Pages/agent/login_page.dart';
import 'package:crawford2u/Pages/client/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppBarMenu extends StatelessWidget {
  const AppBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      backgroundColor: Colors.black26,
        title: Text("Crawford2U",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
        actions: [
              Row(
            children: [
              TextButton(
                
                onPressed: (){
                  //Get.to(()=>SignUpPage());
                   Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage()));
                },
                 child: Text("AgentLogin",style: TextStyle(color:Colors.black ,fontSize:18,fontWeight: FontWeight.bold),),
                 ),
                 TextButton(
                onPressed: (){
                //  Get.to(()=>LoginPage());
                Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginClientPage()));
                },
                 child: Text("ClientLogin",style: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                 
                 ),
            ],
          )
          ],
      ),
    );
    
  }
}