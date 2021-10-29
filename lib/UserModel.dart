class UserModel{
  //data Type
  int? id;
  // ignore: non_constant_identifier_names
  String? first_name;
    // ignore: non_constant_identifier_names
    String? last_name;
    String? status;
    // ignore: non_constant_identifier_names
    String? last_seen_time;
    int? messages;

  String? imageURL;
// constructor
  UserModel(
      {
       this.id,
      // ignore: non_constant_identifier_names
      this.first_name,
           this.imageURL,
           // ignore: non_constant_identifier_names
           this.last_name,
           this.status,
           // ignore: non_constant_identifier_names
           this.last_seen_time,
           this.messages,

      }
   );
  //method that assign values to respective datatype vairables
  UserModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    first_name =json['first_name'];
   imageURL = json['avatar'];
    last_name =json['last_name'];
    status =json['status'];
        messages =json['messages'];

    last_seen_time =json['last_seen_time'];

  }
}