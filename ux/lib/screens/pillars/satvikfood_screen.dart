import 'package:flutter/material.dart';

class SatvikFoodScreen extends StatelessWidget {
  const SatvikFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
Scaffold(

      backgroundColor: Color(0xFFFFF8E1),
      appBar: AppBar(
        backgroundColor: Color(0xFF8B4513),
        title: Text(title, style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Color(0xFFFFECB3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'More content coming soon...',
                  style: TextStyle(fontSize: 16, color: Colors.brown),
                ),
              ),
            ),
          ],
        ),
      ),

        title: const Text('Satvik Food', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
        child: Text('Content for Satvik Food', style: TextStyle(color: Color(0xFF5E2600), fontSize: 18)),
      ),
    );
  }
}