import 'dart:io';
import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:daily_scavenger/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HistoryDetailPage extends StatefulWidget {
   final HistoryData historyData;

  const HistoryDetailPage({super.key, required this.historyData});

  @override
  State<HistoryDetailPage> createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
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

                return Padding(
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
                            );
              },
            );
          }
        },
      ),
    );
  }
}


// class HistoryDetailPage extends StatelessWidget {
//   final HistoryData historyData;

//   const HistoryDetailPage({Key? key, required this.historyData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(historyData.itemName), 
//         actions: [
//           ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => EditHistoryPage(placeData: historyData,),
//               ),
//             );
//           },
//           child: const Text('Edit Item'),
//         ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (historyData.photoUrl != null)
//               Image.file(File(historyData.photoUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),
//             const SizedBox(height: 16.0),
//             Text('Place: ${historyData.itemName}'),
//             const SizedBox(height: 16.0),
//             Text('Saved On: ${DateFormat('dd/MM/yyyy HH:mm').(historyData.fetchDate)}'),
//             const SizedBox(height: 16.0),
//             Text('Place: ${historyData.placeName}'),
//             const SizedBox(height: 16.0),
//             if (historyData.placePhotoUrl != null)
//               Image.file(File(historyData.placePhotoUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),
//           ],
//         ),
//       ),
//     );
//   }
// }