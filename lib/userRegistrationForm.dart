import 'package:align_with_me/layout.dart';
import 'package:align_with_me/resultPage.dart';
import 'package:align_with_me/homePage.dart';
import 'package:flutter/material.dart';
import 'provinces.dart';
import 'districts.dart';
import 'polling_divisions.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  late List<String> _provinces;
  List<String> _districts = [];
  List<String> _pollingDivisions = [];

  final List<String> _genders = ['Male', 'Female'];
  final List<String> _ageGroups = ['18-35', '36-55'];
  final List<String> _levelsOfEducation = ['Graduate', 'School Leaver'];
  final List<String> _occupations = ['Professional', 'Technology'];

  // Define variables to store selected values
  String? _selectedProvince;
  String? _selectedDistrict;
  String? _selectedPollingDivision;
  String? _selectedGender;
  String? _selectedAgeGroup;
  String? _selectedLevelOfEducation;
  String? _selectedOccupation;

  // Define variables for email and password
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _provinces = provinces;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AlignWithMeAppBar(),
      backgroundColor: const Color.fromARGB(255, 157, 160, 163),
      body: Row(
        children: [
          const Expanded(
            flex: 1,
            child: LeftNavView(),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create an Account',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      // Dropdown for Province
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: DropdownButtonFormField(
                          value: _selectedProvince,
                          items: _provinces.map((province) {
                            return DropdownMenuItem(
                              value: province,
                              child: Text(province),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedProvince = newValue as String?;
                              _districts = districts[_selectedProvince] ?? [];
                              _selectedDistrict = null;
                              _pollingDivisions = [];
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Province',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Dropdown for District
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: DropdownButtonFormField(
                          value: _selectedDistrict,
                          items: _districts.map((district) {
                            return DropdownMenuItem(
                              value: district,
                              child: Text(district),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedDistrict = newValue as String?;
                              _pollingDivisions =
                                  pollingDivisions[_selectedDistrict] ?? [];
                              _selectedPollingDivision = null;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'District',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Dropdown for Polling Division
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: DropdownButtonFormField(
                          value: _selectedPollingDivision,
                          items: _pollingDivisions.map((division) {
                            return DropdownMenuItem(
                              value: division,
                              child: Text(division),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedPollingDivision = newValue as String?;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Polling Division',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
// Dropdown for Gender
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: DropdownButtonFormField(
                          value: _selectedGender,
                          items: _genders.map((gender) {
                            return DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedGender = newValue as String?;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Gender',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                            //border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Dropdown for Age Group
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: DropdownButtonFormField(
                          value: _selectedAgeGroup,
                          items: _ageGroups.map((ageGroup) {
                            return DropdownMenuItem(
                              value: ageGroup,
                              child: Text(ageGroup),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedAgeGroup = newValue as String?;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Age Group',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                            //border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Dropdown for Level of Education
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: DropdownButtonFormField(
                          value: _selectedLevelOfEducation,
                          items: _levelsOfEducation.map((educationLevel) {
                            return DropdownMenuItem(
                              value: educationLevel,
                              child: Text(educationLevel),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLevelOfEducation = newValue as String?;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Level of Education',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                            //border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Dropdown for Occupation
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: DropdownButtonFormField(
                          value: _selectedOccupation,
                          items: _occupations.map((occupation) {
                            return DropdownMenuItem(
                              value: occupation,
                              child: Text(occupation),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedOccupation = newValue as String?;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Occupation',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                            //border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Text Field for Email
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                            //border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Text Field for Password
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 225, 225),
                            //border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ResultPage(resultMessage: 'Success!'),
                            ),
                          );
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: RightNavView(),
          ),
        ],
      ),
    );
  }
}
