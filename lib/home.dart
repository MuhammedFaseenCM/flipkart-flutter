import 'package:facebook/category.dart';
import 'package:facebook/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedindex = 0;
  final _pages = [const HomeScreen(), category(), Profile()];
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
                icon: const Icon(Icons.exit_to_app)),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                    color: Colors.yellow,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'BIG BILLION DAYS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/iphone.jpg',
                                height: 100,
                              ),
                              Image.asset(
                                'assets/images/iphone-2.jpg',
                                height: 100,
                              ),
                              Image.asset(
                                'assets/images/iphone-3.jpg',
                                height: 100,
                              ),
                            ],
                          )
                        ])),
              ),
              Expanded(
                flex: 6,
                child: Container(
                    color: Colors.blue,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'NEW DEALS LIVE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            '50-70% offer',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/vivo-v7.jpg',
                                height: 100,
                              ),
                              Image.asset(
                                'assets/images/vivo-x60.jpg',
                                height: 100,
                              ),
                              Image.asset(
                                'assets/images/samsung-m31.jpg',
                                height: 100,
                              ),
                              Image.asset(
                                'assets/images/samsung-fold.jpg',
                                height: 100,
                              ),
                            ],
                          )
                        ])),
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
          ),
        ));
  }

  signout(BuildContext context) async {
    final _sharefPrefs = await SharedPreferences.getInstance();
    await _sharefPrefs.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context1) => const LoginScreen()),
        (route) => false);
  }
}
