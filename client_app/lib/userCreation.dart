import 'package:align_with_me/newUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:align_with_me/layout.dart';
import 'package:align_with_me/userRegistrationForm.dart';
import 'package:align_with_me/homePage.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AlignWithMeAppBar(),
      backgroundColor: const Color.fromARGB(255, 157, 160, 163),
      body: ResponsiveRowColumn(
        children: [
          if (isDesktop(context))
            const Expanded(
              flex: 1,
              child: LeftNavView(),
            )
          else
            const Expanded(
                flex: 1,
                child: TopNavView(),
              ),
          Expanded(
            flex: isDesktop(context) ? 3: 8,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    PaddedWidget(
                      child: TextFormField(
                        decoration: const InputDecoration(
                        labelText: 'User Id',
                        filled: true,
                        fillColor: Color.fromARGB(255, 228, 225, 225),
                        //border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    PaddedWidget(
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Color.fromARGB(255, 228, 225, 225),
                          //border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: PaddedWidget(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Login'),
                            ),
                          ),
                        ),
                      ]
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: PaddedWidget(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RegistrationForm()),
                                );
                              },
                              icon: const Icon(Icons.facebook, color: Colors.white),
                              label: const Text(
                                'Sign Up with Facebook',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: PaddedWidget(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RegistrationForm()),
                                );
                              },
                              icon: const Icon(Icons.mail, color: Colors.white),
                              label: const Text(
                                'Sign Up with Gmail',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: PaddedWidget(                    
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const NewUser()),
                                );
                              },
                              child: const Text('Create New Account'),
                            ),
                          ),
                        ),
                      ]
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: PaddedWidget(                    
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RegistrationForm()),
                                );
                              },
                              child: const Text('Continue as Guest'),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isDesktop(context))
            const Expanded(
              flex: 1,
              child: RightNavView(),
            )
          else
            const Expanded(
                flex: 1,
                child: BottomNavView(),
              ),
        ],
      ),
    );
  }
}