import 'dart:io';

import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryDetailPage extends StatelessWidget {
  final PlaceData placeData;

  const HistoryDetailPage({Key? key, required this.placeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(placeData.placeName), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (placeData.photoUrl != null)
              Image.file(File(placeData.photoUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16.0),
            Text('Place Name: ${placeData.placeName}'),
            const SizedBox(height: 16.0),
            Text('Saved On: ${DateFormat('dd/MM/yyyy HH:mm').format(placeData.saveDateTime)}'),
          ],
        ),
      ),
    );
  }
}