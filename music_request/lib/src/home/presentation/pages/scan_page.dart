import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:music_request/shared/presentation/ui/navigation_helper.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vibration/vibration.dart';

import '../../../../core/request/presentation/pages/request_page.dart';
import '../../../../injection_container.dart';
import '../bloc/home_bloc.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key, required this.onPageSelected}) : super(key: key);
  final Function(int) onPageSelected;

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  /// Bloc
  final bloc = sl<HomeBloc>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      // Handle scanned QR code data
      Vibration.vibrate(duration: 200);
      controller.pauseCamera();
      loading.value = true;

      /// Retrieve the DJ Info
      print('============================  ${scanData.code}');
      await bloc.retrieve(scanData.code!).then((value) => NavigationHelper.push(context, RequestPage(dj: value)));
      loading.value = false;
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 0),
        body: Stack(children: [
          _buildQRView(context),
          SafeArea(
            child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                        onTap: () => widget.onPageSelected(0),
                        child: const Column(children: [
                          Icon(Ionicons.musical_notes, color: Colors.white),
                          Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text('Library',
                                  style: TextStyle(color: Colors.white)))
                        ])))),
          ),
          SafeArea(
            child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                        onTap: () => widget.onPageSelected(2),
                        child: const Column(children: [
                          Icon(Ionicons.person, color: Colors.white),
                          Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text('Profile',
                                  style: TextStyle(color: Colors.white)))
                        ])))),
          ),
          _buildOverlay(context)
        ]));
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
            child: ValueListenableBuilder<bool>(
              valueListenable: loading,
              builder: (BuildContext context, value, _) {
                return loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : const Text('Place QR code in the frame to scan',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center);
              },
            )));
  }
}
