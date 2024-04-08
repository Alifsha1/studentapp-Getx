import 'package:get/get.dart';
import 'package:studentapp/Repository/student_repository.dart';
import 'package:studentapp/model/student_model.dart';

class StudentDataController extends GetxController {
  var allStudents = <StudentModel>[].obs;
  StudentRepository studentRepository = StudentRepository();

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  fetchStudents() async {
    var student = await studentRepository.getStudent();
    allStudents.value = student;
  }

  addStudents(StudentModel studentModel) {
    studentRepository.add(studentModel);
    fetchStudents();
  }

  updateStudent(StudentModel studentModel) {
    studentRepository.update(studentModel);
    fetchStudents();
  }

  deleteStudent(int id) {
    studentRepository.delete(id);
    fetchStudents();
  }
}
