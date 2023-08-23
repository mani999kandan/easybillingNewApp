import 'package:easybillingnewapp1/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';


/// This Widget is the main application widget.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {


  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy Billing'),
      ),
      body: Center(
        child: Text('We have pressed the button $_count times.'),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _count++;
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Narayanapillai K"),
              accountEmail: Text("npilllai@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amberAccent,
                child: Text("NP"),
              ),
            ),
            ListTile(
              title: new Text("Items"),
              leading: new Icon(Icons.production_quantity_limits_outlined),
            ),
            Divider( height: 0.1,),
            ListTile(
              title: new Text("Profile"),
              leading: new Icon(Icons.verified_user_outlined),
            ),
            ListTile(
              title: new Text("Settings"),
              leading: new Icon(Icons.settings),
            ),
            ListTile(
              title: new Text("Logout"),
              leading: new Icon(Icons.logout),
              onTap: ()async
              {

                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('id');
                print('id');
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyLogin()),
                      (route) => false, // Prevents going back to the previous screen
                );

              },
            )
          ],
        ),
      ),
    );
  }
}
