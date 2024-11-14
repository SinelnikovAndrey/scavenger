import 'dart:io';

import 'package:daily_scavenger/bloc/my_items_page_bloc/my_items_bloc.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ItemDetailPage extends StatelessWidget {
  final ItemData id; // Now itemId is a String

  const ItemDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Detail'),
      ),
      body: BlocBuilder<MyItemsBloc, MyItemsState>(
        builder: (context, state) {
          if (state is MyItemsLoaded) {
            // final itemData = state.items.firstWhere(
            //   (item) => item.id == id, // Comparison is now with == for String
            //   orElse: () => ItemData(id: '-1', name: 'Item not found', color: '', form: ''), // Handle case where item is not found
            // );

            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (id.photoUrl != null)
              Image.file(File(id.photoUrl!),
                  height: 120, width: 120, fit: BoxFit.cover),
                    const SizedBox(height: 16.0),
                    Text('Name: ${id.name}'),
                    const SizedBox(height: 16.0),
                    Text('Form: ${id.form}'),
                    const SizedBox(height: 16.0),
                    Text('Group: ${id.group}'),
                    const SizedBox(height: 16.0),
                    Text('Description Number: ${id.description}'),
                    
                  ],
                ),
              );
          } else if (state is MyItemsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MyItemsFailure) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}



////----------------BLOC--BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC--_______________________/////
////------------------CODE--OPEN--CODE--OPEN--CODE--OPEN-CODE--OPEN-CODE--OPEN__________________________/////
////---------------------WORK CODE--WORK CODE--WORK CODE--WORK CODE--WORK CODE_________________________//////
//////>>>>>>>>>>>>><<<<<<<<<<<<<<<///

// import 'package:daily_scavenger/bloc/my_items_page_bloc/my_items_bloc.dart';
// import 'package:daily_scavenger/data/models/item/item_data.dart';
// import 'package:daily_scavenger/presentation/pages/history_item/add_place.dart';
// import 'package:daily_scavenger/widgets/cards/item_card.dart';
// import 'package:daily_scavenger/widgets/cards/item_detail_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ItemDetailPage extends StatefulWidget {
//   const ItemDetailPage({super.key});

//   @override
//   State<ItemDetailPage> createState() => _ItemDetailPageState();
// }

// class _ItemDetailPageState extends State<ItemDetailPage> {
//   bool ignoring = false;

//   @override
//   void initState() {
//     super.initState();
//     context.read<MyItemsBloc>().add(MyItemsLoadEvent());
//   }

//   late ItemData item;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MyItemsBloc, MyItemsState>(
//       builder: (context, state) {
//         if (state is MyItemsLoading) {
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         } else if (state is MyItemsLoaded) {
//           return _buildLoaded(state);
//         } else {
//           return const Scaffold(
//             body: Center(
//               child: Text('Something went wrong'),
//             ),
//           );
//         }
//       },
//     );
//   }

//   Widget _buildLoaded(MyItemsLoaded state) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 25,
//           vertical: 30,
//         ),
//         child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   AddPlacePage(itemId: item.id),
//                             ),
//                           );
//                         },
//                         child: const Text('Add Place'),
//                       ),
//                     ),
//       ),
//       body: SingleChildScrollView(
        
//         child: SizedBox(
//                   height: 550,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     itemCount: state.items.length,
//                     itemBuilder: (context, index) {
//                       return Row(
//                         children: [
//                           ItemDetailCard(
//                             item: state.items,
//                           ),
                         
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//       ),
//     );
//   }
// }


///>>>>>>>>>>>>><<<<<<<<<<<<<<<///

////----------------BLOC--BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC--_______________________/////

// ////---------------------WORK CODE--WORK CODE--WORK CODE--WORK CODE--WORK CODE_________________________/////

// ////------------------CODE--CLOSE--CODE--CLOSE--CODE--CLOSE--CODE--CLOSE--CODE--CLOSE__________________/////

// import 'dart:io';

// import 'package:daily_scavenger/data/models/new_items/new_item_data.dart';
// import 'package:flutter/material.dart';
// import 'package:daily_scavenger/data/models/item/item_data.dart'; // Import ItemData

// class ItemDetailPage extends StatelessWidget {
//   final ItemData itemData; // Receive itemData in the constructor

//   const ItemDetailPage({Key? key, required this.itemData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Display itemData details here
//     return Scaffold(
//       appBar: AppBar(title: Text(itemData.name)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (itemData.photoUrl != null)
//               Image.file(File(itemData.photoUrl!), height: 120, width: 120, fit: BoxFit.cover),
//             Text('Name: ${itemData.name}'),
//             Text('Color: ${itemData.color}'),
//             Text('Form: ${itemData.form}'),
//             Text('Group: ${itemData.group}'),
//             Text('Description: ${itemData.description}'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:daily_scavenger/data/models/item/item_data.dart';
// import 'package:daily_scavenger/presentation/pages/history_item/add_place.dart';
// import 'package:daily_scavenger/presentation/pages/item_page/edit_item.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';

// class ItemDetailPage extends StatelessWidget {
//   final ItemData itemData;

//   const ItemDetailPage({Key? key, required this.itemData, }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Item ${itemData.id}'),

//         actions: [
//           ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => EditItemPage(itemData: itemData),
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
//             if (itemData.photoUrl != null)
//               Image.file(File(itemData.photoUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),
//             const SizedBox(height: 16.0),
//             Text('Name: ${itemData.name}'),
//             const SizedBox(height: 16.0),
//             Text('Form: ${itemData.form}'),
//             const SizedBox(height: 16.0),
//             Text('Group: ${itemData.group}'),
//             const SizedBox(height: 16.0),
//             Text('Description Number: ${itemData.description}'),

//             Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AddPlacePage(itemId: itemData.id),
//                   ),
//                 );
//               },
//               child: const Text('Add Place'),
//             ),
//           ),
//           ],

//         ),
//       ),
//     );
//   }
// }
