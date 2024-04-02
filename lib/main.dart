import 'package:flutter/material.dart';
import 'package:stateful/slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double iconSize = 300;
  double redSliderValue = 0;
  double greenSliderValue = 0;
  double blueSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter State'),
          actions: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (iconSize > 50) {
                    iconSize -= 50;
                  }
                });
              },
            ),
            IconButton(
              icon: const Text('S'),
              onPressed: () {
                setState(() {
                  iconSize = 50;
                });
              },
            ),
            IconButton(
              icon: const Text('M'),
              onPressed: () {
                setState(() {
                  iconSize = 300;
                });
              },
            ),
            IconButton(
              icon: const Text('L'),
              onPressed: () {
                setState(() {
                  iconSize = 500;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  if (iconSize < 500) {
                    iconSize += 50;
                  }
                });
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Icon(
                  Icons.lock_clock,
                  size: iconSize,
                  color: Color.fromRGBO(redSliderValue.toInt(),
                      greenSliderValue.toInt(), blueSliderValue.toInt(), 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Slider(
                      activeColor: Colors.red,
                      value: redSliderValue,
                      min: 0,
                      max: 255,
                      onChanged: (value) {
                        setState(() {
                          redSliderValue = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    redSliderValue.toInt().toString(),
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Slider(
                      activeColor: Colors.green,
                      value: greenSliderValue,
                      min: 0,
                      max: 255,
                      onChanged: (value) {
                        setState(() {
                          greenSliderValue = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    greenSliderValue.toInt().toString(),
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ColorSlider(
                  color: Colors.blue,
                  value: blueSliderValue,
                  fn: (value) {
                    setState(() {
                      blueSliderValue = value;
                    });
                  }),
            ),
          ],
        ));
  }
}
