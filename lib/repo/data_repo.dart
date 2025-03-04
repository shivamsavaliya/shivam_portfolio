import 'package:shivam_portfolio/models/data_model.dart';

class DataRepo {
  static final List<DataModel> data = [
    DataModel(
      title: 'DePaul University, USA',
      content: "Master's in Computer Science",
      time: '2024 - Present',
    ),
    DataModel(
      title: 'Silver Oak University, India',
      content: "Bachelor's in Computer Engineering",
      time: '2020-2023',
    ),
    DataModel(
      title: 'Government Polytechnic Ahmedabad, India',
      content: "Diploma in Computer Engineering",
      time: '2017-2020',
    ),
  ];

  static final List<DataModel> headerData = [
    DataModel(title: 'Projects'),
    DataModel(title: 'Technologies'),
    DataModel(title: 'About me'),
  ];
}
