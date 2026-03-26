import 'package:flutter/material.dart';
import '../../../access_request/data/repositories/request_repository.dart';
import '../../../access_request/data/models/request_model.dart';

class CustomsDashboard extends StatelessWidget {

  const CustomsDashboard({super.key});

  @override
  Widget build(BuildContext context) {

    final repo = RequestRepository();

    return Scaffold(

      appBar: AppBar(
        title: const Text("Customs Dashboard"),
      ),

      body: StreamBuilder<List<RequestModel>>(

        stream: repo.getRequests(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final requests = snapshot.data!;

          return ListView.builder(

            itemCount: requests.length,

            itemBuilder: (context, index) {

              final request = requests[index];

              if (request.status != "acceptée") {
                return const SizedBox();
              }

              return ListTile(

                title: Text("${request.nom} ${request.prenom}"),

                subtitle: Text("Entreprise : ${request.entreprise}"),
              );
            },
          );
        },
      ),
    );
  }
}