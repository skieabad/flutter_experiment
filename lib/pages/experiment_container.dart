import 'package:flutter/material.dart';

class ExperimentContainer extends StatelessWidget {
  const ExperimentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: AspectRatio(
            aspectRatio: 1.25,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final topPadding = constraints.maxHeight * 0.2;
                final leftPadding = constraints.maxWidth * 0.08;
                final imageWidth = constraints.maxWidth * 0.35;
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: topPadding),
                      decoration: BoxDecoration(
                        color: Color(0xFFDC691F),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: topPadding,
                              left: leftPadding,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Besom Orange Juice',
                                  style: textStyle.copyWith(fontSize: 20),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$',
                                        style: textStyle.copyWith(fontSize: 16),
                                      ),
                                      TextSpan(
                                        text: '25.99',
                                        style: textStyle.copyWith(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: constraints.maxHeight * 0.16,
                                  width: constraints.maxWidth * 0.36,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Add to cart',
                                      style: TextStyle(
                                        color: Color(0xFFDC691F),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: imageWidth,
                          child: Image.network(
                            "https://flutter4fun.com/wp-content/uploads/2021/09/juice2.png",
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
