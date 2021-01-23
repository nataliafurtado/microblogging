//import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:argos/screens/equipment/equipment_template.dart';
// import 'package:argos/services/models.dart';
// import 'package:argos/shared/themes.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:microblogging/assets/style.dart';

class VerticalEquipmentCard extends StatelessWidget {
  // Simple class constructor
  // VerticalEquipmentCard(this.equipmentTemplate, this.currentUser);

  // final EquipmentTemplate equipmentTemplate;
  // final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        // onTap: () =>
        //   // Navigator.push(
        //   //   context,
        //   //   MaterialPageRoute(builder: (context) => EquipmentTemplateScreen(equipmentTemplate, currentUser)),
        //   // ),
        child: Container(
          margin: EdgeInsets.all(10),
          height: 150,
          width: 140,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.black54),
                    child: Text(
                      "equipmentTemplate.name",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Style.cardSubTitle,
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 5, offset: Offset(0, 6))
            ],
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: Cachen(
                  "",
                )),
          ),
        ),
      ),
    );
  }
}
// image: (equipmentTemplate.photoUrl.contains('http'))
//             ? CachedNetworkImageProvider(
//                 equipmentTemplate.photoUrl,
//               )
//             : AssetImage('assets/images/equipment_template.jpg')),
