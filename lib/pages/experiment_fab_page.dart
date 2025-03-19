import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_experiment/utils/colors.dart';

class ExperimentFabPage extends StatefulWidget {
  const ExperimentFabPage({super.key});

  @override
  State<ExperimentFabPage> createState() => _ExperimentFabPageState();
}

class _ExperimentFabPageState extends State<ExperimentFabPage>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;
  var _isOpened = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _animationController ?? AnimationController(vsync: this),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlutterExperimentColors.primaryColor,
        title: const Text('Experiment Fab Page'),
      ),
      body: Center(child: Text('Experiment Fab Page')),
      floatingActionButton: FloatingActionBubble(
        items: [
          Bubble(
            title: "Scan",
            iconColor: Colors.white,
            bubbleColor: FlutterExperimentColors.primaryColor,
            icon: Icons.camera_alt,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              _animationController?.reverse();
            },
          ),
          // Floating action menu item
          Bubble(
            title: "Enter manually",
            iconColor: Colors.white,
            bubbleColor: FlutterExperimentColors.primaryColor,
            icon: Icons.more,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              _animationController?.reverse();
            },
          ),
        ],

        // animation controller
        animation: _animation ?? AnimationController(vsync: this),

        // On pressed change animation state
        onPress: () {
          setState(() {
            _isOpened = !_isOpened;
            _isOpened
                ? _animationController?.forward()
                : _animationController?.reverse();
          });
        },

        // Floating Action button Icon color
        iconColor: Colors.white,

        // Flaoting Action button Icon
        iconData: _isOpened ? Icons.close : Icons.menu,
        backGroundColor:
            _isOpened ? Colors.redAccent : FlutterExperimentColors.primaryColor,
      ),
    );
  }
}
