import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Detail extends StatefulWidget{
  @override 
  State createState() => _DetailState();
}

class _DetailState extends State<Detail>{
  bool _isLoading = false;
  PDFDocument document;

  @override

  void initState(){
    _loadPdf().then((value){

    });
    super.initState();
  }

  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Detail'),
          backgroundColor: Colors.deepOrange,
        ),
      
      body: Center(
        child: _isLoading ? 
        Center(
          child: CircularProgressIndicator(),
          ):PDFViewer(document: document,
          showPicker: true,)),

    );
  }

  Future _loadPdf() async{
    document = await PDFDocument.fromAsset("lib/assets/file/sample.pdf");
    print(document);
    setState(() {
     _isLoading = false; 
    });
  }
}