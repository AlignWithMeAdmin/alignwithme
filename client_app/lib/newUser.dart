import 'package:align_with_me/homePage.dart';
import 'package:align_with_me/layout.dart';
import 'package:align_with_me/userRegistrationForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'CREATE NEW USER',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      PaddedWidget(
                        child: 
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            labelText: 'Email *',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            } else if (!EmailValidator.validate(value)) {   // Email validation logic
                                return 'Please enter a valid email';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      PaddedWidget(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            labelText: 'Username *',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      PaddedWidget(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password *',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                          ),
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            // Password validation logic
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      PaddedWidget(
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Confirm Password *',
                              filled: true,
                              fillColor: Color.fromARGB(255, 228, 225, 225),
                            ),
                            controller: _confirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ),
                      const SizedBox(height: 15),
                      PaddedWidget(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Form is valid, perform next action
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationForm()),
                              );
                            }
                          },
                          child: const Text('Next'),
                        ),
                      ),
                    ],
                  ),
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
