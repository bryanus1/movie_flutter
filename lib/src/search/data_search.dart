import 'package:flutter/material.dart';
import 'package:movie_flutter/src/models/movie.dart';
import 'package:movie_flutter/src/providers/movies_provider.dart';
import 'package:movie_flutter/src/resources/resources.dart';

class DataSearch extends SearchDelegate {

  MoviesProvider moviesProvider = MoviesProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions, acctions of our appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading, Icon to left of the appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults, Build to results of show
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions, suggestion to show
    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot){
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
            return ListView(
              children: snapshot.data.map((movie){
                return ListTile(
                  leading: FadeInImage(
                    width: 50.0,
                    placeholder: AssetImage('lib/assets/img/no-image.jpg'),
                    image: NetworkImage(movie.getImagePath()),
                  ),
                  title: Text(movie.title),
                  subtitle: Text(movie.originalTitle),
                  onTap: (){
                    close(context, null);
                    movie.uniqueId = '';
                    Navigator.pushNamed(context, 'detail', arguments: movie);
                  },
                );
              }).toList(),
            );
          default:
            return Container();
        }
      },
    );
  }

}