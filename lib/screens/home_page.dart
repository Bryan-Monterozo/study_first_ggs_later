import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:study_first_ggs_later/widgets/progress_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Pomodoro Timer'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text('Pomodoro number: 2',
                  style: TextStyle(fontSize: 32, color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              const Text('Set: 3',
                  style: TextStyle(fontSize: 22, color: Colors.white)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 220.0,
                      lineWidth: 15.0,
                      percent: 0.3,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: const Text(
                        '12:00',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      progressColor: Colors.red,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ProgressIcons(
                      total: 4,
                      done: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
