// part of 'add_item_bloc.dart';


// abstract class AddItemState extends Equatable {
//   const AddItemState();

//   @override
//   List<Object?> get props => [];

//   AddItemState copyWith({
//     String? itemName,
//     String? itemColor,
//     String? itemForm,
//     String? itemGroup,
//     String? itemDescription,
//     XFile? itemImage,
//   });
// }

// class AddItemInitial extends AddItemState {
//   @override
//   AddItemState copyWith({
//     String? itemName,
//     String? itemColor,
//     String? itemForm,
//     String? itemGroup,
//     String? itemDescription,
//     XFile? itemImage,
//   }) {
//     return AddItemInitial(); 
//   }
// }

// class AddItemSubmitting extends AddItemState {
//   @override
//   AddItemState copyWith({
//     String? itemName,
//     String? itemColor,
//     String? itemForm,
//     String? itemGroup,
//     String? itemDescription,
//     XFile? itemImage,
//   }) {
//     return AddItemSubmitting(); 
//   }
// }

// class AddItemSuccess extends AddItemState {
//   @override
//   AddItemState copyWith({
//     String? itemName,
//     String? itemColor,
//     String? itemForm,
//     String? itemGroup,
//     String? itemDescription,
//     XFile? itemImage,
//   }) {
//     return AddItemSuccess(); 
//   }
// }

// class AddItemFailure extends AddItemState {
//   final String error;

//   const AddItemFailure({required this.error});

//   @override
//   List<Object?> get props => [error];

//   @override
//   AddItemState copyWith({
//     String? itemName,
//     String? itemColor,
//     String? itemForm,
//     String? itemGroup,
//     String? itemDescription,
//     XFile? itemImage,
//   }) {
//     return AddItemFailure(error: error); 
//   }
// }

// class AddItemFormState extends AddItemState { 
//   final String itemName;
//   final String? itemColor;
//   final String? itemForm;
//   final String? itemGroup;
//   final String? itemDescription;
//   final XFile? itemImage;

//   const AddItemFormState({
//     this.itemName = '',
//     this.itemColor,
//     this.itemForm,
//     this.itemGroup,
//     this.itemDescription,
//     this.itemImage,
//   });

//   @override
//   AddItemState copyWith({
//     String? itemName,
//     String? itemColor,
//     String? itemForm,
//     String? itemGroup,
//     String? itemDescription,
//     XFile? itemImage,
//   }) {
//     return AddItemFormState(
//       itemName: itemName ?? this.itemName,
//       itemColor: itemColor ?? this.itemColor,
//       itemForm: itemForm ?? this.itemForm,
//       itemGroup: itemGroup ?? this.itemGroup,
//       itemDescription: itemDescription ?? this.itemDescription,
//       itemImage: itemImage ?? this.itemImage,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         itemName,
//         itemColor,
//         itemForm,
//         itemGroup,
//         itemDescription,
//         itemImage,
//       ];
// }