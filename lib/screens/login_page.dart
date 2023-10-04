import 'package:flutter/material.dart';
import 'package:moneymanager/screens/common_widget/money_manager.dart';
import 'package:moneymanager/screens/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: moneymanager(20),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 400,
            child: ListView(
              physics: const ScrollPhysics(),
              children: [
                Column(
                  children: [
                    const Text(
                      'LOGIN',
                      style: TextStyle(
                          fontFamily: 'archivo narrow',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  filled: true,
                                  label: Text(
                                    'Name',
                                    style: TextStyle(
                                      color: Color.fromARGB(132, 128, 128, 128),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  filled: true,
                                  label: Text(
                                    'Phone',
                                    style: TextStyle(
                                      color: Color.fromARGB(132, 128, 128, 128),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  filled: true,
                                  label: Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Color.fromARGB(132, 128, 128, 128),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: ((ctx) {
                                return  MainPage();
                              })), (route) => false);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 185, 185, 185),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 60),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            child: const Text(
                              'login',
                              style: TextStyle(fontFamily: 'irish',color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
