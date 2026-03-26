import 'package:flutter/material.dart';
import 'create_request_page.dart';
import 'request_status_page.dart';

class ClientDashboard extends StatelessWidget {

  const ClientDashboard({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Client Dashboard"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            ElevatedButton(
              child: const Text("Create Access Request"),
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateRequestPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Check Request Status"),
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RequestStatusPage(),
                  ),
                );
              },
            )

          ],
        ),
      ),
    );
  }
}