import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VerifyRequestsPage extends StatelessWidget {

  const VerifyRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final requests =
        FirebaseFirestore.instance.collection("requests");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Requests"),
      ),

      body: StreamBuilder(
        stream: requests.snapshots(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,

            itemBuilder: (context, index) {

              var data = docs[index];

              return ListTile(

                title: Text(
                  "${data['nom']} ${data['prenom']}",
                ),

                subtitle: Text(data['status']),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [

                    IconButton(
                      icon: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),

                      onPressed: () {

                        requests.doc(data.id).update({
                          "status": "acceptée"
                        });
                      },
                    ),

                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),

                      onPressed: () {

                        requests.doc(data.id).update({
                          "status": "refusée"
                        });
                      },
                    )

                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}