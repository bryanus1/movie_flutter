import 'package:flutter/material.dart';
import 'package:movie_flutter/src/models/movie.dart';

class ListCard extends StatelessWidget {
  final List<Movie> movies;
  final Function loadMovies;
  const ListCard({Key key, @required this.movies, @required this.loadMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _scrollController = ScrollController();

    _scrollController.addListener((){
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200.0) {
        this.loadMovies();
      }
    });

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: _size.height * 0.21,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index){

        movies[index].uniqueId = '${movies[index].id}-popular';


          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: movies[index]),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: movies[index].uniqueId,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: AssetImage('lib/assets/img/no-image.jpg'),
                        image: NetworkImage(movies[index].getImagePath()),
                        height: 160.0,
                      ),
                    ),
                  ),
                  Text(
                    movies[index].title,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}