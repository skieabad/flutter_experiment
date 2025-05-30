import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_experiment/pages/experiment_page.dart';
import 'package:introduction_screen/introduction_screen.dart';

class ExperimentOnBoardingPage extends StatefulWidget {
  final int initialPageIndex;

  const ExperimentOnBoardingPage({super.key, this.initialPageIndex = 0});

  @override
  ExperimentOnBoardingPageState createState() =>
      ExperimentOnBoardingPageState();
}

class ExperimentOnBoardingPageState extends State<ExperimentOnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialPageIndex > 0) {
        introKey.currentState?.animateScroll(widget.initialPageIndex);
        setState(() {
          currentPageIndex = widget.initialPageIndex;
        });
      }
    });
  }

  void _onIntroEnd(context) {
    log("triggered skip or done button");

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => ExperimentPage(
              onNavigateToFullScreenPage: () {
                log("experiment page callback triggered");
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            ExperimentOnBoardingPage(initialPageIndex: 3),
                  ),
                );
              },
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(padding: const EdgeInsets.only(top: 16, right: 16)),
        ),
      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        // PageViewModel(
        //   title: "Fractional shares",
        //   body:
        //       "Instead of having to buy an entire share, invest any amount you want.",
        //   decoration: pageDecoration,
        // ),
        // PageViewModel(
        //   title: "Learn as you go",
        //   body:
        //       "Download the Stockpile app and master the market with our mini-lesson.",
        //   decoration: pageDecoration,
        // ),
        // PageViewModel(
        //   title: "Kids and teens",
        //   body:
        //       "Kids and teens can track their stocks 24/7 and place trades that you approve.",
        //   decoration: pageDecoration,
        // ),
        PageViewModel(
          title: "Full Screen Page",
          body:
              "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            bodyFlex: 2,
            imageFlex: 3,
            safeArea: 100,
          ),
        ),
        PageViewModel(
          title: "Another title page",
          body: "Another beautiful body text for this example onboarding",
          footer: ElevatedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'FooButton',
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Title of last page - reversed",
          bodyWidget: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Click on ", style: bodyStyle),
              Icon(Icons.edit),
              Text(" to edit a post", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () {},
      showSkipButton: true,
      showBottomPart: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      back: const Icon(Icons.arrow_back),
      skip: const Text(
        'Skip',
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
      ),
      next: const Icon(Icons.arrow_forward),
      showDoneButton: false,
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding:
          kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: currentPageIndex == 2 ? Size(0, 0) : Size(10.0, 10.0),
        activeSize: currentPageIndex == 2 ? Size(0, 0) : Size(22.0, 10.0),
        activeColor: Color(0xFFDC691F),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        color: Color(0xFFBDBDBD),
      ),
      globalFooter:
          currentPageIndex == 2
              ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        overlayColor: Color(0xFF104C89).withValues(alpha: 0.1),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0xFF104C89),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6.0),
                          width: currentPageIndex == index ? 24.0 : 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color:
                                currentPageIndex == index
                                    ? const Color(0xFFDC691F)
                                    : const Color(0xFFBDBDBD),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        overlayColor: Color(0xFF104C89).withValues(alpha: 0.1),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: Color(0xFF104C89),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )
              : SizedBox.shrink(),
      // Container of the dots
      // dotsContainerDecorator: const ShapeDecoration(
      //   color: Colors.black87,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
      //   ),
      // ),
      onChange: (index) {
        setState(() {
          currentPageIndex = index;
        });
      },
    );
  }
}
