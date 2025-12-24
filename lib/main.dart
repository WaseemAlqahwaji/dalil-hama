import 'package:core_package/core_package.dart';
import 'package:dalil_hama/app.dart';
import 'package:dalil_hama/configuration.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );
  await configureInjection(AppEnvironment.dev);
  runApp(const App());
}