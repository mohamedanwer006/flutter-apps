import 'package:api_tester/cubit/multirequest_cubit.dart';
import 'package:api_tester/cubit/schema_cubit.dart';
import 'package:api_tester/pages/multi_requests_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo.dart';

class JsonFileRequestPage extends StatefulWidget {
  static const routeName = '/textPage';

  const JsonFileRequestPage({
    Key? key,
  }) : super(key: key);

  @override
  State<JsonFileRequestPage> createState() => _TextPageState();
}

class _TextPageState extends State<JsonFileRequestPage> {
  ApiRepo apiRepo = ApiRepo();
  FilePikerRepo filePikerRepo = FilePikerRepo();

  void _pickFile() async {
    var text = await filePikerRepo.pickFile();
    setState(() {
      _textEditingController.text = text!;
    });
  }

  final TextEditingController _textEditingController = TextEditingController(
    text: '''
                {

              "service-endpoints":[
                  {
                 "service-url":"https://jsonplaceholder.typicode.com/posts",
                 "request-type":"GET",
                 "timeout":"1",
                 "sucessfull-response":"200"
                  },
                  {
                 "service-url":"https://jsonplaceholder.typicode.com/posts/222",
                 "request-type":"GET",
                 "timeout":"1",
                 "sucessfull-response":"200"
                  },
                  {

                  "service-url":"https://jsonplaceholder.typicode.com/posts",
                 "request-type":"POST",
                 "request-body":[{
                  "userId": 1,
                  "id": 1,
                  "title": "yas-test",
                  "body": "matha2o"
              }],
                 "timeout":"1",
                 "sucessfull-response":"200"
                  }
          
              ]
          
           }''',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('json edit'),
        actions: [
          IconButton(
              color: Colors.lightGreenAccent,
              tooltip: 'run',
              onPressed: run,
              icon: const Icon(Icons.play_arrow))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(),
              expands: true,
              maxLines: null,
              minLines: null,
              toolbarOptions: const ToolbarOptions(
                copy: true,
                paste: true,
                selectAll: true,
                cut: true,
              ),
            ),
          ),
          const Text(
            '  please select file in formate \nlike that or fill the json here',
            // style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickFile,
        tooltip: 'select file',
        child: const Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void run() {
    var schema = apiRepo.createModel(_textEditingController.text);
    BlocProvider.of<SchemaCubit>(context).setSchema(schema);
    BlocProvider.of<MultirequestCubit>(context).responseData(schema);
    Navigator.of(context).pushNamed(MutliRequestsPage.routeName);
  }
}
