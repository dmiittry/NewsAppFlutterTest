import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/model/post.dart';
import 'package:flutter_project/rest_api/api_data.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  PostBloc(this.postRepository) : super(PostEmptyState()) {
    on<PostLoadEvent>((event, emit) async {
      emit(PostLoadingState());

      try {
        final List<Post> postLoadedList = await postRepository.getAllPosts();
        emit(PostLoadedState(postLoader: postLoadedList));
      } catch (error) {
        emit(PostErrorState());
        // print(error);
      }
    });
  }
}
