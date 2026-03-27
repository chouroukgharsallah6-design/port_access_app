import 'package:flutter/material.dart';
import '../../../access_request/data/models/request_model.dart';
import '../../../access_request/data/repositories/request_repository.dart';

class VerifyRequestsPage extends StatelessWidget {
  const VerifyRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final requestsRepo = RequestRepository();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Requests'),
      ),
      body: StreamBuilder<List<RequestModel>>(
        stream: requestsRepo.getRequests(),
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
              final data = requests[index];

              return ListTile(
                title: Text('${data.nom} ${data.prenom}'),
                subtitle: Text(data.status),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      onPressed: () async {
                        await requestsRepo.updateRequestStatus(
                          id: data.id,
                          status: 'acceptee',
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        await requestsRepo.updateRequestStatus(
                          id: data.id,
                          status: 'refusee',
                        );
                      },
                    ),
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
