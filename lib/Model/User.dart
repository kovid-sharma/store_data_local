// TODO Implement this library.
class User{
  String? id;
  String title='KOVID';
  String? body;
  String age='0';
  String gender='M';
  User({
    this.id,
    required this.title,
    this.body
  });

  User.fromJson(Map<String,dynamic> json){
    id=json["id"];
    title=json["name"];
    body=json["atype"];
  }


}