import 'package:align_with_me/layout.dart';
import 'package:align_with_me/homePage.dart';
import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart' as charts;
import 'package:align_with_me/userCreation.dart';

class ResultPage extends StatelessWidget {
  final String resultMessage;

  const ResultPage({Key? key, required this.resultMessage}) : super(key: key);

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
                //scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'This is how the candidates align with you',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildImageWithMarkAndDescription(
                      imagePath: 'assets/result.jpg',
                      mark: '87%',
                      description:
                          'Politicians are people who are politically active, especially in party politics',
                    ),
                    const SizedBox(height: 20),
                    _buildImageWithMarkAndDescription(
                      imagePath: 'assets/result.jpg',
                      mark: '70%',
                      description:
                          'Politicians are people who are politically active, especially in party politics',
                    ),
                    const SizedBox(height: 20),
                    _buildImageWithMarkAndDescription(
                      imagePath: 'assets/result.jpg',
                      mark: '42%',
                      description:
                          'Politicians are people who are politically active, especially in party politics',
                    ),
                    const SizedBox(height: 20),
                    _buildImageWithMarkAndDescription(
                      imagePath: 'assets/result.jpg',
                      mark: '10%',
                      description:
                          'Politicians are people who are politically active, especially in party politics',
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 200,
                      child: BarChartWidget(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AlighWithMeLayout()),
                            );
                          },
                          child: const Text('Restart Quiz'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            //Download, email, social media? Need account?
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: const Text('Share Results'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
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

  Widget _buildImageWithMarkAndDescription({
  required String imagePath,
  required String mark,
  required String description,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Column for image
      Column(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 10),
        ],
      ),
      const SizedBox(width: 10),
      // Column for mark
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey[700],
            height: 100,
            child: Center(
              child: Text(
                mark,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(width: 10),
      // Flexible widget for description and button
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 3, // Adjust the maxLines as needed
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navigate to the compare answers page
              },
              child: const Text('Compare Answers'),
            ),
          ],
        ),
      ),
    ],
  );
}}

class BarChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      _createSampleData(),
      animate: true,
      behaviors: [
        charts.ChartTitle('Comparison Chart',
            behaviorPosition: charts.BehaviorPosition.top,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        charts.ChartTitle('Horizontal axis',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        charts.ChartTitle('Vertical axis',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
      ],
    );
  }

  static List<charts.Series<CandidateAlignment, String>> _createSampleData() {
    final data = [
      //Random data
      CandidateAlignment('A', 80),
      CandidateAlignment('B', 75),
      CandidateAlignment('C', 85),
      CandidateAlignment('D', 70),
    ];

    return [
      charts.Series<CandidateAlignment, String>(
        id: 'Percentage',
        colorFn: (_, __) => charts.MaterialPalette.gray.shade800,
        domainFn: (CandidateAlignment alignment, _) => alignment.candidate,
        measureFn: (CandidateAlignment alignment, _) => alignment.percentage,
        data: data,
      )
    ];
  }
}

class CandidateAlignment {
  final String candidate;
  final int percentage;

  CandidateAlignment(this.candidate, this.percentage);
}
