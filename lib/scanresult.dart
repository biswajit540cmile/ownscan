import 'package:flutter/material.dart';

// class Resultpage extends StatelessWidget {
//   Resultpage(scanBarcode, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: Text('Scan result : ${Resultpage} \n',
//                 style: TextStyle(fontSize: 20))));
//   }
// }
class Resultpage extends StatelessWidget {
  String? scanBarcode;
  Resultpage(this.scanBarcode);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () =>
            Navigator.of(context).pop(),

        ),
        title: Text('My Screen'),
      ),
      body: Center(
        child: Text("Bar Code Number:$scanBarcode"),
      ),
    );
  }
}
