abstract class AppEvent {}

/*
   THOSE ARE EVENTS FOR THE USER INTERFACE
*/
class CHANGEMENU implements AppEvent {
  final int index;
  CHANGEMENU(this.index);
}
