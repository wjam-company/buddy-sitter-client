import 'package:buddy_sitter/presentation/widgets/organisms/card.dart';
import 'package:flutter/material.dart';

class AddReview extends StatefulWidget {
  const AddReview({Key? key}) : super(key: key);

  @override
  _AddReviewState createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  final _formKey = GlobalKey<FormState>();
  String text = "";
  int rating = 0;

  String? _messageValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (value.toString().length < 10) {
      return "Comment length require 10 characters";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: _messageValidator,
              onChanged: (value) {
                String? error = _messageValidator(value);
                if (error == null) {
                  setState(() {
                    text = "";
                  });
                  return;
                }
                if (error.isNotEmpty) {
                  setState(() {
                    text = error;
                  });
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
            Text(text),
            AtomRanking.stars(
              ranking: rating,
            ),
          ],
        ),
      ),
    );
  }
}
