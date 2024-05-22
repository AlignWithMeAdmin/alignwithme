import 'package:flutter/material.dart';
import 'quizPage.dart';

//Left sidebar
class LeftNavView extends StatelessWidget {
  const LeftNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 205, 209, 245),
      child: const Center(
          // child: ElevatedButton(
          //   onPressed: () {
          //     // Navigate or perform actions related to LeftNavView
          //   },
          //   child: const Text('Left Nav'),
          // ),
          ),
    );
  }
}

//home page content
class ContentView extends StatelessWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/backImg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  const Center(
                    child: Text(
                      '2024 Presidential Quiz',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Center(
                    child: Text(
                      'Get the following quiz and answer it to see who align with your views of governance',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuizView()),
                        );
                      },
                      child: const Text('Quiz'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(
                  20.0), // Add padding around the container
              child: Container(
                color: const Color.fromARGB(255, 157, 160, 163),
                child: SingleChildScrollView(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0), // Add horizontal padding
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      children: [
                        Text(
                          'The definition of candidate selection methods is the predominantly nonstandardized and unregimented mechanisms by which political parties choose their candidates for the general elections. The importance of candidate selection is not only for the candidates and their parties, but also for their parent legislature and its performance – it influences the balance of power within the party, determines the personal composition of parliaments, and impacts on the behavior of legislators.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 20), // Add space between the two texts
                        Text(
                          'The definition of candidate selection methods is the predominantly nonstandardized and unregimented mechanisms by which political parties choose their candidates for the general elections.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//right sidebar
class RightNavView extends StatelessWidget {
  const RightNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 205, 209, 245),
      child: Center(
          // child: ElevatedButton(
          //   onPressed: () {
          //     // Navigate or perform actions related to red view
          //   },
          //   child: const Text('Right Nav'),
          // ),
          ),
    );
  }
}
