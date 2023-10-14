import 'package:bloc/bloc.dart';
import 'package:zed/presentation/screens/home/home_screen.dart';
import 'package:zed/presentation/screens/notifications/notification_screen.dart';
import 'package:zed/presentation/screens/profile/profile_screen.dart';
import 'package:zed/presentation/screens/search/search_screen.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitial());
  void indexChanger(int index) {
    emit(BottomNavigationState(index: index));
  }

  List screens = const[
    HomeScreen(),
    SearchScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
}
