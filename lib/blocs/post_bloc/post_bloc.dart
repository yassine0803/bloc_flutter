import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_patern/models/post_model.dart';
import 'package:flutter_bloc_patern/services/post_service.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final _postService = DataService();
  PostBloc() : super(LoadingState()) {
    on<PostEvent>((event, emit) async{
      if(event is LoadEvent || event is PullToRefreshEvent){
        emit(LoadingState());
        try{
          final posts =await  _postService.getPosts();
          emit(LoadedState(posts: posts));
        }catch(e){
          emit(FailedToLoadState(error: e.toString()));
        }
      }
    });
  }
}
