import 'package:align_with_me/layout.dart';
import 'package:align_with_me/homePage.dart';
import 'package:flutter/material.dart';
import 'userCreation.dart';

class QuizView extends StatefulWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question':
          'What is your opinion on the role of government in managing the country\'s economy ?',
      'options': [
        'Believe in an economy which is mostly in control of the government',
        'Prefer a mixed economy with some government intervention and some free-market principles',
        'Believe in deregulation and privatization of most industries',
        'Advocate for laissez-faire capitalism with minimal government interference',
        'No Opinion',
      ],
      'selectedValue': '',
    },
    {
      'question': 'What is your opinion on taxation and wealth distribution ?',
      'options': [
        'Support higher taxes on the wealthy and income redistribution',
        'Prefer a progressive tax system with moderate wealth redistribution',
        'Advocate for lower taxes and limited government spending.',
        'Support significant tax cuts and minimal wealth redistribution',
        'No Opinion',
      ],
      'selectedValue': '',
    },
    {
      'question': 'What is your opinion on taxation and wealth distribution ?',
      'options': [
        'Support higher taxes on the wealthy and income redistribution',
        'Prefer a progressive tax system with moderate wealth redistribution',
        'Advocate for lower taxes and limited government spending.',
        'Support significant tax cuts and minimal wealth redistribution',
        'No Opinion',
      ],
      'selectedValue': '',
    },
    {
      'question': 'What is your opinion on taxation and wealth distribution ?',
      'options': [
        'Support higher taxes on the wealthy and income redistribution',
        'Prefer a progressive tax system with moderate wealth redistribution',
        'Advocate for lower taxes and limited government spending.',
        'Support significant tax cuts and minimal wealth redistribution',
        'No Opinion',
      ],
      'selectedValue': '',
    },
    {
      'question': 'What is your opinion on subsidized goods and services ?',
      'options': [
        'Strongly support government subsidies to ensure access to essential goods and services for all citizens',
        'Prefer targeted subsidies for those in need while maintaining market competition',
        'Advocate for minimal government intervention in subsidizing essential goods and services',
        'Strongly oppose government subsidies and believe they distort market mechanisms',
        'No Opinion',
      ],
      'selectedValue': '',
    },
  ];

  bool get isSubmitButtonEnabled {
    // Check if all questions have been answered
    return _questions.every((question) =>
        question['selectedValue'] != ''); // Check if option is selected
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPageIndex < _questions.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      setState(() {
        _currentPageIndex++;
      });
    }
  }

  void _previousPage() {
    if (_currentPageIndex > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      setState(() {
        _currentPageIndex--;
      });
    }
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('2024 Presidential Quiz'),
      //   backgroundColor: const Color.fromARGB(255, 64, 97, 124),
      // ),
      appBar: const AlignWithMeAppBar(),
      body: Row(
        children: [
          const Expanded(
            flex: 1,
            child: LeftNavView(),
          ),
          Expanded(
            flex: 3, // Adjust the flex factor as needed
            child: PageView.builder(
              controller: _pageController,
              itemCount: _questions.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildQuestionPage(context, index);
              },
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

  Widget _buildQuestionPage(BuildContext context, int index) {
    final isLastQuestion = index == _questions.length - 1;
    final question = _questions[index]['question'] as String;
    final bool isOptionSelected = _questions[index]['selectedValue'] != '';

    return Container(
      color: const Color.fromARGB(255, 157, 160, 163),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          const Text(
            '2024 Presidential Quiz',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
              height: 10.0), // Add some spacing between the title and question
          Text(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _questions[index]['options']
                .map<Widget>((option) => RadioListTile<String>(
                      title: Text(option,
                          style: const TextStyle(color: Colors.black)),
                      value: option,
                      groupValue: _questions[index]['selectedValue'],
                      onChanged: (value) {
                        setState(() {
                          _questions[index]['selectedValue'] = value;
                        });
                      },
                    ))
                .toList(),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (index > 0)
                ElevatedButton(
                  onPressed: _previousPage,
                  child: const Text('Previous'),
                ),
              const SizedBox(width: 20.0),
              if (isLastQuestion)
                ElevatedButton(
                  onPressed: isSubmitButtonEnabled
                      ? () {
                          _navigateToLoginPage(
                              context); // Navigate to LoginPage
                        }
                      : null, // Disable button if not all questions are answered
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSubmitButtonEnabled
                        ? const Color.fromARGB(255, 97, 98, 99)
                        : Colors
                            .grey, // Change button color based on enabled state
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 10, 10),
                    ),
                  ),
                ),
              if (!isLastQuestion && index < _questions.length - 1)
                ElevatedButton(
                  onPressed: isOptionSelected
                      ? _nextPage
                      : null, // Disable button if no option selected
                  child: const Text('Next'),
                ),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
