// lib/models/profile.dart
class Profile {
  final String userId;
  final String firstName;
  final String lastName;
  final String companyName;
  final String logo;
  final String middleName;
  final String about;
  final String avatar;
  final List<String> skills;
  final String study;
  final String location;
  final String status;
  final double rating;
  final List<String> posts;
  final List<String> experience;
  final List<String> cases;
  final List<String> interests;
  final List<String> vacancies;
  final List<String> chats;
  final List<String> groups;
  final List<String> targets;

  Profile({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.logo,
    required this.middleName,
    required this.about,
    required this.avatar,
    required this.skills,
    required this.study,
    required this.location,
    required this.status,
    required this.rating,
    required this.posts,
    required this.experience,
    required this.cases,
    required this.interests,
    required this.vacancies,
    required this.chats,
    required this.groups,
    required this.targets,
  });
}
