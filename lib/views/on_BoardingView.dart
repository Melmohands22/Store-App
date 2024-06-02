import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app/views/homeView.dart';
import 'package:store_app/widgets/customOnBoarding.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static String id = 'OnBoardingView';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<int>(
          valueListenable: _currentPageNotifier,
          builder: (context, currentPage, child) {
            return Text('Page ${currentPage + 1} of ${data.length}');
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                    (route) => false);
              },
              child: Text('Skip',
                  style: TextStyle(fontSize: 18, color: Colors.orange)))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) =>
                  OnBoardingBuilder(
                      image: data[index].image,
                      fText: data[index].fText,
                      sText: data[index].sText,
                      fDesc: data[index].fDesc,
                      sDesc: data[index].sDesc),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                SmoothPageIndicator(
                  controller: pageController, // Assign the PageController here
                  count: data.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.orange,
                    dotColor: Colors.black,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                TextButton(
                  onPressed: () {
                    if (currentIndex < data.length - 1) {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
                          (route) => false);
                    }
                  },
                  child: Text(
                    currentIndex == data.length - 1 ? 'Finish' : 'Next',
                    style: TextStyle(fontSize: 18, color: Colors.orange),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
