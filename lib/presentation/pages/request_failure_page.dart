import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RequestFailurePage extends StatelessWidget {
  final String errorMsg;
  final bool isDetailPage;
  const RequestFailurePage({Key? key, required this.errorMsg, required this.isDetailPage}) : super(key: key);

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
                leading: const DetailBackButton(),
              )
            : null,
        body: Center(
          child: Text(errorMsg),
        ),
      ),
    );
  }
}
