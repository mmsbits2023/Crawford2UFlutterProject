import 'package:crawford2u/Pages/sign_up_page.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fromfield= GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final phoneNumberController=TextEditingController();
  bool passToggle= true;



  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding( 
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: _fromfield,
            child: SingleChildScrollView(
              child: Column( 
                children: [ 
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Good to see you back!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 25,),
                  CircleAvatar(
                    radius: 50,
                    child: Image(image: AssetImage('images/assets/woman (1).png'),
                    width: 80,
                    height:80,
                    ),
                  ),
                  SizedBox(height: 25,),
                  TextFormField( 
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration( 
                      labelText: "Email",
                      hintText: "Enter your email",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.black,),
                    ),
                    validator: (value) {
                      if(value!. isEmpty){
                        return "Enter Email";
                      }
                    },
                  ),
                  SizedBox(height: 25,),
                  TextFormField( 
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberController,
                    decoration: InputDecoration( 
                      labelText: "Phone Number",
                      hintText: "Enter your number",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone_android_outlined, color: Colors.black,),
                    ),
                    validator: (value){
                      if(value!. isEmpty){
                        return "Enter Phone number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25,),
                  TextFormField( 
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: passToggle,
                    decoration: InputDecoration( 
                      labelText: "Password",
                      hintText: "Enter your password",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.black,),
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            passToggle= !passToggle;
              
                          });
                        },
                      child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    validator: (value){
                      if(value!. isEmpty){
                        return "Enter Password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                onTap: () {
                  if (_fromfield.currentState!.validate()) {
                    print("Successful");
                    emailController.clear();
                    phoneNumberController.clear();
                    passwordController.clear();
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder:(context) => const SignUpPage(),));
                      },
                      child: Text(
              "Log In",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
                      ),
                    ),
                  ),
                ),
              ),
              
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      Text("Don't have an account?",
                      style: TextStyle( 
                        fontSize: 17,
                      ),),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder:(context) => SignUpPage(),));
                        }, 
                        child: Text( 
                          "Sign Up",
                          style: TextStyle( 
                            fontSize: 18,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}