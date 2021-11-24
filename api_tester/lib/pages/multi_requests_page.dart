import 'package:api_tester/cubit/multirequest_cubit.dart';
import 'package:api_tester/cubit/schema_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MutliRequestsPage extends StatefulWidget {
  const MutliRequestsPage({Key? key}) : super(key: key);
  static const String routeName = '/mutliRequestsPage';
  @override
  _MutliRequestsPageState createState() => _MutliRequestsPageState();
}

class _MutliRequestsPageState extends State<MutliRequestsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SchemaCubit, SchemaState>(
      listener: (context, state) {
        if (kDebugMode) {
          print(state.schema!.toJson());
        }
        BlocProvider.of<MultirequestCubit>(context).responseData(state.schema!);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('Run Test'),
          centerTitle: true,
        ),
        body: BlocConsumer<MultirequestCubit, MultirequestState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.response != null
                ? ListView(
                    children: state.response!
                        .map((res) => Container(
                              color: Colors.black12,
                              child: ExpansionTile(
                                textColor: Colors.deepPurple,
                                childrenPadding: const EdgeInsets.all(15),
                                leading: CircleAvatar(
                                  backgroundColor:
                                      res.singleResponse.statusCode! >= 200 &&
                                              res.singleResponse.statusCode! <=
                                                  300
                                          ? Colors.greenAccent
                                          : Colors.red,
                                  child:
                                      Text('${res.singleResponse.statusCode}'),
                                ),
                                title:
                                    Text('${res.serviceEndpoint.serviceUrl}'),
                                subtitle: Text(
                                  '${res.serviceEndpoint.serviceUrl}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                                children: [
                                  Text(
                                      'status code : ${res.singleResponse.statusCode}'),
                                  const Text('body:'),
                                  SelectableText('${res.singleResponse.body}'),
                                ],
                              ),
                            ))
                        .toList(),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
