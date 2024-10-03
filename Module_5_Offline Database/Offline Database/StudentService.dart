import 'package:firstapp/Offline%20Database/Repository.dart';
import 'package:firstapp/Offline%20Database/Student.dart';


class Studentservice
{
  late Repository repository;

  // constructor 
  Studentservice(){
    repository = Repository();
  }

  // insert service 
  insertService(Student student)
  {
    return repository.insertData("student", student.StudentMap());
  }

  // read Service 
  readService()
  {
    return repository.readData("student");
  }

  // updateService
  updateService(Student student)
  {
    return repository.updateData("student", student.StudentMap());
  }

  // delete Service 
  deleteService(Student student)
  {
    return repository.deleteData("student", student.StudentMap());
  }

}