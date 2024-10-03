class Student
{
  int? id;
  String? name;
  String? subject;

  // method 
  StudentMap(){
    var mapping = Map<String,dynamic>();
    mapping["id"] = id ?? null;
    mapping["name"] = name;
    mapping["subject"] = subject;

    return mapping;
  }
}