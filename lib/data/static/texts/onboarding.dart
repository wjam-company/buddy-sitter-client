import 'package:buddy_sitter/data/static/assets/images.dart';

class DataTextOnboarding {
  static final List<Map<String, String>> items = List.unmodifiable([
    {
      "title": "Permanent care",
      "text":
          "Your pet is the most important thing, that's why we connect you with responsible and kind caregivers",
      "img": BuddySitterImage.onboardingTemporalOne,
    },
    {
      "title": "Useful calendar",
      "text":
          "Activate your smart calendar for your pets' can't-miss activities, either with sitters or personal",
      "img": BuddySitterImage.onboardingTemporalTwo,
    },
    {
      "title": "Health-check",
      "text":
          "Also designed to find health services that your pet will appreciate",
      "img": BuddySitterImage.onboardingTemporalOne,
    },
    {
      "title": "And more",
      "text": "There is much to explore...",
      "img": BuddySitterImage.onboardingTemporalTwo,
    },
  ]);
}
