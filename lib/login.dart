
import 'package:easybillingnewapp1/home.dart';
import 'package:easybillingnewapp1/homepage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import 'const.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formkey=GlobalKey<FormState>();
  bool isChecked = false;
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _validate = false;

  late Box box1;

  @override
  void initState() {
    //
    super.initState();
    createBox();

  }

  void createBox() async {
    box1 = await Hive.openBox('logininfo');
    getdata();
  }
  void getdata()async {
    if (box1.get('mobileNumber') != null) {
      mobileNumber.text = box1.get('email');
      isChecked = true;
      setState(() {
print("Please enter mobile number");
      });
    }
    if (box1.get('password') != null) {
      password.text = box1.get('password');
      isChecked = true;
      setState(() {
        print("Please enter Password");
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: mobileNumber,
                            validator: (mobileNumber) {
                              if (mobileNumber == null || mobileNumber.isEmpty || mobileNumber.length !=10) {
                                return 'Please enter a valid 10 digit mobile number';
                              }
                              // Add your custom validation logic here
                              return null; // Return null for no validation error
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,


                                hintText: "Mobile Number",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: password,
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return 'Please enter password';
                              }
                              // Add your custom validation logic here
                              return null; // Return null for no validation error
                            },
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,

                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Remember Me",
                                style: TextStyle(color: Colors.black),),
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  isChecked = !isChecked;
                                  setState(() {

                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: ()
                                    {
                                      login();
 if (_formkey.currentState!.validate() == true){
                                    login();
                                        print("test");
                                      }
                                      else
                                      {
                                        print("test1");
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
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',

                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  void login() async {

    if (isChecked) {
      box1.put('email', mobileNumber.text);
      box1.put('password', password.text);
    }
    var url = Uri.parse(baseURL+'api/users/login');
    var requestBody = {
      "mobile_number": mobileNumber.text,
      "password": password.text,
    };

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body); // Parse the response body
      var id = responseBody['user']['id']
          .toString(); // Assuming the ID key in the response is 'id'
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('id', id);
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        return HomePage();
      },),);


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login Success',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );

      print('Login success');

    }

    else {
      print('Failed to add user. Error: ${response.statusCode}');
    }
  }

}