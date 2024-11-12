import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; 

// ... Your UserData, PlaceData models, and other pages ...
const String placeBoxName = 'places';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Box<PlaceData> placeBox;

  @override
  void initState() {
    super.initState();
    placeBox = Hive.box<PlaceData>(placeBoxName);
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
        builder: (context, Box<PlaceData> box, widget) {
          final places = box.values.toList();

          if (places.isEmpty) {
            return const Center(child: Text('No history found'));
          } else {
            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final placeData = places[index];
                final formattedDateTime = DateFormat('dd/MM/yyyy HH:mm').format(placeData.saveDateTime); // Format date and time

                return Card(
                  child: ListTile(
                    title: Text(placeData.placeName),
                    subtitle: Text('Saved on: $formattedDateTime'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}