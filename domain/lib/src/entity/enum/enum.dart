import 'package:flutter/material.dart';
import 'package:resources/resources.dart';
import 'package:shared/shared.dart';

enum InitialAppRoute {
  login,
  main,
  chefMain,
}

enum Gender {
  male(ServerRequestResponseConstants.male),
  female(ServerRequestResponseConstants.female),
  other(ServerRequestResponseConstants.other),
  unknown(ServerRequestResponseConstants.unknown);

  const Gender(this.serverValue);
  final int serverValue;

  static const defaultValue = unknown;
}

enum LanguageCode {
  en(
    localeCode: LocaleConstants.en,
    serverValue: ServerRequestResponseConstants.en,
  ),
  ja(
    localeCode: LocaleConstants.ja,
    serverValue: ServerRequestResponseConstants.ja,
  );

  const LanguageCode({
    required this.localeCode,
    required this.serverValue,
  });
  final String localeCode;
  final String serverValue;

  static const defaultValue = ja;
}

enum NotificationType {
  unknown,
  newPost,
  liked;

  static const defaultValue = unknown;
}

enum BottomTab {
  home(icon: Icon(Icons.home), activeIcon: Icon(Icons.home)),
  message(icon: Icon(Icons.chat), activeIcon: Icon(Icons.chat)),
  orderList(icon: Icon(Icons.list), activeIcon: Icon(Icons.list)),
  myPage(icon: Icon(Icons.people), activeIcon: Icon(Icons.people)),;


  const BottomTab({
    required this.icon,
    required this.activeIcon,
  });
  final Icon icon;
  final Icon activeIcon;

  String get title {
    switch (this) {
      case BottomTab.home:
        return S.current.home;
      case BottomTab.message:
        return S.current.message;
      case BottomTab.orderList:
        return S.current.orders;
      case BottomTab.myPage:
        return S.current.user;
    }
  }
}
