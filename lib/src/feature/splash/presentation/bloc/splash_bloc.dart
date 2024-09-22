import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_wise/src/core/cache/shared_preferences/shared_preferences_manager.dart';
import 'package:track_wise/src/core/injection/injection_container.dart';

import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<InitializeApp>((event, emit) async {
      emit(SplashLoading());
      try {
        await di<SharedPreferencesManager>().checkFirtLaunch();
        emit(SplashLoaded());
      } catch (e) {
        emit(SplashError(e.toString()));
      }
    });
  }
}
