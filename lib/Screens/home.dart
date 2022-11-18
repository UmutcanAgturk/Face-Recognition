import 'package:camera/camera.dart';
import 'package:facerecognition/Screens/camerav2.dart';
import 'package:facerecognition/Screens/screens.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Öğrenci Takip Programı"),
        backgroundColor: Colors.orange,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontStyle: FontStyle.italic, fontSize: 25),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: const Alignment(0, 0.9),
                child: ElevatedButton(
                  onPressed: () async {
                    await availableCameras().then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Camera(
                            cameras: value,
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text('Kamerayı Aç'),
                ),
              )
            ],
          ),
          Row(children: [
            /* ElevatedButton(
            onPressed: () async {
              await availableCameras().then(
                (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraV2(),
                  ),
                ),
              );
            },
            child: const Text('Yapay Zekalı Kamerayı Aç'),
          ),*/
          ]),
        ],
      ),
    );
  }
}
