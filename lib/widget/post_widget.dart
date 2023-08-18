import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc_logic/bloc/featured_bloc.dart';
import 'package:flutter_project/bloc_logic/read_bloc.dart';
import 'package:flutter_project/page/post_page.dart';
import '../post_bloc/bloc/post_bloc.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReadBloc readBloc = context.read<ReadBloc>();
    final FeaturedBloc bloc = context.read<FeaturedBloc>();
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostErrorState) {
          return const Center(
            child: Text('Error api rest'),
          );
        }
        if (state is PostLoadedState) {
          return Column(
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20, //state.postLoader.length,
                  // ignore: avoid_unnecessary_containers
                  itemBuilder: (context, index) => Container(
                      height: 120,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      PostPage(post: state.postLoader[index])));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.lightBlueAccent,
                                    ),
                                    width: 90,
                                    height: 90,
                                    child: const Text('IMAGE'),
                                  ),
                                ),
                                Flexible(
                                  flex: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(state.postLoader[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                      Text(state.postLoader[index].body,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      BlocBuilder<FeaturedBloc, FeaturedState>(
                                        bloc: bloc,
                                        builder: (context, fstate) {
                                          if (fstate is ListFeaturedState) {
                                            if (fstate.featuredList.contains(
                                                state.postLoader[index])) {
                                              return IconButton(
                                                  onPressed: () {
                                                    bloc.add(
                                                        RemoveFeaturedEvent(
                                                            state.postLoader[
                                                                index]));
                                                  },
                                                  icon: const Icon(Icons.star));
                                            }
                                          }
                                          return IconButton(
                                              onPressed: () {
                                                bloc.add(AddFeaturedEvent(
                                                    state.postLoader[index]));
                                              },
                                              icon: const Icon(
                                                  Icons.star_border));
                                        },
                                      ),
                                      BlocBuilder<ReadBloc, Widget>(
                                        bloc: readBloc,
                                        builder: (context, state) {
                                          return state;
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
