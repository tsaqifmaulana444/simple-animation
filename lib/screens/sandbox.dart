import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({Key key}) : super(key: key);

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _margin = 0;
  double _opacity = 1;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 900),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => setState(() => _margin = 50),
            child: Text('animate margin')
          ),
          ElevatedButton(
            onPressed: () => setState(() => _color = Colors.yellow),
            child: Text('animate color')
          ),
          ElevatedButton(
            onPressed: () => setState(() => _width = 400),
            child: Text('animate width')
          ),
          ElevatedButton(
            onPressed: () => setState(() => _opacity = 0),
            child: Text('animate opacity')
          ),
          AnimatedOpacity(
          opacity: _opacity, 
          duration: Duration(seconds: 2),
          child: Text(
            'hide me',
            style: TextStyle(color: Colors.white)
          )
          ),
        ]
       ),
      ),
    );
  }
}
