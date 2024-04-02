import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final singleton = GetIt.instance;

void registerServices() {
  singleton.registerLazySingleton(() => PageController());
  singleton.registerLazySingleton(() => GlobalKey<ScaffoldState>());
}
