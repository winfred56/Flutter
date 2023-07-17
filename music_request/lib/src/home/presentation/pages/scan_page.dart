import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vibration/vibration.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  /// Bloc
  // final bloc = sl<HomeBloc>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  bool loading = false;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      // Handle scanned QR code data
      Vibration.vibrate(duration: 200);
      controller.pauseCamera();
      loading = true;

      /// Retrieve the DJ Info
      ///
      loading = false;
      controller.resumeCamera();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [_buildQRView(context), _buildOverlay(context)]));
  }

  Widget _buildQRView(BuildContext context) {
    return QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.blue,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: MediaQuery.of(context).size.width * 0.8));
  }

  Widget _buildOverlay(BuildContext context) {
    return Positioned.fill(
        child: Container(
            alignment: Alignment.center,
            child: loading == true
                ? const Center(child: CircularProgressIndicator())
                : const Text('Place QR code in the frame to scan',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center)));
  }
}
