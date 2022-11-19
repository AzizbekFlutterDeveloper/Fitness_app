class MashqModel{
  int? id;
  String? img;
  List<String>? name;
  String? min;
  MashqModel({this.id,this.img,this.min,this.name});
}

class HomeModel{
  int? index;
  List<MashqModel>? list;
  HomeModel({this.index,this.list});
}