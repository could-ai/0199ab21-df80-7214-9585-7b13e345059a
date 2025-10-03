import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SlidesScreen extends StatefulWidget {
  const SlidesScreen({super.key});

  @override
  _SlidesScreenState createState() => _SlidesScreenState();
}

class _SlidesScreenState extends State<SlidesScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Osteoarthritis Presentation'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          _buildSlide(
            title: 'Osteoarthritis',
            content: 'An overview of the condition, its causes, and symptoms.',
          ),
          _buildSlide(
            title: 'Case Study 1',
            content: 'Patient: John Doe\nAge: 65\nSymptoms: Joint pain and stiffness\nTreatment: Physical therapy and medication',
          ),
          _buildSlide(
            title: 'Case Study 2',
            content: 'Patient: Jane Smith\nAge: 72\nSymptoms: Limited range of motion\nTreatment: Lifestyle modifications and pain management',
          ),
          _buildSlide(
            title: 'Handling and Prevention',
            content: 'Strategies for managing osteoarthritis and preventing its progression.',
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: _currentPage > 0
                  ? () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  : null,
            ),
            Text('Slide ${_currentPage + 1} of 4'),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: _currentPage < 3
                  ? () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlide({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
