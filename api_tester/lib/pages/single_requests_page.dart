import 'package:api_tester/model/service_endpoint.dart';
import 'package:api_tester/model/single_response.dart';
import 'package:api_tester/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../repo.dart';

class SingleRequestPage extends StatefulWidget {
  static const String routeName = '/singleRequestPage';
  const SingleRequestPage({Key? key}) : super(key: key);

  @override
  _SingleRequestPageState createState() => _SingleRequestPageState();
}

class _SingleRequestPageState extends State<SingleRequestPage> {
  ApiRepo apiRepo = ApiRepo();
  final TextEditingController _urlEditingControler = TextEditingController(
      text: 'https://jsonplaceholder.typicode.com/posts/1');
  final TextEditingController _nameEditingControler = TextEditingController();
  final TextEditingController _bodyEditingControler = TextEditingController();
  String requestMethode = 'GET';
  SingleResponse? _singleResponse;
  bool isRequest = false;
  @override
  Widget build(BuildContext context) {
    var width = Utils.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Single Request'),
        centerTitle: true,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 60,
              width: width,
              child: TextField(
                controller: _nameEditingControler,
                decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                    contentPadding: EdgeInsets.all(10),
                    label: Text('Request Name')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 60,
              width: width,
              child: TextField(
                controller: _urlEditingControler,
                decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                    contentPadding: EdgeInsets.all(10),
                    label: Text('Type Url')),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Select Methode',
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: SizedBox(
                  height: 60,
                  child: DropdownButton<String>(
                    value: requestMethode,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        requestMethode = newValue!;
                      });
                    },
                    items: <String>['GET', 'POST', 'DELET', 'PUT']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(color: Colors.white, child: buildRes()),
          )
        ],
      ),
    );
  }

  run() async {
    setState(() {
      isRequest = true; //start request
    });
    var serviceEndpint = ServiceEndpoint(
        serviceUrl: _urlEditingControler.text, requestType: requestMethode);
    SingleResponse res = await apiRepo.req(
      serviceEndpint.requestType!,
      Uri.parse(serviceEndpint.serviceUrl!),
    );
    setState(() {
      _singleResponse = res;
      isRequest = false; //end request
    });

    if (kDebugMode) {
      print(_singleResponse!.statusCode);
    }
  }

  Widget buildRes() {
    if (isRequest) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.deepPurple,
        ),
      );
    } else {
      return _singleResponse != null
          ? SingleChildScrollView(
              child: Container(
                color: Colors.black12,
                child: ExpansionTile(
                  textColor: Colors.deepPurple,
                  childrenPadding: const EdgeInsets.all(15),
                  leading: CircleAvatar(
                    backgroundColor: _singleResponse!.statusCode == 200
                        ? Colors.greenAccent
                        : Colors.red,
                    child: Text('${_singleResponse!.statusCode}'),
                  ),
                  title: Text(_nameEditingControler.text),
                  subtitle: Text(
                    _urlEditingControler.text,
                    style: const TextStyle(fontSize: 12),
                  ),
                  children: [
                    Text('status code : ${_singleResponse!.statusCode}'),
                    const Text('body:'),
                    SelectableText('${_singleResponse!.body}'),
                  ],
                ),
              ),
            )
          : Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: TextField(
                    maxLines: 25,
                    controller: _bodyEditingControler,
                    decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black)),
                        contentPadding: EdgeInsets.all(10),
                        label: Text('body')),
                  ),
                ),
              ),
            );
    }
  }
}
