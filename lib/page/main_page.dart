import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc_logic/read_bloc.dart';
import 'package:flutter_project/widget/featured_widget.dart';
import 'package:flutter_project/widget/post_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              Tooltip(
                message: 'Mark all read',
                child: IconButton(
                    alignment: Alignment.center,
                    onPressed: () {
                      final readBloc = context.read<ReadBloc>();
                      readBloc.add(inReadEvent());
                    },
                    icon: const Icon(Icons.checklist)),
              ),
            ],
            title:
                Text('NEWS', style: Theme.of(context).textTheme.headlineMedium),
            centerTitle: false),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Featured news",
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(
                        height: 10,
                      ),
                      const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FeaturedWidget(),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 5,
                      ),
                    ],
                  );
                },
                childCount: 1, // Количество элементов в списке
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Lates news',
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(
                        height: 10,
                      ),
                      const PostWidget(),
                    ],
                  );
                },
                childCount: 1, // Количество элементов в списке
              ),
            ),
          ],
        ));
  }
}
