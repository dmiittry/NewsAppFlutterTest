part of 'post_bloc.dart';

abstract class PostState {}

class PostEmptyState extends PostState {}

class PostLoadingState extends PostState {}

// ignore: must_be_immutable
class PostLoadedState extends PostState {
  List<Post> postLoader;
  PostLoadedState({
    required this.postLoader,
  });
}

class PostErrorState extends PostState {}
