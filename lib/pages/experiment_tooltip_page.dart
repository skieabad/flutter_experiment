import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

class ExperimentTooltipPage extends StatefulWidget {
  const ExperimentTooltipPage({super.key});

  @override
  State<ExperimentTooltipPage> createState() => _ExperimentTooltipPageState();
}

class _ExperimentTooltipPageState extends State<ExperimentTooltipPage> {
  final _controller = SuperTooltipController();

  void makeTooltip() {
    _controller.showTooltip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment Tooltip')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: GestureDetector(
            onTap: () async {
              await _controller.showTooltip();
            },
            child: SuperTooltip(
              showBarrier: true,
              controller: _controller,
              content: const Text(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr,",
                style: TextStyle(color: Colors.black),
              ),
              shadowColor: Colors.transparent,
              shadowOffset: const Offset(0, 0),
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
