import 'package:flutter/material.dart';
import 'package:movie_flutter/src/models/actor.dart';

class ListCardActor extends StatelessWidget {
  final List<Actor> actors;
  const ListCardActor({Key key, @required this.actors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: _size.height * 0.21,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage('lib/assets/img/no-image.jpg'),
                    image: NetworkImage(actors[index].getImage()),
                    height: 150.0,
                  ),
                ),
                Text(
                  actors[index].name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  actors[index].character,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}