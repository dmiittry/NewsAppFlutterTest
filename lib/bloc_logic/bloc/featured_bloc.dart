// ignore_for_file: override_on_non_overriding_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/model/post.dart';

part 'featured_event.dart';
part 'featured_state.dart';

final List<Post> currentList = [];

class FeaturedBloc extends Bloc<FeaturedEvent, FeaturedState> {
  FeaturedBloc() : super(EmptyFeaturedState()) {
    on<AddFeaturedEvent>(
      (event, emit) {
        if (currentList.contains(event.post)) {
          return;
        } else {
          currentList.add(event.post);
          emit(ListFeaturedState(featuredList: currentList));
        }
      },
    );
    on<RemoveFeaturedEvent>(
      (event, emit) {
        currentList.remove(event.post);
        if (currentList.isEmpty) {
          emit(EmptyFeaturedState());
        } else {
          emit(ListFeaturedState(featuredList: currentList));
        }
      },
    );
  }
}
