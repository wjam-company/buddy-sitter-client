import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ProviderSelectYourPet with ChangeNotifier {
  final FormProvider formProvider;

  ProviderSelectYourPet(this.formProvider) {
    formProvider.addListener(notifyListeners);
  }
}
