import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:url_launcher/url_launcher.dart';


import '../../../../core/user/domain/entities/user.dart';
import '../../../../injection_container.dart';
import '../bloc/home_bloc.dart';

class DownloadQrPage extends StatefulWidget {
  const DownloadQrPage({Key? key, required this.onPageSelected}) : super(key: key);
  final Function(int) onPageSelected;

  @override
  State<DownloadQrPage> createState() => _DownloadQrPageState();
}

class _DownloadQrPageState extends State<DownloadQrPage> {
  /// Bloc
  final bloc = sl<HomeBloc>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Unique Qr Code'), centerTitle: true),
        body: FutureBuilder<User>(
            future: bloc.getAuthenticatedUser(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return SafeArea(
                    minimum: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                              child: QrImageView(
                            data: snapshot.requireData.id,
                            version: QrVersions.auto,
                            size: 300.0,
                          ))),
                      ElevatedButton(onPressed: () async => await downloadPdf(snapshot.requireData.id), child: const Text('Download'))
                    ]));
              } else {
                return Container();
              }
            }));
  }
}
pw.Document generatePdf(String qrData) {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text('Download'),
        );
      },
    ),
  );
  return pdf;
}

Future<void> downloadPdf(String qrData) async {
  final pdf = generatePdf(qrData);
  final bytes = await pdf.save();

  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final pdfPath = '$appDocPath/example.pdf';

  final file = File(pdfPath);
  await file.writeAsBytes(bytes);

  // Open the downloaded PDF using the default PDF viewer
  if (Platform.isAndroid) {
    await launch(pdfPath);
  }
}


