import 'package:api_tester/cubit/schema_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/multirequest_cubit.dart';
import 'utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRouteImplementation _myRouteImplementation = MyRouteImplementation();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SchemaCubit>(
          create: (BuildContext context) => SchemaCubit(),
        ),
        BlocProvider<MultirequestCubit>(
          create: (BuildContext context) => MultirequestCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'API TEST',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _myRouteImplementation.onGenerateRoute,
      ),
    );
  }
}
