
class StudentDetails {
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? fathersName;
  final String? mothersName;
  final String? nationality;
  final String? parentContact;
  final String? rollNo;
  final String? admissionNumber;
  final String? birthday;
  final String? address;
  final String? schoolName;
  final String? studentclass;
  final String? division;
  final String? alternatePhoneNumber;

  StudentDetails({
    this.firstName,
    this.lastName,
    this.gender,
    this.fathersName,
    this.mothersName,
    this.nationality,
    this.parentContact,
    this.rollNo,
    this.admissionNumber,
    this.birthday,
    this.address,
    this.schoolName,
    this.studentclass,
    this.division,
    this.alternatePhoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'fathersName': fathersName,
      'mothersName': mothersName,
      'nationality': nationality,
      'parentContact': parentContact,
      'rollNo': rollNo,
      'admissionNumber': admissionNumber,
      'birthday': birthday,
      'address': address,
      'schoolName': schoolName,
      'studentclass': studentclass,
      'division': division,
      'alternatePhoneNumber': alternatePhoneNumber,
    };
  }

  factory StudentDetails.fromJson(Map<String, dynamic> json) {
    return StudentDetails(
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      fathersName: json['fathersName'],
      mothersName: json['mothersName'],
      nationality: json['nationality'],
      parentContact: json['parentContact'],
      rollNo: json['rollNo'],
      admissionNumber: json['admissionNumber'],
      birthday: json['birthday'],
      address: json['address'],
      schoolName: json['schoolName'],
      studentclass: json['studentclass'],
      division: json['division'],
      alternatePhoneNumber: json['alternatePhoneNumber'],
    );
  }
}
