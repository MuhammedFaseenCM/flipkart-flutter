import 'dart:ui';

import 'package:facebook/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'login.dart';

class category extends StatefulWidget {
  category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  int _selectedindex = 1;

  final _pages = [HomeScreen(), category(), Profile()];
  final categ = [
    'Mobiles',
    'Fashion',
    'Electronics',
    'Home',
    'Sports',
    'Medicines',
    'Toys',
    'Furniture',
    'Bikes & Cars',
    'Appliances',
    'Personal Care'
  ];

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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: Container(
                child: ListView.separated(
                    itemBuilder: (ctx, index) => Text(
                          categ[index],
                          style: TextStyle(fontSize: 18),
                        ),
                    separatorBuilder: (ctx, index) => const Divider(
                          thickness: 1,
                          color: Colors.blue,
                        ),
                    itemCount: 11),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
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
            ),
          ],
        )));
  }

  signout(BuildContext context) async {
    final _sharefPrefs = await SharedPreferences.getInstance();
    await _sharefPrefs.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context1) => LoginScreen()),
        (route) => false);
  }
}
