// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../list_of_posts_controller.dart';
// import 'widgets/filter_chips_status.dart';

// class Filters extends StatefulWidget {
//   @override
//   _FiltersState createState() => _FiltersState();
// }

// class _FiltersState extends State<Filters> {
//   ListOfPostsController controllerList;
//   @override
//   void initState() {
//     controllerList = Provider.of<ListOfPostsController>(context, listen: false);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           children: <Widget>[
//             FilterChipsStatus(),
//             Container(width: 16),
//             // FilterChipsResponsable(),
//             Container(width: 8),
//           ],
//         ),
//       ),
//     );
//   }
// }
