import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:bibliot/models/book_model.dart';
import 'package:flutter/material.dart';

class PdfPage extends StatelessWidget {
  final Book book;

  const PdfPage(this.book,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body:FutureBuilder(
        future: PDFDocument.fromURL('https://www.coreknowledge.org/wp-content/uploads/2023/08/CC_Frankenstein_Reader_W1.pdf'),// Simula o carregamento do PDF
        builder: (context, snapshot) {
          if (snapshot.hasData) {
           return PDFViewer(document: snapshot.data ?? PDFDocument(),
           );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}