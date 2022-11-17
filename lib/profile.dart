import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'category.dart';
import 'home.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedindex = 2;

  final _pages = [HomeScreen(), category(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Image.asset(
            'assets/images/flipkart-logo-3.png',
            height: 40,
          ),
          actions: [
            IconButton(
                color: Colors.white,
                onPressed: () {
                  signout(context);
                },
                icon: Icon(Icons.exit_to_app)),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    signout(context);
                  },
                  child: Text('Logout')),
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    BottomNavigationBar(
                      backgroundColor: Colors.amber,
                      currentIndex: _selectedindex,
                      onTap: (newIndex) {
                        setState(() {
                          _selectedindex = newIndex;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => _pages[_selectedindex]));
                      },
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home, color: Colors.black),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.category,
                            color: Colors.black,
                          ),
                          label: 'Category',
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            label: 'Profile')
                      ],
                    )
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [],
                    // )
                  ])),
            ],
          ),
        ));
  }

  signout(BuildContext context) async {
    final _sharefPrefs = await SharedPreferences.getInstance();
    await _sharefPrefs.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context1) => LoginScreen()),
        (route) => false);
  }
}
