import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0;
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () => print('Cast'),
      ),

      //*custom app bar
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(scrollOffset: _scrollOffset),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          //* content header
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),

          //*Preview List
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey('previews'),
                title: 'Previews',
                contentList: previews,
              ),
            ),
          ),

          //*My List
          SliverToBoxAdapter(
            child: ContentList(
                key: PageStorageKey('myList'),
                title: "My List",
                contentList: myList),
          ),

          //*Originals List
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('NetflixOriginals'),
              title: "Netflix Originals",
              isOriginal: true,
              contentList: myList,
            ),
          ),

          //*trending list
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                  key: PageStorageKey('trendingList'),
                  title: "Trending",
                  contentList: myList),
            ),
          ),
        ],
      ),
    );
  }
}
