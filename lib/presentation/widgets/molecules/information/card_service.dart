import 'package:buddy_sitter/data/static/mock/service_data.dart';
import 'package:buddy_sitter/presentation/utils/localstorage/stateless.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/list_tile.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_review.dart';

class ServiceCard extends StatefulWidget {
  final ServiceData service;
  late final Map _user;

  ServiceCard({Key? key, required this.service}) : super(key: key) {
    var state = BuddySitterData().state.syncGet();
    _user = state["user"];
  }

  @override
  _ServiceCardState createState() => _ServiceCardState();

  String get content {
    return service.sitter.content;
  }

  String get name {
    return service.sitter.name;
  }

  String get image {
    return service.sitter.image;
  }

  String get profile {
    return service.sitter.image;
  }

  int get rating {
    return service.sitter.rating;
  }

  BuddySitterAction actionLeft(BuildContext context) {
    const snackBar = SnackBar(
      content: Center(
        child: Text(
          'Booking Service ....',
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
        ),
      ),
      backgroundColor: Colors.greenAccent,
    );
    return BuddySitterAction(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(snackBar).closed;
      },
      icon: Icon(
        CupertinoIcons.mail,
        color: BuddySitterColor.actionsLog,
      ),
    );
  }

  BuddySitterAction get actionRight {
    return BuddySitterAction(
      onPressed: () {},
      icon: Icon(
        CupertinoIcons.phone_circle,
        color: BuddySitterColor.primaryGreen.darken(0.5),
      ),
    );
  }

  List<Widget> get children {
    return [
      MoleculeListTile.list(
        image:
            "https://cms.finnair.com/resource/blob/1393186/668fd19a69a530c7895e91940fe7803a/finnair-lapland-dog-woman-face-closeup-data.jpg?impolicy=crop&width=992&height=558&x=0&y=807&imwidth=768",
        title: "${_user["username"]}",
        imageType: AtomImage.typeNetwork,
        ranking: -1,
        children: const [AddReview()],
      ),
    ];
  }
}

class _ServiceCardState extends State<ServiceCard> {
  _ServiceCardState();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
