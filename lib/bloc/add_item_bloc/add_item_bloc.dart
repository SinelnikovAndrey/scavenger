// import 'package:bloc/bloc.dart';
// import 'package:daily_scavenger/data/models/item/item_data.dart';
// import 'package:equatable/equatable.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'dart:math';

// part 'add_item_event.dart';
// part 'add_item_state.dart';

// class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
//   final Box<ItemData> itemBox;

//   AddItemBloc({required this.itemBox}) : super(AddItemFormState()) {
//     on<AddItemNameChangedEvent>(_onItemNameChanged);
//     on<AddItemColorChangedEvent>(_onItemColorChanged);
//     on<AddItemFormChangedEvent>(_onItemFormChanged);
//     on<AddItemGroupChangedEvent>(_onItemGroupChanged);
//     on<AddItemDescriptionChangedEvent>(_onItemDescriptionChanged);
//     on<AddItemImagePickedEvent>(_onAddItemImagePicked);
//     on<AddItemSubmittedEvent>(_onAddItemSubmitted);
//   }

//   void _onItemNameChanged(
//       AddItemNameChangedEvent event, Emitter<AddItemState> emit) {
//     if (state is AddItemFormState) {
//       emit((state as AddItemFormState).copyWith(itemName: event.itemName));
//     }
//   }

//   void _onItemColorChanged(
//       AddItemColorChangedEvent event, Emitter<AddItemState> emit) {
//     if (state is AddItemFormState) {
//       emit((state as AddItemFormState).copyWith(itemColor: event.itemColor));
//     }
//   }

//   void _onItemFormChanged(
//       AddItemFormChangedEvent event, Emitter<AddItemState> emit) {
//     if (state is AddItemFormState) {
//       emit((state as AddItemFormState).copyWith(itemForm: event.itemForm));
//     }
//   }

//   void _onItemGroupChanged(
//       AddItemGroupChangedEvent event, Emitter<AddItemState> emit) {
//     if (state is AddItemFormState) {
//       emit((state as AddItemFormState).copyWith(itemGroup: event.itemGroup));
//     }
//   }

//   void _onItemDescriptionChanged(
//       AddItemDescriptionChangedEvent event, Emitter<AddItemState> emit) {
//     if (state is AddItemFormState) {
//       emit((state as AddItemFormState).copyWith(itemDescription: event.itemDescription));
//     }
//   }

//   void _onAddItemImagePicked(
//       AddItemImagePickedEvent event, Emitter<AddItemState> emit) {
//     if (state is AddItemFormState) {
//       emit((state as AddItemFormState).copyWith(itemImage: event.itemImage));
//     }
//   }

//   Future<void> _onAddItemSubmitted(
//       AddItemSubmittedEvent event, Emitter<AddItemState> emit) async {
//     emit(AddItemSubmitting()); // Update to loading state
//     try {
//       final itemId = _generateId(); // Generate a unique ID (now an integer)
//       if (state is AddItemFormState) {
//         final itemData = ItemData(
//           id: itemId, // Correctly use itemId as an int
//           name: (state as AddItemFormState).itemName,
//           color: (state as AddItemFormState).itemColor ?? '',
//           form: (state as AddItemFormState).itemForm ?? '',
//           group: (state as AddItemFormState).itemGroup ?? '',
//           description: (state as AddItemFormState).itemDescription ?? '',
//           photoUrl: (state as AddItemFormState).itemImage != null
//               ? (state as AddItemFormState).itemImage!.path
//               : null,
//         );
//         await itemBox.put(itemId.toString(), itemData); // Save to Hive
//         emit(AddItemSuccess()); // Update to success state
//       } else {
//         print('Error: State is not AddItemFormState');
//         emit(AddItemFailure(error: 'Error: State is not AddItemFormState'));
//       }
//     } catch (e) {
//       emit(AddItemFailure(error: e.toString())); // Update to error state
//     }
//   }

//   int _generateId() { // Now returns an integer
//     var random = Random();
//     return random.nextInt(1000000); // Generate a random integer
//   }
// }