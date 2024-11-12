class PlaceData {
  int id; // Unique ID for the place data
  String placeName;
  DateTime saveDateTime; // Date and time of saving

  PlaceData({
    required this.id,
    required this.placeName,
    required this.saveDateTime,
  });
}