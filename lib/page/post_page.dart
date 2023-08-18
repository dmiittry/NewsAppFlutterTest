import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/model/post.dart';

import '../bloc_logic/bloc/featured_bloc.dart';

class PostPage extends StatelessWidget {
  final Post post;

  const PostPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final FeaturedBloc bloc = context.read<FeaturedBloc>();
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          actions: [
            BlocBuilder<FeaturedBloc, FeaturedState>(
              bloc: bloc,
              builder: (context, fstate) {
                if (fstate is ListFeaturedState) {
                  if (fstate.featuredList.contains(post)) {
                    return IconButton(
                        onPressed: () {
                          bloc.add(RemoveFeaturedEvent(post));
                        },
                        icon: const Icon(Icons.star));
                  }
                }
                return IconButton(
                    onPressed: () {
                      bloc.add(AddFeaturedEvent(post));
                    },
                    icon: const Icon(Icons.star_border));
              },
            ),
          ],
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            'News №${post.id}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          centerTitle: true,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              height: 200,
              color: Colors.lightBlueAccent,
              child: Text(
                'IMAGE ${post.id}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        }, childCount: 1)),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              post.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        }, childCount: 1)),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              post.body,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }, childCount: 10))
      ]),
    );
  }
}
