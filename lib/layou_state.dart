abstract class LayouState{}
class LayoutInitialState extends LayouState{}
class GetUserDataSuccess extends LayouState{}
class GetUserDataFaild extends LayouState{
  final String message;
  GetUserDataFaild({required this.message});
}
class GetUserDataLoadind extends LayouState{}
