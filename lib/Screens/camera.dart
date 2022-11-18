import 'package:facerecognition/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Camera extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const Camera({this.cameras, super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late List<CameraDescription> cameras;

  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          ClipRect(
            child: Transform.scale(
              scale: controller.value.aspectRatio,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1 / controller.value.aspectRatio,
                  child: CameraPreview(controller),
                ),
              ),
            ),
          ),
          Container(
            decoration: const ShapeDecoration(
              shape: CardScannerOverlayShape(
                borderColor: Colors.white,
                borderRadius: 12,
                borderLength: 36,
                borderWidth: 8,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 5, top: 5),
            alignment: const Alignment(0, 0.9),
            child: TextButton(
              onPressed: () async {
                pictureFile = await controller.takePicture();
                setState(() {});
              },
              style: const ButtonStyle(),
              child: const Icon(Icons.camera, size: 40, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
