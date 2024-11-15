// ////------------------CODE--OPEN--CODE--OPEN--CODE--OPEN-CODE--OPEN-CODE--OPEN_______________________/////
// ////---------------------WORK CODE--WORK CODE--WORK CODE--WORK CODE--WORK CODE_______________________/////
///>>>>>>>>>>>>><<<<<<<<<<<<<<<///

// import 'dart:io';
// import 'package:daily_scavenger/bloc/product/item_bloc.dart';
// import 'package:daily_scavenger/data/models/item/item_data.dart';
// import 'package:daily_scavenger/data/models/new_items/new_item_data.dart';
// import 'package:daily_scavenger/main.dart';
// import 'package:daily_scavenger/presentation/pages/item_page/item_detail.dart';
// // import 'package:daily_scavenger/presentation/pages/item_page/item_page.dart';
// import 'package:daily_scavenger/presentation/utils/app_colors.dart';
// import 'package:daily_scavenger/presentation/utils/app_fonts.dart';
// import 'package:daily_scavenger/presentation/utils/app_router.dart';
// import 'package:daily_scavenger/widgets/buttons/default_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// // const String itemsBoxName = 'items';
// class MyItemsPage extends StatefulWidget {
//   const MyItemsPage({super.key});

//   @override
//   State<MyItemsPage> createState() => _MyItemsPageState();
// }

// class _MyItemsPageState extends State<MyItemsPage> {
//   bool ignoring = false;
//   final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {

//         return Scaffold(
//           appBar: AppBar(),
//           bottomNavigationBar: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 25,
//               vertical: 30,
//             ),
//             child: DefaultButton(
//               text: 'Add new item',
//               onTap: () {
//                     // navigate to orders page
//                     Navigator.of(context).pushNamed(AppRouter.addItemRoute);
//                   },
//             ),
//           ),
//           body: Column(
//             children: [
//               // const SizedBox(
//               //   height: 25,
//               // ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const Text(
//                     'My items',
//                     style: AppFonts.h10,
//                   ),
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: const Color(0xFF6CB1FF),
//                     child: IconButton(
//                       icon: const Icon(Icons.add),
//                       color: Colors.white,
//                       onPressed: () {

//                       },
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     width: 120,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15.0),
//                       border: Border.all(
//                           color: AppColors.gray,
//                           style: BorderStyle.solid,
//                           width: 1),
//                     ),
//                     child: DropdownButton(
//                       borderRadius: BorderRadius.circular(15),
//                       items: _dropdownValues
//                           .map((value) => DropdownMenuItem(
//                                 value: value,
//                                 child: Text(value),
//                               ))
//                           .toList(),
//                       onChanged: (value) {},
//                       isExpanded: false,
//                       value: _dropdownValues.first,
//                     ),
//                   ),
//                 ],
//               ),
//               // const SizedBox(height: 200),
//               SizedBox(
//                 height: 450,
//                 child: ValueListenableBuilder(
//         valueListenable: Hive.box<ItemData>(itemBoxName).listenable(),
//         builder: (context, Box box, widget) {
//           final items = box.values.toList();

//           if (items.isEmpty) {
//             return const Center(child: Text('Your items will be here'));
//           } else {
//             return ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 final itemData = items[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ItemDetailPage(itemData: itemData),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     child: ListTile(
//                       // title: Text('Item ${itemData.id}'),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           if (itemData.photoUrl != null)
//                             Image.file(File(itemData.photoUrl!), height: 50, width: 50, fit: BoxFit.cover),
//                           Text('Name: ${itemData.name}'),
//                           Text('Form: ${itemData.form}'),
//                           Text('Description: ${itemData.description}'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//               ),
//             ],
//           ),
//         );

//   }
// }
///>>>>>>>>>>>>><<<<<<<<<<<<<<<///

// ////---------------------WORK CODE--WORK CODE--WORK CODE--WORK CODE--WORK CODE_________________________/////

// ////------------------CODE--CLOSE--CODE--CLOSE--CODE--CLOSE--CODE--CLOSE--CODE--CLOSE__________________/////

////----------------BLOC--BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC--_______________________/////
////------------------CODE--OPEN--CODE--OPEN--CODE--OPEN-CODE--OPEN-CODE--OPEN__________________________/////
////---------------------WORK CODE--WORK CODE--WORK CODE--WORK CODE--WORK CODE_________________________//////
//////>>>>>>>>>>>>><<<<<<<<<<<<<<<///

import 'package:daily_scavenger/bloc/my_items_page_bloc/my_items_bloc.dart';
import 'package:daily_scavenger/presentation/utils/app_colors.dart';
import 'package:daily_scavenger/presentation/utils/app_fonts.dart';
import 'package:daily_scavenger/widgets/cards/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyItemsPage extends StatefulWidget {
  const MyItemsPage({super.key});

  @override
  State<MyItemsPage> createState() => _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {
  bool ignoring = false;
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
  final RefreshController _refreshController = RefreshController();


  @override
  void initState() {
    super.initState();
    // Future.delayed( Duration.zero, () {
    //   BlocProvider.of<MyItemsBloc>(context)
    //       .add(MyItemsLoadEvent());
    //           });
    context.read<MyItemsBloc>().add(MyItemsLoadEvent());
  }

  @override
  void dispose() {
    _refreshController.dispose(); 
    super.dispose();
    
  }


  Future<void> _onRefresh() async {
    try {
 
      context.read<MyItemsBloc>().add(MyItemsLoadEvent());


      await Future.delayed(const Duration(seconds: 1));

      _refreshController.refreshCompleted();
    } catch (error) {
      _refreshController.refreshFailed();
    }
  }


   @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh, 
      child: BlocBuilder<MyItemsBloc, MyItemsState>(
        builder: (context, state) {
          if (state is MyItemsLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is MyItemsLoaded) {
            return _buildLoaded(state);
          } else if (state is MyItemsFailure) {  
            return Scaffold(
              body: Center(
                child: Text(state.message), 
              ),
            );
          } else { 
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong'),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildLoaded(MyItemsLoaded state) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      bottomNavigationBar: 
      
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        child: ElevatedButton(
          onPressed: () {
            // Pass the context to the event
            context
                .read<MyItemsBloc>()
                .add(MyItemsNavigateToAddItemEvent(context));
          },
          child: const Text('Add new item'),
        ),
      ),
     
      body: Padding(
        
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'My items',
                    style: AppFonts.h10,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFF6CB1FF),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: AppColors.gray,
                          style: BorderStyle.solid,
                          width: 1),
                    ),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(15),
                      items: _dropdownValues
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      isExpanded: false,
                      value: _dropdownValues.first,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // best selling
                      if (state.items.isNotEmpty) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            // padding: const EdgeInsets.symmetric(horizontal: 25),
                            itemCount: state.items.length,
                            itemBuilder: (context, index) {
                              return Row(
                                
                                children: [
                                  Flexible(
                                    child: ItemCard(
                                      item: state.items[index],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



///>>>>>>>>>>>>><<<<<<<<<<<<<<<///

////----------------BLOC--BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC-- BLOC--_______________________/////

// ////---------------------WORK CODE--WORK CODE--WORK CODE--WORK CODE--WORK CODE_________________________/////

// ////------------------CODE--CLOSE--CODE--CLOSE--CODE--CLOSE--CODE--CLOSE--CODE--CLOSE__________________/////

//     return BlocProvider(
//         create: (context) =>
//             MyItemsBloc(),
//         child: Scaffold(
//           // appBar: AppBar(
//           //   title: const Text('My Items'),
//           // ),
//           bottomNavigationBar: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 25,
//               vertical: 30,
//             ),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Pass the context to the event
//                 context
//                     .read<MyItemsBloc>()
//                     .add(MyItemsNavigateToAddItemEvent(context));
//               },
//               child: const Text('Add new item'),
//             ),
//           ),

//           body: Padding(
//             padding: const EdgeInsets.only(top: 70.0),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     const Text(
//                       'My items',
//                       style: AppFonts.h10,
//                     ),
//                     CircleAvatar(
//                       radius: 30,
//                       backgroundColor: const Color(0xFF6CB1FF),
//                       child: IconButton(
//                         icon: const Icon(Icons.add),
//                         color: Colors.white,
//                         onPressed: () {},
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       width: 120,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         border: Border.all(
//                             color: AppColors.gray,
//                             style: BorderStyle.solid,
//                             width: 1),
//                       ),
//                       child: DropdownButton(
//                         borderRadius: BorderRadius.circular(15),
//                         items: _dropdownValues
//                             .map((value) => DropdownMenuItem(
//                                   value: value,
//                                   child: Text(value),
//                                 ))
//                             .toList(),
//                         onChanged: (value) {},
//                         isExpanded: false,
//                         value: _dropdownValues.first,
//                       ),
//                     ),
//                   ],
//                 ),
//                 BlocBuilder<MyItemsBloc, MyItemsState>(
//                   builder: (context, state) {
//                     if (state is MyItemsLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (state is MyItemsLoaded) {
//                       return ListView.builder(
//                         itemCount: state.items.length,
//                         itemBuilder: (context, index) {
//                           final item = state.items[index];
//                           return GestureDetector(
//                             onTap: () {
//                               // Pass the context to the event
//                               context.read<MyItemsBloc>().add(
//                                   MyItemsNavigateToDetailEvent(context, item));
//                             },
//                             child: Card(
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   if (item.photoUrl != null)
//                                     Image.file(File(item.photoUrl!),
//                                         height: 120,
//                                         width: 120,
//                                         fit: BoxFit.cover),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(item.name),
//                                         const SizedBox(height: 10.0),
//                                         Text(item.color),
//                                         const SizedBox(height: 10.0),
//                                         Text(item.form),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     } else if (state is MyItemsFailure) {
//                       return Center(child: Text(state.message));
//                     } else {
//                       return const Center(
//                           child: Text('Your items will be here'));
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
