
import 'dart:convert';
import 'package:crawford2u/Pages/agent/agent_details.dart';
import 'package:crawford2u/Pages/agent/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool passToggle = true;


 FocusNode emailFiled=FocusNode();
  FocusNode pahoneNumberFiled=FocusNode();
  FocusNode passwordField=FocusNode();

  // Function to make the API call for login
  Future<void> loginUser() async {
    final url = Uri.parse('http://localhost:5052/agent/login');

    // Prepare your request body data
    final Map<String, dynamic> requestBody = {
      'email': emailController.text,
      'mpin': passwordController.text,
      'phoneNumber': phoneNumberController.text,
    };

    try {
      final response = await http.post(
        url,
        body: jsonEncode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        print('API call successful. User logged in successfully.');
        // Handle success

        // You can add logic here to navigate to the next screen after successful login
         Navigator.push(context, MaterialPageRoute(builder: (context) =>AgentDetails()));
      } else {
        print('API call failed with status code: ${response.statusCode}');
        // Handle error
      }
    } catch (error) {
      print('Error during API call: $error');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: _formfield,
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
                          color: Colors.indigo),
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
                    child: Image(
                      image: AssetImage('images/assets/woman (1).png'),
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    focusNode: emailFiled,
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
                      if (value!.isEmpty) {
                        return "Enter Email";
                      }
                    },
                    onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(pahoneNumberFiled);
                          },          
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    focusNode: pahoneNumberFiled,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Phone number";
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(passwordField);
                          },          
                    
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    focusNode: passwordField,
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
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () async {
                      if (_formfield.currentState!.validate()) {
                        // Call the loginUser function to make the API call for login
                        await loginUser();

                        // Clear controllers after successful login
                        emailController.clear();
                        phoneNumberController.clear();
                        passwordController.clear();

                        // ... clear other controllers
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
                            loginUser();
                            // You can add logic here to navigate to the next screen after successful login
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
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUpPage(),));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
