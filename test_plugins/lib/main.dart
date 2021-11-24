import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_plugins/block/counter_block.dart';
import 'package:test_plugins/model/models/schema.dart';
import 'package:test_plugins/route/route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';

void main() {
  // debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRouteImplementation _myRouteImplementation = MyRouteImplementation();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBlock>(
      create: (context) => CounterBlock(),
      child: MaterialApp(
        title: 'Material App',
        onGenerateRoute: _myRouteImplementation.onGenerateRoute,
      ),
    );
  }
}

/// home page of the app
///
/// ```dart
/// class Home extends StatelessWidget {
///   const Home({Key? key}) : super(key: key);

///  @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: Center(
///         child: Column(
///           children: const [
///            Text('counter '),
///           ],
///         ),
///       ),
///       floatingActionButton: Row(
///         children: [
///           FloatingActionButton.extended(
///             onPressed: () {},
///             label: const Text('Approve'),
///             icon: const Icon(Icons.minimize),
///             backgroundColor: Colors.pink,
///           ),
///           FloatingActionButton.extended(
///             onPressed: () {},
///             label: const Text('Approve'),
///             icon: const Icon(Icons.add),
///             backgroundColor: Colors.pink,
///           ),
///         ],
///       ),
///     );
///   }
/// }
/// ```

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String f = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(f),
            BlocConsumer<CounterBlock, CounterState>(
              listenWhen: (previous, current) {
                if (previous.counterValue == 3) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('previes data:${previous.counterValue}'),
                    duration: const Duration(seconds: 1),
                  ));
                  return false;
                } else {
                  return true;
                }
              },
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('data:${state.counterValue}'),
                  duration: const Duration(seconds: 1),
                ));
              },
              builder: (context, state) {
                if (state.counterValue == 5) {
                  return Text('hhhhh' + state.counterValue.toString());
                }
                return Text(state.counterValue.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // FloatingActionButton.extended(
          //   heroTag: 'bdiaof',
          //   onPressed: () {
          //     BlocProvider.of<CounterBlock>(context).increment();
          //   },
          //   label: const Text('Approve'),
          //   icon: const Icon(Icons.add),
          //   backgroundColor: Colors.pink,
          // ),
          // FloatingActionButton.extended(
          //   heroTag: 'djfajkk',
          //   onPressed: () {
          //     context.read<CounterBlock>().decrement();
          //   },
          //   label: const Text('Approve'),
          //   icon: const Icon(Icons.minimize),
          //   backgroundColor: Colors.pink,
          // ),
          FloatingActionButton(
            heroTag: 'lasd',
            onPressed: j,
            backgroundColor: Colors.pink,
          ),
        ],
      ),
    );
  }

  j() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    var fileBytes = result!.files.first.bytes;
    var fileName = result.files.first.name;
    // var f = File.fromRawPath(fileBytes!);
    // final data = await json.decode(f.toString());
    // print(data.toString());
    var g = const Utf8Codec().decode(fileBytes!.toList());
    final data = await json.decode(g);
    Schema s = Schema.fromJson(data);
    print(s.serviceEndpoints!.length);
    setState(() {
      f = g;
    });
    print(f);
  }
}

// // class FilePickerDemo extends StatefulWidget {
// //   @override
// //   _FilePickerDemoState createState() => _FilePickerDemoState();
// // }

// // class _FilePickerDemoState extends State<FilePickerDemo> {
// //   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// //   final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
// //   String? _fileName;
// //   String? _saveAsFileName;
// //   List<PlatformFile>? _paths;
// //   String? _directoryPath;
// //   String? _extension;
// //   bool _isLoading = false;
// //   bool _userAborted = false;
// //   bool _multiPick = false;
// //   FileType _pickingType = FileType.any;
// //   TextEditingController _controller = TextEditingController();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller.addListener(() => _extension = _controller.text);
// //   }

// //   void _pickFiles() async {
// //     _resetState();
// //     try {
// //       _directoryPath = null;
// //       _paths = (await FilePicker.platform.pickFiles(
// //         type: _pickingType,
// //         allowMultiple: _multiPick,
// //         onFileLoading: (FilePickerStatus status) => print(status),
// //         allowedExtensions: (_extension?.isNotEmpty ?? false)
// //             ? _extension?.replaceAll(' ', '').split(',')
// //             : null,
// //       ))
// //           ?.files;
// //       var c = _paths!.first.name;
// //       print(c);
// //     } on PlatformException catch (e) {
// //       _logException('Unsupported operation' + e.toString());
// //     } catch (e) {
// //       _logException(e.toString());
// //     }
// //     if (!mounted) return;
// //     setState(() {
// //       _isLoading = false;
// //       _fileName =
// //           _paths != null ? _paths!.map((e) => e.name).toString() : '...';
// //       _userAborted = _paths == null;
// //     });
// //   }

// //   void _clearCachedFiles() async {
// //     _resetState();
// //     try {
// //       bool? result = await FilePicker.platform.clearTemporaryFiles();
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           backgroundColor: result! ? Colors.green : Colors.red,
// //           content: Text((result
// //               ? 'Temporary files removed with success.'
// //               : 'Failed to clean temporary files')),
// //         ),
// //       );
// //     } on PlatformException catch (e) {
// //       _logException('Unsupported operation' + e.toString());
// //     } catch (e) {
// //       _logException(e.toString());
// //     } finally {
// //       setState(() => _isLoading = false);
// //     }
// //   }

// //   void _selectFolder() async {
// //     _resetState();
// //     try {
// //       String? path = await FilePicker.platform.getDirectoryPath();
// //       setState(() {
// //         _directoryPath = path;
// //         _userAborted = path == null;
// //       });
// //     } on PlatformException catch (e) {
// //       _logException('Unsupported operation' + e.toString());
// //     } catch (e) {
// //       _logException(e.toString());
// //     } finally {
// //       setState(() => _isLoading = false);
// //     }
// //   }

// //   Future<void> _saveFile() async {
// //     _resetState();
// //     try {
// //       String? fileName = await FilePicker.platform.saveFile(
// //         allowedExtensions: (_extension?.isNotEmpty ?? false)
// //             ? _extension?.replaceAll(' ', '').split(',')
// //             : null,
// //         type: _pickingType,
// //       );
// //       setState(() {
// //         _saveAsFileName = fileName;
// //         _userAborted = fileName == null;
// //       });
// //     } on PlatformException catch (e) {
// //       _logException('Unsupported operation' + e.toString());
// //     } catch (e) {
// //       _logException(e.toString());
// //     } finally {
// //       setState(() => _isLoading = false);
// //     }
// //   }

// //   void _logException(String message) {
// //     print(message);
// //     _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
// //     _scaffoldMessengerKey.currentState?.showSnackBar(
// //       SnackBar(
// //         content: Text(message),
// //       ),
// //     );
// //   }

// //   void _resetState() {
// //     if (!mounted) {
// //       return;
// //     }
// //     setState(() {
// //       _isLoading = true;
// //       _directoryPath = null;
// //       _fileName = null;
// //       _paths = null;
// //       _saveAsFileName = null;
// //       _userAborted = false;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       scaffoldMessengerKey: _scaffoldMessengerKey,
// //       home: Scaffold(
// //         key: _scaffoldKey,
// //         appBar: AppBar(
// //           title: const Text('File Picker example app'),
// //         ),
// //         body: Center(
// //           child: Padding(
// //             padding: const EdgeInsets.only(left: 10.0, right: 10.0),
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: <Widget>[
// //                   Padding(
// //                     padding: const EdgeInsets.only(top: 20.0),
// //                     child: DropdownButton<FileType>(
// //                         hint: const Text('LOAD PATH FROM'),
// //                         value: _pickingType,
// //                         items: FileType.values
// //                             .map((fileType) => DropdownMenuItem<FileType>(
// //                                   child: Text(fileType.toString()),
// //                                   value: fileType,
// //                                 ))
// //                             .toList(),
// //                         onChanged: (value) => setState(() {
// //                               _pickingType = value!;
// //                               if (_pickingType != FileType.custom) {
// //                                 _controller.text = _extension = '';
// //                               }
// //                             })),
// //                   ),
// //                   ConstrainedBox(
// //                     constraints: const BoxConstraints.tightFor(width: 100.0),
// //                     child: _pickingType == FileType.custom
// //                         ? TextFormField(
// //                             maxLength: 15,
// //                             autovalidateMode: AutovalidateMode.always,
// //                             controller: _controller,
// //                             decoration: InputDecoration(
// //                               labelText: 'File extension',
// //                             ),
// //                             keyboardType: TextInputType.text,
// //                             textCapitalization: TextCapitalization.none,
// //                           )
// //                         : const SizedBox(),
// //                   ),
// //                   ConstrainedBox(
// //                     constraints: const BoxConstraints.tightFor(width: 200.0),
// //                     child: SwitchListTile.adaptive(
// //                       title: Text(
// //                         'Pick multiple files',
// //                         textAlign: TextAlign.right,
// //                       ),
// //                       onChanged: (bool value) =>
// //                           setState(() => _multiPick = value),
// //                       value: _multiPick,
// //                     ),
// //                   ),
// //                   Padding(
// //                     padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
// //                     child: Column(
// //                       children: <Widget>[
// //                         ElevatedButton(
// //                           onPressed: () => _pickFiles(),
// //                           child: Text(_multiPick ? 'Pick files' : 'Pick file'),
// //                         ),
// //                         SizedBox(height: 10),
// //                         ElevatedButton(
// //                           onPressed: () => _selectFolder(),
// //                           child: const Text('Pick folder'),
// //                         ),
// //                         SizedBox(height: 10),
// //                         ElevatedButton(
// //                           onPressed: () => _saveFile(),
// //                           child: const Text('Save file'),
// //                         ),
// //                         SizedBox(height: 10),
// //                         ElevatedButton(
// //                           onPressed: () => _clearCachedFiles(),
// //                           child: const Text('Clear temporary files'),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   Builder(
// //                     builder: (BuildContext context) => _isLoading
// //                         ? Padding(
// //                             padding: const EdgeInsets.only(bottom: 10.0),
// //                             child: const CircularProgressIndicator(),
// //                           )
// //                         : _userAborted
// //                             ? Padding(
// //                                 padding: const EdgeInsets.only(bottom: 10.0),
// //                                 child: const Text(
// //                                   'User has aborted the dialog',
// //                                 ),
// //                               )
// //                             : _directoryPath != null
// //                                 ? ListTile(
// //                                     title: const Text('Directory path'),
// //                                     subtitle: Text(_directoryPath!),
// //                                   )
// //                                 : _paths != null
// //                                     ? Container(
// //                                         padding:
// //                                             const EdgeInsets.only(bottom: 30.0),
// //                                         height:
// //                                             MediaQuery.of(context).size.height *
// //                                                 0.50,
// //                                         child: Scrollbar(
// //                                             child: ListView.separated(
// //                                           itemCount: _paths != null &&
// //                                                   _paths!.isNotEmpty
// //                                               ? _paths!.length
// //                                               : 1,
// //                                           itemBuilder: (BuildContext context,
// //                                               int index) {
// //                                             final bool isMultiPath =
// //                                                 _paths != null &&
// //                                                     _paths!.isNotEmpty;
// //                                             final String name =
// //                                                 'File $index: ' +
// //                                                     (isMultiPath
// //                                                         ? _paths!
// //                                                             .map((e) => e.name)
// //                                                             .toList()[index]
// //                                                         : _fileName ?? '...');
// //                                             final path = _paths!
// //                                                 .map((e) => e.path)
// //                                                 .toList()[index]
// //                                                 .toString();

// //                                             return ListTile(
// //                                               title: Text(
// //                                                 name,
// //                                               ),
// //                                               subtitle: Text(path),
// //                                             );
// //                                           },
// //                                           separatorBuilder:
// //                                               (BuildContext context,
// //                                                       int index) =>
// //                                                   const Divider(),
// //                                         )),
// //                                       )
// //                                     : _saveAsFileName != null
// //                                         ? ListTile(
// //                                             title: const Text('Save file'),
// //                                             subtitle: Text(_saveAsFileName!),
// //                                           )
// //                                         : const SizedBox(),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:file_picker_cross/file_picker_cross.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final GlobalKey exportKey = GlobalKey();
//   FilePickerCross? filePickerCross;

//   String _fileString = '';
//   Set<String>? lastFiles;
//   FileQuotaCross quota = FileQuotaCross(quota: 0, usage: 0);

//   @override
//   void initState() {
//     FilePickerCross.listInternalFiles()
//         .then((value) => setState(() => lastFiles = value.toSet()));
//     FilePickerCross.quota().then((value) => setState(() => quota = value));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           primaryColor: Colors.blueGrey, accentColor: Colors.lightGreen),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: ListView(
//           padding: const EdgeInsets.all(8),
//           children: <Widget>[
//             Text(
//               'Last files',
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             (lastFiles == null)
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : ListView.builder(
//                     shrinkWrap: true,
//                     primary: false,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) => ListTile(
//                       leading: Text('$index.'),
//                       title: Text(lastFiles!.toList()[index]),
//                       onTap: () async => setFilePicker(
//                           await FilePickerCross.fromInternalPath(
//                               path: lastFiles!.toList()[index])),
//                     ),
//                     itemCount: lastFiles!.length,
//                   ),
//             Builder(
//               builder: (context) => ElevatedButton(
//                 onPressed: () => _selectFile(context),
//                 child: const Text('Open File...'),
//               ),
//             ),
//             (filePickerCross == null)
//                 ? const Text('Open a file first, to save')
//                 : ElevatedButton(
//                     key: exportKey,
//                     onPressed: _selectSaveFile,
//                     child: const Text('Save as...'),
//                   ),
//             Text(
//               'File system details',
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             Text('Quota: ${(quota.quota / 1e6).round()} MB'),
//             Text(
//                 'Usage: ${(quota.usage / 1e6).round()}; Remaining: ${(quota.remaining / 1e6).round()}'),
//             Text('Percentage: ${quota.relative.roundToDouble()}'),
//             Text(
//               'File details',
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             Text(
//                 'File path: ${filePickerCross?.path ?? 'unknown'} (Might cause issues on web)\n'),
//             Text('File length: ${filePickerCross?.length ?? 0}\n'),
//             Text('File as String: $_fileString\n'),
//           ],
//         ),
//       ),
//     );
//   }

//   void _selectFile(context) {
//     FilePickerCross.importMultipleFromStorage().then((filePicker) {
//       setFilePicker(filePicker[0]);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('You selected ${filePicker.length} file(s).'),
//         ),
//       );

//       setState(() {});
//     });
//   }

//   void _selectSaveFile() {
//     RenderBox renderBox =
//         exportKey.currentContext!.findRenderObject()! as RenderBox;
//     Offset position = renderBox.localToGlobal(Offset.zero);
//     filePickerCross!.exportToStorage(
//         subject: filePickerCross!.fileName,
//         sharePositionOrigin: Rect.fromLTWH(
//             //
//             position.dx,
//             position.dy,
//             renderBox.size.width,
//             renderBox.size.height));
//   }

//   setFilePicker(FilePickerCross filePicker) => setState(() {
//         filePickerCross = filePicker;
//         filePickerCross!.saveToPath(path: filePickerCross!.fileName!);
//         FilePickerCross.quota().then((value) {
//           setState(() => quota = value);
//         });
//         lastFiles!.add(filePickerCross!.fileName!);
//         try {
//           _fileString = filePickerCross.toString();
//         } catch (e) {
//           _fileString = 'Not a text file. Showing base64.\n\n' +
//               filePickerCross!.toBase64();
//         }
//       });
// }
