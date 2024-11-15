// import 'dart:io';

// import 'package:daily_scavenger/bloc/my_items_page_bloc/my_items_bloc.dart';
// import 'package:daily_scavenger/data/models/item/item_data.dart';
// import 'package:daily_scavenger/presentation/pages/history_item/add_place.dart';
// import 'package:daily_scavenger/presentation/pages/item_page/edit_item.dart';
// import 'package:daily_scavenger/presentation/utils/app_colors.dart';
// import 'package:daily_scavenger/presentation/utils/app_fonts.dart';
// import 'package:daily_scavenger/widgets/buttons/default_button.dart';
// import 'package:daily_scavenger/widgets/buttons/round_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ItemDetailPage extends StatelessWidget {
//   final ItemData id; // Now itemId is a String
    
//    ItemDetailPage({super.key, required this.id});


  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           id.name,
//           style: AppFonts.h10,
//         ),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: RoundButton(
//               icon: Icons.edit,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => EditItemPage(itemData: id),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar:Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: DefaultButton(text: 'Add Place', onTap: () {Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   AddPlacePage(itemId: id.id),
//                             ),
//                           );})
//                       // ElevatedButton(
//                       //   onPressed: () {
//                       //     Navigator.push(
//                       //       context,
//                       //       MaterialPageRoute(
//                       //         builder: (context) =>
//                       //             AddPlacePage(itemId: item.id),
//                       //       ),
//                       //     );
//                       //   },
//                       //   child: const Text('Add Place'),
//                       // ),
//                     ),
      
//       body: BlocBuilder<MyItemsBloc, MyItemsState>(
//         builder: (context, state) {
//           if (state is MyItemsLoaded) {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     if (id.photoUrl != null)
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image.file(File(id.photoUrl!),
//                             height: MediaQuery.of(context).size.height * 0.4,
//                             width: MediaQuery.of(context).size.width * 0.9,
//                             fit: BoxFit.cover),
//                       ),
//                     const SizedBox(height: 16.0),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(20)
//                       ),
//                       height: MediaQuery.of(context).size.height * 0.09,
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text('Form',style: AppFonts.h6,),
//                             // SizedBox(height: 5,),
//                             Text(id.form),
//                           ],
//                         ),
//                       )),
//                        const SizedBox(height: 16.0),
//                       Row(
//                         children: [
//                           Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(),
//                             borderRadius: BorderRadius.circular(20)
//                           ),
//                            height: MediaQuery.of(context).size.height * 0.09,
//                             width: MediaQuery.of(context).size.width * 0.68,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text('Color',style: AppFonts.h6,),
                                
//                                 Text(id.color),
                                
//                               ],
//                             ),
//                           )),
//                           const SizedBox(width: 10.0),
//                           ColorBox(color: colorMap[id.color]!)
//                         ],
//                       ),
//                        const SizedBox(height: 16.0),
//                       Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(20)
//                       ),
//                       height: MediaQuery.of(context).size.height * 0.09,
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text('Group',style: AppFonts.h6,),
//                             // SizedBox(height: 5,),
//                             Text(id.group),
//                           ],
//                         ),
//                       )),
//                        const SizedBox(height: 16.0),
//                       Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(20)
//                       ),
//                       height: MediaQuery.of(context).size.height * 0.09,
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text('Description',style: AppFonts.h6,),
//                             // SizedBox(height: 5,),
//                             Text(id.description),
//                           ],
//                         ),
//                       )),
//                   ],
//                 ),
//               ),
//             );
//           } else if (state is MyItemsLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is MyItemsFailure) {
//             return Center(child: Text(state.message));
//           } else {
//             return const Center(child: Text('Something went wrong'));
//           }
//         },
//       ),
//     );
//   }
// }


// class ColorBox extends StatelessWidget {
//   final Color color;

//   const ColorBox({super.key, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.09,
//       width: MediaQuery.of(context).size.width * 0.20,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }


////----------------BLOC--BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC--_______________________/////
////------------------CODE--OPEN--CODE--OPEN--CODE--OPEN-CODE--OPEN-CODE--OPEN__________________________/////
////---------------------WORK CODE--WORK CODE--WORK CODE--WORK CODE--WORK CODE_________________________//////
//////>>>>>>>>>>>>><<<<<<<<<<<<<<<///

import 'dart:io';

import 'package:daily_scavenger/bloc/my_items_page_bloc/my_items_bloc.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/presentation/pages/history_item/add_place.dart';
import 'package:daily_scavenger/presentation/utils/app_colors.dart';
import 'package:daily_scavenger/presentation/utils/app_fonts.dart';
import 'package:daily_scavenger/widgets/buttons/next_fab.dart';
import 'package:daily_scavenger/widgets/cards/item_card.dart';
import 'package:daily_scavenger/widgets/cards/item_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailPage extends StatefulWidget {

  final ItemData id;
  const ItemDetailPage({super.key, required this.id});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  bool ignoring = false;
  late ItemData item;

  @override
  void initState() {
    super.initState();
    item = widget.id; 
    context.read<MyItemsBloc>().add(LoadCurrentItemEvent(itemId: item.id));
  }

  @override
void dispose() {
  super.dispose();
}

 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyItemsBloc, MyItemsState>(
      builder: (context, state) {
        if (state is MyItemsLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CurrentItemLoaded) {
          return _buildLoaded(state);
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          );
        }
      },
    );
  }

  Widget _buildLoaded(CurrentItemLoaded state) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          NextFab(onPressed: () { Navigator.pop(context); },)
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 30,
        ),
        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddPlacePage(itemId: item.id),
                            ),
                          );
                        },
                        child: const Text('Add Place'),
                      ),
                    ),
      ),
      body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.currentItem.photoUrl != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(File(state.currentItem.photoUrl!),
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.9,
                            fit: BoxFit.cover),
                      ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Form',style: AppFonts.h6,),
                            // SizedBox(height: 5,),
                            Text(state.currentItem.form),
                          ],
                        ),
                      )),
                       const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)
                          ),
                           height: MediaQuery.of(context).size.height * 0.09,
                            width: MediaQuery.of(context).size.width * 0.68,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Color',style: AppFonts.h6,),
                                
                                Text(state.currentItem.color),
                                
                              ],
                            ),
                          )),
                          const SizedBox(width: 10.0),
                          ColorBox(color: colorMap[state.currentItem.color]!)
                        ],
                      ),
                       const SizedBox(height: 16.0),
                      Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Group',style: AppFonts.h6,),
                            // SizedBox(height: 5,),
                            Text(state.currentItem.group),
                          ],
                        ),
                      )),
                       const SizedBox(height: 16.0),
                      Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Description',style: AppFonts.h6,),
                            // SizedBox(height: 5,),
                            Text(state.currentItem.description),
                          ],
                        ),
                      )),
                  ],
                ),
              ),
            ));
          // } else if (state is MyItemsLoading) {
          //   return const Center(child: CircularProgressIndicator());
          // } else if (state is MyItemsFailure) {
          //   return Center(child: Text(state.message));
          // } else {
          //   return const Center(child: Text('Something went wrong'));
          // }
        }
 
  }


class ColorBox extends StatelessWidget {
  final Color color;

  const ColorBox({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}


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
