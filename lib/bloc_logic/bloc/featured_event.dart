// ignore_for_file: override_on_non_overriding_member

part of 'featured_bloc.dart';

abstract class FeaturedEvent {}

class AddFeaturedEvent extends FeaturedEvent {
  final Post post;

  AddFeaturedEvent(this.post);

  @override
  List<Object> get props => [post];
}

class RemoveFeaturedEvent extends FeaturedEvent {
  final Post post;
  RemoveFeaturedEvent(this.post);

  @override
  List<Object> get props => [post];
}
