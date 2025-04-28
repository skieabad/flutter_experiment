import 'package:flutter/material.dart';

class ExperimentDetailsPage extends StatefulWidget {
  const ExperimentDetailsPage({super.key});

  @override
  State<ExperimentDetailsPage> createState() => _ExperimentDetailsPageState();
}

class _ExperimentDetailsPageState extends State<ExperimentDetailsPage> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              AspectRatio(
                aspectRatio: 0.80,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final imageHeight = constraints.maxHeight * 0.7;
                    final imageHorizontalMargin = constraints.maxWidth * 0.15;
                    final imageBottomMargin = constraints.maxHeight * 0.07;
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF3BE39),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: imageHorizontalMargin,
                                right: imageHorizontalMargin,
                                bottom: imageBottomMargin,
                              ),
                              child: Image.network(
                                'https://flutter4fun.com/wp-content/uploads/2021/09/full.png',
                                height: imageHeight,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, 26),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: CounterWidget(
                              currentCount: count,
                              color: Color(0xFFF3BE39),
                              onIncreaseClicked: () {
                                setState(() {
                                  count++;
                                });
                              },
                              onDecreaseClicked: () {
                                setState(() {
                                  count--;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 58),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Besom Orange Juice',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SimpleRatingBar(),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Drinking Orange Juice is not only enhances health body also strengthens muscles',
                      style: TextStyle(color: Color(0xFFB0B1B4), fontSize: 16),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            color: Color(0xFFD81C33),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ReviewsList(),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFFB0B1B4),
                                ),
                              ),
                              TextSpan(
                                text: '25.99',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFFDC691F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Color(0xFFF3BE39),
            padding: EdgeInsets.only(left: 24, right: 24, top: 26, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Image.network(
                    'https://flutter4fun.com/wp-content/uploads/2021/09/back.png',
                    width: 32,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'Besom.',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Image.network(
                  'https://flutter4fun.com/wp-content/uploads/2021/09/shop_white.png',
                  width: 32,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> reviewImages = [
      'https://flutter4fun.com/wp-content/uploads/2021/09/1.png',
      'https://flutter4fun.com/wp-content/uploads/2021/09/2.png',
      'https://flutter4fun.com/wp-content/uploads/2021/09/3.png',
      'https://flutter4fun.com/wp-content/uploads/2021/09/4.png',
    ];
    final addImageUrl =
        'https://flutter4fun.com/wp-content/uploads/2021/09/add.png';

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) => SizedBox(width: 18),
        itemBuilder: (_, index) {
          if (index == reviewImages.length) {
            return Image.network(addImageUrl);
          }

          return Image.network(reviewImages[index]);
        },
        itemCount: reviewImages.length + 1,
      ),
    );
  }
}

class SimpleRatingBar extends StatelessWidget {
  const SimpleRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(Icons.star, color: Color(0xFFFFBA00), size: 18),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final int currentCount;
  final Color color;
  final VoidCallback? onIncreaseClicked;
  final VoidCallback? onDecreaseClicked;
  final textStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  CounterWidget({
    super.key,
    required this.currentCount,
    required this.color,
    this.onIncreaseClicked,
    this.onDecreaseClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 16),
          GestureDetector(
            onTap: onDecreaseClicked,
            child: Icon(Icons.remove, color: Colors.white),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 30,
            child: Text(
              currentCount.toString(),
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: onIncreaseClicked,
            child: Icon(Icons.add, color: Colors.white),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
