
// class _UserDisplayPageState extends State<UserDisplayPage> {
//   // ... other code ...

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Data'),
//       ),
//       body: ValueListenableBuilder(
//         valueListenable: Hive.box<UserData>(userBoxName).listenable(),
//         builder: (context, Box<UserData> box, widget) {
//           // Access all users in the box
//           final users = box.values.toList();

//           if (users.isEmpty) {
//             return const Center(child: Text('No user data found'));
//           } else {
//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 final userData = users[index];
//                 return Card(
//                   child: ListTile(
//                     title: Text('User ${userData.id}'), // Show the user's ID
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if (userData.photoUrl != null)
//                           Image.file(File(userData.photoUrl!), height: 50, width: 50, fit: BoxFit.cover),
//                         Text('Display Name: ${userData.displayName}'),
//                         Text('Email: ${userData.email}'),
//                         Text('Phone Number: ${userData.phoneNumber}'),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }