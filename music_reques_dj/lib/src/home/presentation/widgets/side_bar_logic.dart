import 'dart:io';

import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void> generateAndSavePDF({required String qrData}) async {
  final pdf = pw.Document();

  // Add content to the PDF
  pdf.addPage(pw.Page(build: (pw.Context context) {
    return pw.Center(
        child: pw.Column(children: [
      pw.Center(child: pw.Text('SCAN UNIQUE DJ CODE BELOW TO REQUEST A SONG')),
      pw.Padding(padding: const pw.EdgeInsets.symmetric(vertical: 20)),
      pw.Center(
          child: pw.BarcodeWidget(
              barcode: pw.Barcode.qrCode(),
              data: qrData,
              width: 500,
              height: 500))
    ]));
  }));

  // Get the document directory using path_provider
  final directory = await getTemporaryDirectory();
  final path = '${directory.path}/uniqueCode.pdf';

  // Save the PDF to a file
  final file = File(path);
  await file.writeAsBytes(await pdf.save());

  // Open the PDF using open_file package
  OpenFile.open(file.path);
}


/// Open Instagram
Future<void> openInstagram({required String username}) async {
  String url = 'https://www.instagram.com/$username/';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch Instagram.';
  }
}

/// Open GitHub
Future<void> openGitHub({required String username}) async {
  String url = 'https://github.com/$username';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch GitHub.';
  }
}

/// Open Twitter
Future<void> openTwitter({required String username}) async {
  String url = 'https://twitter.com/$username';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch Twitter.';
  }
}

/// Send WhatsApp message
Future<void> openWhatsApp({required String phoneNumber}) async {
  String url =
      'https://wa.me/$phoneNumber/?text=${Uri.encodeComponent('Hello👋,\n')}';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch WhatsApp.';
  }
}