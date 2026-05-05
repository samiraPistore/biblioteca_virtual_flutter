import 'package:bibliot/components/resgister_form.dart';
import 'package:flutter/material.dart';

class ResgisterPage extends StatelessWidget {
  const ResgisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 40.0, 
          
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xfffd7f4122f51), const Color(0xfff0d6a6a)],
          ),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ResgisterForm()],
          ),
        ),
      ),
    );
  }
}
