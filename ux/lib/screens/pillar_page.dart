import 'package:flutter/material.dart';
import '../services/api_service.dart';

class PillarPage extends StatelessWidget {
  final String pillarName;

  const PillarPage({super.key, required this.pillarName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pillarName)),
      body: FutureBuilder<String>(
        future: ApiService.fetchPillarData(pillarName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('❌ Error: ${snapshot.error}'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text(snapshot.data ?? 'No data'),
            );
          }
        },
      ),
    );
  }
}