import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
// import 'package:lottie/lottie.dart';

class TimmingPage extends StatefulWidget {
  const TimmingPage({super.key});

  @override
  State<TimmingPage> createState() => _TimmingPageState();
}

class _TimmingPageState extends State<TimmingPage> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 85.0),
          child: Text("T I M E"),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // Lottie.asset(
            //   './assets/anim1',
            //   width: 100,
            //   height: 100,
            //   fit: BoxFit.cover,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    controller: hourController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: "Hour",
                      hintStyle: TextStyle(color: Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      contentPadding: EdgeInsets.only(left: 12, bottom: 10),
                    ),
                  ),
                ),
                const AvatarGlow(
                  endRadius: 140,
                  glowColor: Colors.black87,
                  duration: Duration(milliseconds: 2000),
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: Icon(Icons.av_timer_outlined),
                ),
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    controller: minuteController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: "Minutes",
                      hintStyle: TextStyle(color: Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      contentPadding: EdgeInsets.only(left: 1, bottom: 10),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                child: const Text(
                  "Create Your Reminder",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  int hour;
                  int minutes;
                  hour = int.parse(hourController.text);
                  minutes = int.parse(minuteController.text);
                  FlutterAlarmClock.createAlarm(hour: hour, minutes: minutes);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                FlutterAlarmClock.showAlarms();
              },
              child: const Text(
                "Your Alarms",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
