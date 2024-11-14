import 'dart:io';

import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:daily_scavenger/main.dart';
import 'package:daily_scavenger/presentation/pages/history_item/history_detail.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; 


class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Box<HistoryData> placeBox;

  @override
  void initState() {
    super.initState();
    placeBox = Hive.box<HistoryData>(placeBoxName);
  }

  @override
  void dispose() {
    placeBox.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ValueListenableBuilder(
        valueListenable: placeBox.listenable(),
        builder: (context, Box<HistoryData> box, widget) {
          final places = box.values.toList();

          if (places.isEmpty) {
            return const Center(child: Text('No history found'));
          } else {
            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final placeData = places[index];
                final formattedDateTime = DateFormat('dd/MM/yyyy HH:mm').format(placeData.saveDateTime); // Format date and time

                return GestureDetector( // Add GestureDetector to each card
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryDetailPage(historyData: placeData),
                      ),
                    );
                  },
                  child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (placeData.photoUrl != null)
                      Image.file(File(placeData.photoUrl!), height: 120, width: 120, fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(placeData.itemName),
                      const SizedBox(height: 10.0),
                      Text(formattedDateTime),
                      const SizedBox(height: 10.0),
                      Text('${placeData.itemGroup}'),
                      const SizedBox(height: 10.0),
                      Text(placeData.placeName),
                                      
                      ],),
                    ),
                    
                  ],
                ),
              ),
            ),
                  // Card(
                  //   child: ListTile(
                  //     leading: placeData.photoUrl != null
                  //         ? Image.file(File(placeData.photoUrl!), height: 50, width: 50, fit: BoxFit.cover)
                  //         : const Icon(Icons.person), 
                  //     title: Text(placeData.itemName),
                  //     subtitle: Column(
                  //       children: [
                  //         Text('Saved on: $formattedDateTime'),
                  //         Text(placeData.placeName),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                );
              },
            );
          }
        },
      ),
    );
  }
}