import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

    return MaterialApp(
      home: Scaffold(
        /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
          child: Icon(Icons.arrow_back_ios),
          backgroundColor: Colors.green,
        ),*/

        bottomNavigationBar: Container(
          height: 38,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FlatButton(
                  child: Text(
                    '  Continue  ',
                    style: TextStyle(),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.pink, width: 2),
                  ),
                  color: Colors.white,
                  textColor: Colors.pink,
                  padding: const EdgeInsets.all(5),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
        ),
        body: SfPdfViewer.network(
          'https://www.nedbank.co.za/content/dam/nedbank/site-assets/Terms/Nedbank%20MobiMoney%20Account%20final.pdf',
          key: _pdfViewerKey,
        ),
      ),
    );
  }
}
//https://www.nedbank.co.za/content/dam/nedbank/site-assets/Terms/Nedbank%20MobiMoney%20Account%20final.pdf
