// Define a model for your item data
class ItemData {
  int id; 
  String name;
  String color;
  String form;
  String group;
  String description;
  String? photoUrl; 

  ItemData({
    required this.id,
    required this.name,
    required this.color,
    required this.form,
    required this.group,
    required this.description,
    this.photoUrl,
    
  });
}