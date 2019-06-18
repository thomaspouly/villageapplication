import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'ACTUS', icon: Icons.today),
  const Choice(title: 'CALENDRIER', icon: Icons.calendar_today),
  const Choice(title: 'CHAT', icon: Icons.chat),
  const Choice(title: 'MEDIAS', icon: Icons.photo_camera),
   const Choice(title: 'VOTE', icon: Icons.schedule),
  //const Choice(title: 'MONUMENTS', icon: Icons.build),
 // const Choice(title: 'SPORT', icon: Icons.directions_car),
    const Choice(title: 'SPONSOR', icon: Icons.attach_money),
  const Choice(title: 'SHOP', icon: Icons.shop),
  

];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}