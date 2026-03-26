import 'package:flutter/material.dart';

class RequestStatusPage extends StatelessWidget {

  const RequestStatusPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Status"),
      ),

      body: ListView(
        children: const [

          ListTile(
            title: Text("Request #1"),
            subtitle: Text("Status: En attente"),
          ),

          ListTile(
            title: Text("Request #2"),
            subtitle: Text("Status: Acceptée"),
          )

        ],
      ),
    );
  }
}