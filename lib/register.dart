import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'const.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);


  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _formkey=GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(

              child: Form(
                key: _formkey,
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.28),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              validator: (nameController) {
                                if (nameController == null || nameController.isEmpty) {
                                  return 'Please enter an Name';
                                }
                                // Add your custom validation logic here
                                return null; // Return null for no validation error
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(

                                  errorText: _validate ? "Name Can't Be Empty" : null,

                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Name",

                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller:emailController,
                              validator: (emailController) {
                                if (emailController == null || emailController.isEmpty ) {
                                  return 'Please enter email address';
                                }
                                // Add your custom validation logic here
                                return null; // Return null for no validation error
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller:passwordController,
                              validator: (passwordController) {
                                if (passwordController == null || passwordController.isEmpty) {
                                  return 'Please enter a password';
                                }
                                // Add your custom validation logic here
                                return null; // Return null for no validation error
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  errorText: _validate ? "Password Can't Be Empty" : null,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: mobileNumberController,
                              validator: (mobileNumberController) {
                                if (mobileNumberController == null || mobileNumberController.isEmpty) {
                                  return 'Please enter a mobile Number';
                                }
                                // Add your custom validation logic here
                                return null; // Return null for no validation error
                              },
                              style: TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Mobile Number",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller:shopNameController,
                              validator: (shopNameController) {
                                if (shopNameController == null || shopNameController.isEmpty ) {
                                  return 'Please enter shop name';
                                }
                                // Add your custom validation logic here
                                return null; // Return null for no validation error
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  errorText: _validate ? "Shop Name Can't Be Empty" : null,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Shop Name",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {

                                        });
                                        if (_formkey.currentState!.validate() == true) {
                                          addUser();
                                        }
else
  {
    print("test");
        }
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  child: Text(
                                    'Sign In',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  ),
              ),
              ),

          ],
        ),
      ),
    );
  }
  void addUser() async {

    var url = Uri.parse(baseURL+'api/users/adduser');
    var requestBody = {
      "name": nameController.text,
      "mobile_number": mobileNumberController.text,
      "email_id": emailController.text,
      "password":passwordController.text,
      "shop_name":shopNameController.text,
      "is_verified":0
    };

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body); // Parse the response body

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Request Created Successfully..',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamed(context, 'login');
      print('Request added successfully');

    }
    else {
      print('Failed to add user. Error: ${response.statusCode}');
    }
  }

}