import 'package:flutter/material.dart';
import 'package:flutter_playground/services/page_service.dart';
import 'package:get_it/get_it.dart';

final singleton = GetIt.instance;

void registerServices() {
  singleton.registerLazySingleton(
      () => PageController(initialPage: 0, keepPage: true));
  singleton.registerLazySingleton(() => PageService());
}
