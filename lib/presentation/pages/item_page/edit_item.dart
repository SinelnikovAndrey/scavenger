import 'dart:io';

import 'package:daily_scavenger/bloc/my_items_page_bloc/my_items_bloc.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/main.dart';
import 'package:daily_scavenger/presentation/utils/app_colors.dart';
import 'package:daily_scavenger/presentation/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditItemPage extends StatefulWidget {
  final ItemData itemData;

  const EditItemPage({super.key, required this.itemData});

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _colorController = TextEditingController();
  final _formController = TextEditingController();
  final _groupController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  final _imagePicker = ImagePicker();
  File? _image;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.itemData.name;
    _colorController.text = widget.itemData.name;
    _formController.text = widget.itemData.form;
    _groupController.text = widget.itemData.group;
    _descriptionController.text = widget.itemData.description;
    
    _imageUrl = widget.itemData.photoUrl;
  }

  Future<void> _selectImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery, // or ImageSource.camera
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imageUrl = pickedFile.path;
      });
    }
  }

  Future<void> _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      final box = await Hive.openBox<ItemData>(itemBoxName);

      // Update the ItemData object in Hive
      final updatedItem = ItemData(
        id: widget.itemData.id,
        name: _nameController.text.trim(),
        color: _colorController.text.trim(),
        form: _formController.text.trim(),
        group: _groupController.text.trim(),
        description: _descriptionController.text.trim(),
        photoUrl: _imageUrl,
      );
      await box.put(widget.itemData.id.toString(), updatedItem);

      // Navigate back to the previous screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Item'),
      ),
      body: BlocBuilder<MyItemsBloc, MyItemsState>(
        builder: (context, state) {
          if (state is MyItemsLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // if (id.photoUrl != null)
                    GestureDetector(
                      onTap: _selectImage,
                      child: Container(
                        // color: AppColors.darkBorderGray,
                      
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColors.darkBorderGray,),
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Image.file(File(_imageUrl!),
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.9,
                            fit: BoxFit.cover),
                        
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: TextFormField(
                            controller: _nameController,
                            decoration:
                                const InputDecoration(labelText: 'Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
                          ),
                        )),
                    const SizedBox(height: 16.0),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: TextFormField(
                            controller: _colorController,
                            decoration:
                                const InputDecoration(labelText: 'Color'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a color';
                              }
                              return null;
                            },
                          ),
                        )),
                    const SizedBox(height: 16.0),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: TextFormField(
                            controller: _formController,
                            decoration:
                                const InputDecoration(labelText: 'Form'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a form';
                              }
                              return null;
                            },
                          ),
                        )),
                    const SizedBox(height: 16.0),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: TextFormField(
                            controller: _groupController,
                            decoration:
                                const InputDecoration(labelText: 'Group'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a group';
                              }
                              return null;
                            },
                          ),
                        )),
                    const SizedBox(height: 16.0),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: TextFormField(
                            controller: _nameController,
                            decoration:
                                const InputDecoration(labelText: 'Description'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a description';
                              }
                              return null;
                            },
                          ),
                        )),
                    const SizedBox(height: 16.0),
                    
              ElevatedButton(
                onPressed: _saveChanges,
                child: const Text('Save Changes'),)
                  ],
                ),
              ),
            );
          } else if (state is MyItemsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MyItemsFailure) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
