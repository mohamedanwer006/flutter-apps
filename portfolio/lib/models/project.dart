class Project {
  String title;
  String description;
  String githubLink;
  String imgUrl;
  List<String> screenShot;

  Project(
      {this.title,
      this.description,
      this.githubLink,
      this.imgUrl,
      this.screenShot});

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
        title: map['title'],
        description: map['description'],
        githubLink: map['githubLink'],
        imgUrl: map['imgUrl'],
        screenShot: map['screenShot']);
  }

  Map<String, dynamic> toMap(Project project) {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['title'] = project.title;
    map['description'] = project.description;
    map['githubLink'] = project.githubLink;
    map['imgUrl'] = project.imgUrl;
    map['screenShot'] = project.screenShot;
    return map;
  }
}

List<Project> projectList = [
  Project(
      title: 'TODO APP',
      description: 'It is simple flutter project used for education',
      githubLink: 'https://github.com/mohamedanwer006/Flutter_TODO_APP',
      imgUrl:
          'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/master/screenshot/Screenshot_3.png',
      screenShot: [
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_3.png',
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_2.png',
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_4.png',
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_5.png',
      ]),
      Project(
      title: 'TODO APP',
      description: 'It is simple flutter project used for education',
      githubLink: 'https://github.com/mohamedanwer006/Flutter_TODO_APP',
      imgUrl:
          'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/master/screenshot/Screenshot_3.png',
      screenShot: [
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_3.png',
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_2.png',
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_4.png',
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_5.png',
      ]),
     Project(
      title: 'TODO APP',
      description: 'It is simple flutter project used for education',
      githubLink: 'https://github.com/mohamedanwer006/Flutter_TODO_APP',
      imgUrl:
          'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/master/screenshot/Screenshot_3.png',
      screenShot: [
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_3.png',
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_2.png',
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_4.png',
        'https://raw.githubusercontent.com/mohamedanwer006/Flutter_TODO_APP/blob/master/screenshot/Screenshot_5.png',
      ]),
];
