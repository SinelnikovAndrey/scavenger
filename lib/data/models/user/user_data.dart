// Define a model for your user data
class UserData {
  String displayName;
  String email;
  String phoneNumber;
  String? photoUrl; // Can be null if no image is uploaded

  UserData({
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    this.photoUrl,
  });
}