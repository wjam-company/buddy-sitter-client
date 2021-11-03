import 'package:buddy_sitter/data/static/mock/sitters.dart';
import 'package:buddy_sitter/presentation/utils/localstorage/stateless.dart';
import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/sitter_info.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SitterCard extends StatefulWidget {
  final SitterData sitter;

  const SitterCard({Key? key, required this.sitter}) : super(key: key);

  @override
  _SitterCardState createState() => _SitterCardState();

  String get content {
    return sitter.content;
  }

  String get name {
    return sitter.name;
  }

  String get image {
    return sitter.image;
  }

  String get profile {
    return sitter.image;
  }

  int get rating {
    return -1;
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
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar)
            .closed
            .then((value) {
          Map map = BuddySitterData().state.syncGet();
          String selectedPet = map["selected_pet"] ?? "";

          if (selectedPet.isEmpty) {
            Provider.of<RouterPageHandler>(context, listen: false)
                .show(BuddySitterLocation.selectYourPet);
            return;
          }
          String selectedService = map["selected_service"] ?? "";
          Map<String, DateTime> range = map["range"] ?? "";

          var pending = map["pending"] ?? {};
          pending[sitter.name] = {
            "sitter": sitter,
            "pet": selectedPet,
            "service": selectedService,
            "range": range
          };
          BuddySitterData().state.setKey("pending", pending);

          BuddySitterData()
              .state
              .removeKeys(["selected_pet", "selected_service", "range"]);

          Provider.of<RouterPageHandler>(context, listen: false)
              .show(BuddySitterLocation.pendingServices);
        });
      },
      icon: Icon(
        CupertinoIcons.captions_bubble,
        color: BuddySitterColor.actionsLog,
      ),
    );
  }

  BuddySitterAction get actionRight {
    return BuddySitterAction(
      onPressed: () {},
      icon: Icon(
        CupertinoIcons.heart,
        color: BuddySitterColor.complementaryRed,
      ),
    );
  }

  List<Widget> get children {
    return [
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  SitterInfo(
                    address: sitter.address,
                    petAccepted: sitter.petsAccepted,
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ];
  }
}

class _SitterCardState extends State<SitterCard> {
  _SitterCardState();

  @override
  Widget build(BuildContext context) {
    return OrganismCard.list(
      actionLeft: widget.actionLeft(context),
      actionRight: widget.actionRight,
      content: widget.sitter.content,
      image: widget.sitter.image,
      name: widget.sitter.name,
      profile: widget.sitter.image,
      children: widget.children,
    );
  }
}
