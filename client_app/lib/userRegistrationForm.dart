import 'package:align_with_me/layout.dart';
import 'package:align_with_me/resultPage.dart';
import 'package:align_with_me/homePage.dart';
import 'package:flutter/material.dart';
import 'provinces.dart';
import 'districts.dart';
import 'polling_divisions.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  late List<String> _provinces;
  List<String> _districts = [];
  List<String> _pollingDivisions = [];
  final _formKey = GlobalKey<FormState>();

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
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _provinces = provinces;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    // if (_formKey.currentState!.validate()) {
    //   final response = await http.post(
    //     Uri.parse('http://localhost:8082/api_v1/users'),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(<String, dynamic>{
    //       'name': _nameController.text,
    //       'province': _selectedProvince,
    //       'district': _selectedDistrict,
    //       'pollingDivision': _selectedPollingDivision,
    //       'gender': _selectedGender,
    //       'ageGroup': _selectedAgeGroup,
    //       'levelOfEducation': _selectedLevelOfEducation,
    //       'occupation': _selectedOccupation,
    //       'email': _emailController.text,
    //       'password': _passwordController.text,
    //     }),
    //   );

    //   if (response.statusCode == 201) {
    //     // User added successfully
    //     print('User added successfully');
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => const ResultPage(
    //                 resultMessage: 'Hi User',
    //               )),
    //     );
    //   } else {
    //     // Failed to add user
    //     print('Failed to add user: ${response.reasonPhrase}');
    //     // Show error message or handle error accordingly
    //     //this is for temorary usage only
    //   }
    // }
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20.0),
                      // Dropdown for Province
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: DropdownButtonFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a province';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Province *',
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a district';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'District *',
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a polling division';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Polling Division *',
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
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        //onPressed: _submitForm,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, proceed with form submission
                            // _submitForm();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ResultPage(
                                  resultMessage: '',
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text('Submit'),
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
