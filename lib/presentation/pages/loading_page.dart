import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final bool isDetailPage;
  const LoadingPage({Key? key, required this.isDetailPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: isDetailPage
            ? AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: const Text('Comic Book', style: TextStyle(color: Colors.black)),
                elevation: 0,
                leading: const BackButton(color: Colors.black),
              )
            : null,
        body: const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
