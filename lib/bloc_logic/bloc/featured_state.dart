// ignore_for_file: override_on_non_overriding_member

part of 'featured_bloc.dart';

abstract class FeaturedState {}

class ListFeaturedState extends FeaturedState {
  final List<Post> featuredList;

  ListFeaturedState({required this.featuredList});

  List<Object> get props => [featuredList];
}

class EmptyFeaturedState extends FeaturedState {}
