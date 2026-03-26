import 'package:flutter/material.dart';
import '../../data/repositories/request_repository.dart';

class CreateRequestPage extends StatelessWidget {

  CreateRequestPage({super.key});

  final RequestRepository repo = RequestRepository();

  final nom = TextEditingController();
  final prenom = TextEditingController();
  final cin = TextEditingController();
  final entreprise = TextEditingController();
  final motif = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Request"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: nom,
              decoration: const InputDecoration(labelText: "Nom"),
            ),

            TextField(
              controller: prenom,
              decoration: const InputDecoration(labelText: "Prenom"),
            ),

            TextField(
              controller: cin,
              decoration: const InputDecoration(labelText: "CIN / Passport"),
            ),

            TextField(
              controller: entreprise,
              decoration: const InputDecoration(labelText: "Entreprise"),
            ),

            TextField(
              controller: motif,
              decoration: const InputDecoration(labelText: "Motif"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Submit Request"),
              onPressed: () async {

                await repo.createRequest({
                  "nom": nom.text,
                  "prenom": prenom.text,
                  "cin": cin.text,
                  "entreprise": entreprise.text,
                  "motif": motif.text,
                  "status": "en attente"
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Demande envoyée")),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}