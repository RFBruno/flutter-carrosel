import 'package:carrosel/components/slide_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0;

  final List<Map<String, dynamic>> _listSlide = [
    {'id': 0, 'image': 'assets/images/space-2543838_960_720.jpg'},
    {'id': 1, 'image': 'assets/images/stars-2643089_960_720.jpg'},
    {'id': 2, 'image': 'assets/images/eclipse-1492818_960_720.jpg'}
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _listSlide.length,
                itemBuilder: (_, currentIndex) {
                  bool activePage = currentIndex == _currentPage;
                  String currentImageUrl =
                      _listSlide[currentIndex]['image'].toString();
                  return SlideTile(
                    activePage: activePage,
                    imageUrl: currentImageUrl,
                  );
                },
              ),
            ),
            _buildBullets()
          ],
        ),
      ),
    );
  }

  Widget _buildBullets() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _listSlide.map((slide) {
            return InkWell(
              onTap: () {
                setState(() {
                  _pageController.jumpToPage(slide['id']);
                  _currentPage = slide['id'];
                });
              },
              child: Container(
                margin: const EdgeInsets.all(6),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: slide['id'] == _currentPage
                        ? Colors.red.shade700
                        : Colors.blueGrey),
              ),
            );
          }).toList()),
    );
  }
}
