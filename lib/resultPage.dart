import 'package:align_with_me/layout.dart';
import 'package:align_with_me/homePage.dart';
import 'package:flutter/material.dart';

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
                scrollDirection: Axis.horizontal,
                child: Column(
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
        // Column for mark and description
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mark,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
