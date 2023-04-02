import 'package:flutter/material.dart';
import 'package:flutter_animations/models/Trip.dart';
import 'package:flutter_animations/screens/details.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Widget> _tripTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addTrips();
    });
  }

  void _addTrips() {
    // get data from db
    List<Trip> _trips = [
      Trip(title: 'Real Madrid FC', price: 'Spain', nights: '14', img: 'madrid.png'),
      Trip(title: 'AC Milan', price: 'Italy', nights: '7', img: 'milan.png'),
      Trip(title: 'Liverpool FC', price: 'England', nights: '6', img: 'ipuls.png'),
      Trip(title: 'Bayern Munich', price: 'Germany', nights: '6', img: 'bayern.png'),
      Trip(title: 'FC Barcelona', price: 'Spain', nights: '5', img: 'barca.png'),
      Trip(title: 'AFC Ajax', price: 'Netherlands', nights: '4', img: 'ajax.png'),
      Trip(title: 'Hamburger SV', price: 'Germany', nights: '1', img: 'hamburg.png'),
      Trip(title: 'PSG 😂', price: 'France', nights: '0', img: 'oil1.png'),
      Trip(title: 'Man City 😂', price: 'England', nights: '0', img: 'oil2.png'),
      
    ];

    Future ft = Future(() {});
    _trips.forEach((Trip trip) {
      ft = ft.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _tripTiles.add(_buildTile(trip));
          _listKey.currentState.insertItem(_tripTiles.length - 1);
        });
      });
    });
  }

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(trip: trip)));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${trip.nights} UCL Final Wins',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue[300])),
          Text(trip.title, style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: 'location-img-${trip.img}',
          child: Image.asset(
            'images/${trip.img}',
            height: 50.0,
          ),
        ),
      ),
      trailing: Text('${trip.price}'),
    );
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _tripTiles.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            child: _tripTiles[index],
            position: animation.drive(_offset),
          );
        });
  }
}
