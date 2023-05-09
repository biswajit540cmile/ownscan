import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:impscan/scanresult.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> scanQR() async {
    String barcodeScanRes;

    try {
      return barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      //print(barcodeScanRes);
    } on PlatformException {
      return barcodeScanRes = '';
    }

    //if (!mounted) return;
    //return '';
    // setState(() {
    // scanBarcode = barcodeScanRes;
    //  if (barcodeScanRes != null)
    //  {
    //    Navigator.of(context).push(MaterialPageRoute(
    //        builder: (context) => Resultpage(barcodeScanRes)));
    //  }
    //  });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue[900],
                centerTitle: true,
                title: const Text('Barcode Scanner')),
            body: Builder(builder: (BuildContext context) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Please Click To",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 30,
                            fontFamily: "Inter"),
                      ),
                    ),
                    Center(
                      child: Text(
                        "'Scan'",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 30,
                            fontFamily: "Inter"),
                      ),
                    ),
                    SizedBox(),
                    InkWell(
                      onTap: () async{ //scanQR();
                        var data = await scanQR();
                        if(data != null && data != "" && data != '-1' ){
                          Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Resultpage(data)));
                        }

                      },

                      // : Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => MyApp())),

                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: const BoxDecoration(
                            color: Color(0xFF014DC5), shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            Icons.scanner,
                            color: Colors.blue[700],
                            size: 48.0,
                          ),
                        ),
                      ),
                    ),
                    // Text('Scan result : $scanBarcode\n',
                    //     style: TextStyle(fontSize: 20))
                  ]);

              //  Container(
              //     alignment: Alignment.center,
              //     child: Flex(
              //         direction: Axis.vertical,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: <Widget>[
              //           ElevatedButton(
              //               onPressed: () => scanQR(),
              //               child: Text('Start QR scan')),
              //           Text('Scan result : $_scanBarcode\n',
              //               style: TextStyle(fontSize: 20))
              //         ])
              //         );
            })));
  }
}









// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:impscan/scanresult.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String scanBarcode = 'Unknown';
//   String? barcodeScanRes;

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> scanQR() async {
//     // String barcodeScanRes;

//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       // print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }

//     if (!mounted) return;

//     setState(() {
//       scanBarcode = barcodeScanRes!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(
//                 backgroundColor: Colors.blue[900],
//                 centerTitle: true,
//                 title: const Text('Barcode Scanner')),
//             body: Builder(builder: (BuildContext context) {
//               return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Center(
//                       child: Text(
//                         "Please Click To",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 30,
//                             fontFamily: "Inter"),
//                       ),
//                     ),
//                     Center(
//                       child: Text(
//                         "'Scan'",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 30,
//                             fontFamily: "Inter"),
//                       ),
//                     ),
//                     SizedBox(),
//                     InkWell(
//                       onTap: () => {
//                         scanQR(),
//                         if (scanBarcode != "")
//                           {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => Resultpage(scanBarcode))),
//                           },

//                         // : Navigator.of(context).push(MaterialPageRoute(
//                         //     builder: (context) => MyApp())),
//                       },
//                       child: Container(
//                         height: 56,
//                         width: 56,
//                         decoration: const BoxDecoration(
//                             color: Color(0xFF014DC5), shape: BoxShape.circle),
//                         child: Center(
//                           child: Icon(
//                             Icons.scanner,
//                             color: Colors.blue[700],
//                             size: 48.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Text('Scan result : $scanBarcode\n',
//                     //     style: TextStyle(fontSize: 20))
//                   ]);

//               //  Container(
//               //     alignment: Alignment.center,
//               //     child: Flex(
//               //         direction: Axis.vertical,
//               //         mainAxisAlignment: MainAxisAlignment.center,
//               //         children: <Widget>[
//               //           ElevatedButton(
//               //               onPressed: () => scanQR(),
//               //               child: Text('Start QR scan')),
//               //           Text('Scan result : $_scanBarcode\n',
//               //               style: TextStyle(fontSize: 20))
//               //         ])
//               //         );
//             })));
//   }
// }
