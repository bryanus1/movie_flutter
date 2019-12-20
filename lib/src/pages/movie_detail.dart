import 'package:flutter/material.dart';
import 'package:movie_flutter/src/models/movie.dart';
import 'package:movie_flutter/src/providers/movies_provider.dart';
import 'package:movie_flutter/src/resources/resources.dart';
import 'package:movie_flutter/src/widgets/list_card_actor.dart';

class MovieDetail extends StatelessWidget {
  static final routeName = "detail";
  const MovieDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;
    MoviesProvider moviesProvider = MoviesProvider();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _appBar(movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _posterImage(movie),
              _description(movie),
              _description(movie),
              _description(movie),
              _description(movie),
              _cast(movie: movie, moviesProvider: moviesProvider),
            ]),
          )
        ],
      ),
    );
  }

  Widget _appBar(Movie movie){
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Resources.blueColor,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(movie.title),
        background: FadeInImage(
          image: NetworkImage(movie.getBackgroundImage()),
          placeholder: AssetImage('lib/assets/img/no-image.jpg'),
          fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterImage(Movie movie){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: movie.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: NetworkImage(movie.getImagePath()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 25.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                movie.originalTitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star),
                  SizedBox(width: 5.0,),
                  Text(
                    "${movie.voteAverage}",
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  Icon(Icons.people),
                  SizedBox(width: 5.0,),
                  Text(
                    "${movie.popularity}",
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _description(Movie movie){
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 15.0
        )
      ),
    );
  }

  Widget _cast({Movie movie, MoviesProvider moviesProvider}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Cast:",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
              color: Resources.blueColor
            ),
          ),
          FutureBuilder(
            future: moviesProvider.getActors("${movie.id}"),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              final _size = MediaQuery.of(context).size;

              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Container(
                    height: _size.height * 0.5,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Resources.blueColor)
                      ),
                    ),
                  );
                case ConnectionState.active:
                  return Container(
                    height: _size.height * 0.5,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Resources.blueColor)
                      ),
                    ),
                  );
                case ConnectionState.waiting:
                  return Container(
                    height: _size.height * 0.5,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Resources.blueColor)
                      ),
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  return ListCardActor(actors: snapshot.data,);
                default:
                  return Container();
              }
            },
          ),
          SizedBox(height: 20.0,)
        ],
      ),
    );
  }
}