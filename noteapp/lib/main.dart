import 'package:flutter/material.dart';
import 'package:noteapp/screens/note_list.dart';
import 'package:noteapp/uitls/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
  }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider (
      builder: (_)=>ThemeChange(ThemeData.light()),
         child:MaterialWithTheme()
    );
  }
}
class MaterialWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final theme = Provider.of<ThemeChange>(context);
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         home: NoteList(),
         theme:theme.getTheme(),
      ),
    );
  }
}