import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_layout/business_layout.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/text_style.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vibration/vibration.dart';

class QrCodeScannerPage extends StatefulWidget {
  static const String id = "/qrCodeScannerPage";

  const QrCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerPage> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            overlay: QrScannerOverlayShape(
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
              borderWidth: 10,
              // borderLength: 20,
              borderRadius: 10,
              borderColor: myColorIsActive,
            ),
            onQRViewCreated: _onQRViewCreated,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(child: _buildControllButtons()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: BlocBuilder<OrdersToFulfillBloc, OrdersToFulfillState>(
                builder: (context, state) {
                  String? barcodeText = state.barcodeText;
                  return (barcodeText != null)
                      ? Text(
                          barcodeText,
                          style: myTextStyleFontS8Sans(
                            context: context,
                            fontSize: 30,
                            textColor: Colors.white,
                          ),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          'Отсканируйте QR code',
                          style: myTextStyleFontS8Sans(
                            context: context,
                            textColor: theme.textTheme.bodyLarge!.color!,
                          ),
                          textAlign: TextAlign.center,
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen(
      (scanData) async {
        final bloProvider = BlocProvider.of<OrdersToFulfillBloc>(context);
        if (scanData.code != null &&
            (bloProvider.state.barcodeText != scanData.code)) {
          if (await Vibration.hasVibrator() ?? false) {
            Vibration.vibrate();
          }

          bloProvider.add(
            AddBarcodeFromScannerEvent(barcodeText: scanData.code!),
          );
          Navigator.of(context).canPop() ? Navigator.of(context).pop() : null;
        }
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget _buildControllButtons() {
    return IconButton(
      onPressed: () async {
        await controller?.toggleFlash();
        setState(() {});
      },
      icon: FutureBuilder<bool?>(
        future: controller?.getFlashStatus(),
        builder: (context, snaphhot) {
          if (snaphhot.data != null) {
            return Icon(
              snaphhot.data! ? Icons.flash_on : Icons.flash_off,
              size: 40,
              color: Colors.white70,
            );
          } else {
            return Icon(
              Icons.flash_off,
              size: 40,
              color: Colors.white70,
            );
          }
        },
      ),
    );
  }
}
