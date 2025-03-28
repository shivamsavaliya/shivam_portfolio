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
  ];

  static final List<DataModel> headerData = [
    DataModel(title: 'Projects'),
    DataModel(title: 'Technologies'),
    DataModel(title: 'About me'),
  ];

  static final List<DataModel> projectData = [
    DataModel(
      title: 'Wattvita',
      content:
          "Designed the UI for WattVita, a smart home app built with Flutter using Provider for state management. Implemented features such as WiFi status check, interactive graphs for data visualization, a clean and intuitive interface, and a QR scanner for enhanced functionality.",
    ),
    DataModel(
      title: 'UdhariPe',
      content:
          "Designed a responsive UI for UdhariPe, a financial app built with Flutter. Integrated a gauge tracker to monitor user's finances, along with user profile, notifications, transaction history, and authentication screens. Added a QR code scanning feature for seamless transactions, enhancing usability and convenience.",
    ),
    DataModel(
      title: 'Charnet',
      content:
          "A mobile app available on the AppAdvice for locating nearby EV charging stations and viewing rates. Implemented WebSocket for real-time station availability and pricing updates. Integrated a secure payment gateway for seamless transactions and an automated invoicing system to generate receipts, enhancing the user experience.",
    ),
  ];
}
