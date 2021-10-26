import 'package:buddy_sitter/presentation/pages/interfaces/search_filter.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProviderSelectYourService extends ProviderSearchFilter {
  ProviderSelectYourService(FormProvider formProvider) : super(formProvider);

  @override
  BuddySitterAction action(BuildContext context) {
    return BuddySitterAction(
      icon: Icon(
        Icons.check,
        color: BuddySitterColor.actionsSuccess,
      ),
      onPressed: () {
        print('save the model of service');
      },
      text: 'Continue',
    );
  }

  @override
  Future<List<ItemListItem>> get data async {
    List<ItemListItem> value = await Future<List<ItemListItem>>.delayed(
      const Duration(seconds: 2),
      () => [
        ItemListItem(
          image:
              'https://lh4.googleusercontent.com/sh_Kga2Kq5HjE0xX8B2pivJXT7yJG4e25cBt9xZvygBvxsgH3xOu9vzWxTT_FY8JKA1EOOF5BPvn44zZllAejPo=w1280',
          title: 'Walk',
          action: BuddySitterAction(
            text: '',
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: '',
        ),
        ItemListItem(
          image:
              'https://lh6.googleusercontent.com/PSIt6C2ErJU-Or31Edk38xoaw5qd70qZCYcMRT_D8EhwZ95L1hBl8AVmGTTXCtkAX-9S6KVrv6iEGqqfaGpNH1E=w1280',
          title: 'Sleepover',
          action: BuddySitterAction(
            text: '',
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: '',
        ),
        ItemListItem(
          image:
              'https://lh5.googleusercontent.com/SClcJS3R0jj5DJxf0nD8NxyVwBXyXE5KnCgU16ff93msJhu1jpBZmIzJ2f9TBqM6wKGox3eas5f1zPghg40im78=w1280',
          title: 'Special medical care',
          action: BuddySitterAction(
            text: '',
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: '',
        ),
        ItemListItem(
          image:
              'https://lh3.googleusercontent.com/zLjFLLzGSLNPcBjeURZRb9XcQERlEPeK1p1mjDUDrBMfkhBFVTTB6mFWPQAFJp6T-tc4T2H63aNaJd11Nz4a8rM=w1280',
          title: 'Daycare',
          action: BuddySitterAction(
            text: '',
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: '',
        ),
      ],
    );
    if (formProvider.entries.isNotEmpty &&
        formProvider.entries.values.first.value != null) {
      final String filter = formProvider.entries.values.first.value as String;
      value.removeWhere(
        (element) =>
            !(element.content.toLowerCase().contains(filter.toLowerCase()) ||
                element.title.toLowerCase().contains(filter.toLowerCase())),
      );
    }
    return value;
  }
}
