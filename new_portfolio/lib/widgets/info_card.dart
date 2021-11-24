// import 'package:flutter/material.dart';
// class InfoCard extends StatefulWidget {
//   final List<Widget> children;
//   InfoCard({this.children, key}) : super(key: key);

//   _InfoCardState createState() => _InfoCardState();
// }

// class _InfoCardState extends State<InfoCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(22),side: BorderSide(width: 2)) ,
//       elevation: 3,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: widget.children
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
class InfoCard extends StatefulWidget {
  final List<Widget> children;
  final double elevation;
  final Color color;
  InfoCard({this.children, key,this.elevation,this.color}) ;
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(22),side: BorderSide(width: 2)) ,
      elevation: widget.elevation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 2,
          verticalDirection: VerticalDirection.down,
          alignment:WrapAlignment.center ,
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: widget.children
        ),
      ),
    );
  }
}