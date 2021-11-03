import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestState extends StatefulWidget {
  const TestState({Key? key}) : super(key: key);

  @override
  _TestStateState createState() => _TestStateState();
}

class _TestStateState extends State<TestState> {
  bool isShowReviews = false;

  List<Widget> _showReviews() {
    if (isShowReviews == true) {
      return [const Text("reviews")];
      // return ReviewsByUser();
    }

    return [];
  }

  MaterialStateProperty<Color> _chooseColor() {
    if (isShowReviews == true) {
      return MaterialStateProperty.all(Colors.blue);
    }

    return MaterialStateProperty.all(Colors.amber);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: const Text("hello"),
          style: ButtonStyle(backgroundColor: _chooseColor()),
          onPressed: () {
            setState(() {
              isShowReviews = !isShowReviews;
            });
          },
        ),
        ..._showReviews()
      ],
    );
  }
}
