import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plant_app/pages/mainpages/qr_code_scanner_overlay.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('faild to scan');
              } else {
                final String code = barcode.rawValue!;
                debugPrint('Brcode fonde : $code');
              }
            },
          ),
          QRScannerOverlay(
            overlayColour: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
