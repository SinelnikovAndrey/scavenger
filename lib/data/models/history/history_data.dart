class PlaceData {
  int id; 
  String placeName;
  DateTime saveDateTime; 
  String? photoUrl; // Store the image path from UserData

  PlaceData({
    required this.id,
    required this.placeName,
    required this.saveDateTime,
    this.photoUrl, 
  });
}