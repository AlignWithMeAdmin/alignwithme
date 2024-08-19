import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'quizPage.dart';

bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 600;
bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

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
                    child: Padding(
                      padding:EdgeInsets.all(20.0),
                      child: Text(
                        'Get the following quiz and answer it to see who align with your views of governance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
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
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0), // Add horizontal padding
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      children: [
                        Text(
                          'Align With Me is a web application designed by Digital Democracy Collective Sri Lanka to help voters understand political leaders\' positions on key issues. We focus on the five most prominent issues currently facing the country. For each issue, users are presented with four choices that span the spectrum of possible opinions—from progressive to regressive, liberal to conservative, and democratic to authoritarian.',//The definition of candidate selection methods is the predominantly nonstandardized and unregimented mechanisms by which political parties choose their candidates for the general elections. The importance of candidate selection is not only for the candidates and their parties, but also for their parent legislature and its performance – it influences the balance of power within the party, determines the personal composition of parliaments, and impacts on the behavior of legislators.
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 20), // Add space between the two texts
                        Text(
                          'Users can see which political leaders share similar stances by selecting the options that best reflect their views. This process allows voters to base their decisions on factual alignments rather than being swayed by populist strategies. Align With Me aims to promote a more informed and transparent democratic process, helping voters make choices that truly reflect their values and priorities.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 20), // Add space between the two texts
                        Text(
                          'About Digital Democracy Collective Sri Lanka',
                          style:TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                          )
                        ),
                        SizedBox(height: 20), // Add space between the two texts
                        Text.rich(
                          TextSpan(
                            text: 'This web application is developed and maintained by ',
                            children: <TextSpan>[
                              TextSpan(text: ' Digital Democracy Collective Sri Lanka ', style: TextStyle(fontStyle: FontStyle.italic)),
                              TextSpan(
                                text: '. Digital Democracy Collective Sri Lanka is a dynamic community uniting passionate software/IT/digital engineers with the help of tech enthusiasts, activists, policymakers, and citizens dedicated to harnessing technological innovation for democratic advancement in Sri Lanka.', 
                                
                              ),
                            ],
                            style:TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            )
                          ),
                        ),
                        SizedBox(height: 20), // Add space between the two texts
                        Text(
                          'Our Mission',
                          style:TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          )
                        ),
                        SizedBox(height: 20), // Add space between the two texts
                        Text(
                          'We are committed to exploring the intersection of technology and democracy, leveraging relevant engineering expertise, and innovative digital solutions to bolster democratic processes and civic engagement across Sri Lanka.',
                          style:TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          )
                        ),
                        SizedBox(height: 20), // Add space between the two texts
                        Text(
                          'Key Focus Areas',
                          style:TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          )
                        ),
                        SizedBox(height: 20), // Add space between the two texts
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Technology for Civic Empowerment:',
                                style:TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0,)
                              ),
                              TextSpan(
                                text: ' Explore and develop cutting-edge technological tools and platforms that empower citizens, enhance transparency, and foster inclusive participation in governance.',
                                style:TextStyle(color: Colors.black, fontSize: 16.0,)
                              )
                            ]
                          )
                        ),
                        SizedBox(height: 20), // Add space between the two texts
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Engineering Solutions for Democracy:',
                                style:TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0,)
                              ),
                              TextSpan(
                                text: ' Channel engineering skills to design and implement digital initiatives that address challenges in democratic processes, ensuring efficiency, accessibility, and accountability.',
                                style:TextStyle(color: Colors.black, fontSize: 16.0,)
                              )
                            ]
                          )
                        ),
                        SizedBox(height: 20), // Add space between the two texts
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Collaboration and Knowledge Sharing:',
                                style:TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0,)
                              ),
                              TextSpan(
                                text: ' Foster a collaborative environment where expertise and knowledge sharing lead to the creation of impactful projects and initiatives at the intersection of technology and democracy.',
                                style:TextStyle(color: Colors.black, fontSize: 16.0,)
                              )
                            ]
                          )
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Contact us at admin@alignwithme.org',
                          style:TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          )
                        )
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

class TopNavView extends StatelessWidget{
  const TopNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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

class BottomNavView extends StatelessWidget{
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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

class ResponsiveRowColumn extends StatelessWidget {
  final List<Widget> children;

  ResponsiveRowColumn({required this.children});

  @override
  Widget build(BuildContext context) {
    return isDesktop(context) ? Row(children: children) : Column(children: children);
  }
}