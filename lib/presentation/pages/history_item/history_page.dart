import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/presentation/pages/history_item/history_detail.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; 
import 'dart:io'; 

const String itemBoxName = 'items';
const String placeBoxName = 'places';
class HistoryPage extends StatefulWidget {

  const HistoryPage({Key? key, }) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Box<PlaceData> placeBox;
  late Box<ItemData> itemBox; 

  @override
  void initState() {
    super.initState();
    placeBox = Hive.box<PlaceData>(placeBoxName);
    itemBox = Hive.box<ItemData>(itemBoxName);
  }

  @override
  void dispose() {
    placeBox.close();
    itemBox.close();
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
                final formattedDateTime = DateFormat('dd/MM/yyyy HH:mm').format(placeData.saveDateTime);

                return GestureDetector( // Add GestureDetector to each card
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryDetailPage(placeData: placeData),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: placeData.photoUrl != null
                          ? Image.file(File(placeData.photoUrl!), height: 50, width: 50, fit: BoxFit.cover)
                          : const Icon(Icons.person), 
                      title: Text(placeData.placeName),
                      subtitle: Text('Saved on: $formattedDateTime'),
                    ),
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