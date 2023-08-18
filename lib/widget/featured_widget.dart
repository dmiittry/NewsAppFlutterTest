import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc_logic/bloc/featured_bloc.dart';
import 'package:flutter_project/page/post_page.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBloc, FeaturedState>(
      builder: (context, state) {
        if (state is EmptyFeaturedState) {
          return const Text('No Featured News');
        } else if (state is ListFeaturedState) {
          // ignore: sized_box_for_whitespace
          return Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.featuredList.length,
                // ignore: sized_box_for_whitespace
                itemBuilder: (context, index) => Container(
                      width: 150,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PostPage(
                                      post: state.featuredList[index])));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.lightBlueAccent,
                                    ),
                                    alignment: Alignment.center,
                                    width: 140,
                                    height: 66,
                                    child: Text(
                                        'IMAGE №${state.featuredList[index].id}'),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    state.featuredList[index].title,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
