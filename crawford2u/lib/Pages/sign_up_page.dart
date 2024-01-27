import 'dart:io';

import 'package:crawford2u/Pages/login_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formfield = GlobalKey<FormState>();
  final firstNameController =TextEditingController();
  final middleNameController= TextEditingController();
  final lastNamaController=TextEditingController();
  final phoneNumberController=TextEditingController();
  final whatsAppNumberController=TextEditingController();
  final alternativeNumberController=TextEditingController();
  final emailAddressConttroller=TextEditingController();
  final passwordController=TextEditingController();
  final adharCardController=TextEditingController();
  final panNumberController=TextEditingController();
  final buildingNameController=TextEditingController();
  final flatNumberController=TextEditingController();
  final streetNameControll=TextEditingController();
  final pinCodeController=TextEditingController();
  bool passToggle= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white,
      body: SafeArea( 
        child: SingleChildScrollView( 
          child: Padding(padding: EdgeInsets.all(12),
          child: Form(
            key: _formfield,
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
                Center(
                  child: Padding(
                    padding:  EdgeInsets.only(top: 20),
                    child: Text("Welcome",
                    style: TextStyle( 
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo
                    ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text("Sign up to get started!",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 25,),
                CircleAvatar(
                  radius: 50,
                  child: Image(image: AssetImage('images/assets/woman (1).png'),
                  width: 80,
                  height:80,
                  ),
                ),
                SizedBox(height: 20,),
                Column( 
                  children: [ 
                    Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: firstNameController,
                            decoration: InputDecoration(
                              labelText: "FirstName",
                              hintText: "Enter Firstname",
                              hintStyle: TextStyle(color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person_outline, color: Colors.black),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Firstname";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 5,),
                          Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: middleNameController,
                            decoration: InputDecoration(
                              labelText: "MiddleName",
                              hintText: "Enter Middlename",
                              hintStyle: TextStyle(color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person_outline, color: Colors.black),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Middletname";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 5,),
                        Expanded(child: TextFormField( 
                          keyboardType: TextInputType.name,
                          controller: lastNamaController,
                          decoration: InputDecoration( 
                            labelText: "LastName",
                            labelStyle: TextStyle(color: Colors.black,),
                            hintText: "Enter Lastname",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person_outline, color: Colors.black,)
                          ),
                          validator: (value) {
                            if(value!. isEmpty){
                              return "Enter Lastname";
                            }
                            return null;
                            },                        
                          ),),
                  ],
                ),
              SizedBox(height: 10,),
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  Expanded(
                    child: TextFormField( 
                      keyboardType:TextInputType.number,
                      controller: phoneNumberController,
                      decoration: InputDecoration( 
                        labelText: "PhoneNumber",
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: "Enter Number",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone_android_outlined, color: Colors.black,)
                      ),
                      validator: (value) {
                        if(value !.isEmpty){
                          return "Enter Phone number";
                        }
                        return null;
                      },
                    )),
                    SizedBox(width: 5,),
                    Expanded(child: TextFormField( 
                      keyboardType: TextInputType.number,
                      controller: whatsAppNumberController,
                      decoration: InputDecoration( 
                        labelText: "WhatsAppNumber",
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: "Enter WhatsApp Number",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone_callback_outlined, color: Colors.black,),
                      ),
                      validator: (value) {
                        if(value !.isEmpty){
                          return "Enter WhatsApp number";
                        }
                        return null;
                      },
                    )),
                    SizedBox(width: 5,),
                    Expanded(child: TextFormField( 
                      keyboardType: TextInputType.number,
                      controller: alternativeNumberController,
                      decoration: InputDecoration( 
                        labelText: "Alternative Number",
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: "Enter your  Alternative Number",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone_android_outlined, color: Colors.black,),
                      ),
                      validator: (value) {
                        if(value !.isEmpty){
                          return "Enter Alternative Number";
                        }
                        return null;
                      },
                    )),
                ],
              ),
              SizedBox(height: 10,),
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  Expanded(child: TextFormField( 
                    keyboardType: TextInputType.emailAddress,
                    controller: emailAddressConttroller,
                    decoration: InputDecoration( 
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Enter EmailAddress",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.black,)
                    ),
                    validator: (value) {
                      if(value !.isEmpty){
                        return "Enter EmailAddress";
                      }
                      return null;
                    },
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: TextFormField( 
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passToggle,
                    controller: passwordController,
                    decoration: InputDecoration( 
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outlined, color: Colors.black),
                              suffixIcon: InkWell(
                              onTap: (){
                              setState(() {
                                passToggle= !passToggle;
                        });
                      },
                    child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                    ),
                    validator: (value) {
                      if(value !.isEmpty){
                        return "Enter Password";
                      }
                      return null;
                    },
                  )),
                ],
              ),
              SizedBox(height: 10,),
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  Expanded(child: TextFormField( 
                    keyboardType: TextInputType.number,
                    controller: adharCardController,
                    decoration: InputDecoration( 
                      labelText: "Aadharcard Number",
                      labelStyle: TextStyle( color: Colors.black),
                      hintText: "Enter AadharNumber",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.keyboard_alt_outlined, color: Colors.black,)
                    ),
                    validator: (value) {
                      if(value !.isEmpty){
                        return "Enter Aadhar number";
                      }
                      return null;
                    },
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: TextFormField( 
                    keyboardType: TextInputType.number,
                    controller: panNumberController,
                    decoration: InputDecoration( 
                      labelText: "Pan Card Number",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Enter Pancard number",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.keyboard_outlined, color: Colors.black,),
                    ),
                    validator: (value) {
                      if(value !.isEmpty){
                        return "Enter Pancard number";
                      }
                      return null;
                    },
                  )),
                ],
              ),
              SizedBox(height: 10,),
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  Expanded(child: TextFormField( 
                    keyboardType: TextInputType.name,
                    controller: buildingNameController,
                    decoration: InputDecoration( 
                      labelText: "Building Name",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Enter Building Name",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.house_outlined, color: Colors.black,)
                    ),
                    validator: (value) {
                      if(value !.isEmpty){
                        return "Enter Building name";
                      }
                      return null;
                    },
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: TextFormField( 
                    keyboardType: TextInputType.number,
                    controller: flatNumberController,
                    decoration: InputDecoration( 
                      labelText: "Flat Number",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Enter Flat Number",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.numbers_outlined, color: Colors.black,),
                    ),
                    validator: (value) {
                      if(value !.isEmpty){
                        return "Enter flat number";
                      }
                      return null;
                    },
                  ))
                ],
              ),
              SizedBox(height: 10,),
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  Expanded(child: TextFormField( 
                    keyboardType: TextInputType.name,
                    controller: streetNameControll,
                    decoration: InputDecoration( 
                      labelText: "Enter Street name",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Enter Street Name",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.store_mall_directory_outlined, color: Colors.black,),
                    ),
                    validator: (value) {
                      if(value !.isEmpty){
                      return "Enter street name";
                      }
                      return null;
                    },
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: TextFormField( 
                    keyboardType: TextInputType.number,
                    controller: pinCodeController,
                    decoration: InputDecoration( 
                      labelText: "Pin Code",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Enter pin code",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.format_list_numbered_rtl_outlined, color: Colors.black,),
                    ),
                    validator: (value) {
                      if(value !.isEmpty){
                        return "Enter Pin";
                      }
                      return null;
                    },
                  ))
                ],
              )
              ],
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  InkWell( 
                      onTap: (){ 
                        if(_formfield.currentState!.validate()){
                          print("Account Created");
                              firstNameController.clear();
                              middleNameController.clear();
                              lastNamaController.clear();
                              phoneNumberController.clear();
                              whatsAppNumberController.clear();
                              alternativeNumberController.clear();
                              emailAddressConttroller.clear();
                              passwordController.clear(); 
                              adharCardController.clear();
                              panNumberController.clear();
                              buildingNameController.clear();
                              flatNumberController.clear();
                              streetNameControll.clear();
                              pinCodeController.clear();
                        }
                      },
                      child: Container( 
                        height: 50,
                        //width: 200,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center( 
                          child: GestureDetector(
                            onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder:(context) => LoginPage(),));
                              print("Account Created");
                            },
                            child: Text("Sign Up",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Text("Already have an account?",
                          style: TextStyle( 
                            fontSize: 17,
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context,  
                            MaterialPageRoute(builder:(context) => LoginPage(),));
                          }, 
                          child: Text( 
                            "Log In",
                            style: TextStyle( 
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          )
                        ),
                      ],
                    ),
                ],
              ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}