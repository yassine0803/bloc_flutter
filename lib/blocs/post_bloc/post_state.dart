part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}
class LoadingState extends PostState{}
class LoadedState extends PostState{
  List<Post> posts;

  LoadedState({required this.posts});
}

class FailedToLoadState extends PostState{
  String error;
  FailedToLoadState({required this.error});
}

