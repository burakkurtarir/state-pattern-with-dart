class User {
  final String name;
  final bool isAdmin;

  User(this.name, this.isAdmin);
}

abstract class DocumentState {
  void publish();
  void saveAsDraft();
}

class Draft extends DocumentState {
  User user;
  Document document;

  Draft({required this.user, required this.document});

  @override
  void publish() {
    if (user.isAdmin) {
      print("Published by admin ${user.name}");
      document.changeState(Published(document: document, user: user));
    } else {
      print("Submitted to Moderation by user ${user.name}");
      document.changeState(Moderation(user: user, document: document));
    }
  }

  @override
  void saveAsDraft() {
    print("It's already in Draft");
  }
}

class Published extends DocumentState {
  Document document;
  User user;

  Published({
    required this.document,
    required this.user,
  });

  @override
  void publish() {
    print("It's already in Published");
  }

  @override
  void saveAsDraft() {
    print("Moved to Draft by ${user.name}");
    document.changeState(Draft(user: user, document: document));
  }
}

class Moderation extends DocumentState {
  User user;
  Document document;

  Moderation({required this.user, required this.document});

  @override
  void publish() {
    if (user.isAdmin) {
      print("Published by admin ${user.name}");
      document.changeState(Published(document: document, user: user));
    } else {
      print("User cannot access to Moderation");
    }
  }

  @override
  void saveAsDraft() {
    if (user.isAdmin) {
      print("Moved to draft by admin ${user.name}");
      document.changeState(Draft(user: user, document: document));
    } else {
      print("User cannot access to Moderation");
    }
  }
}

class Document {
  User user;
  late DocumentState state;

  Document({required this.user}) {
    // Document state is Draft by default
    state = Draft(user: user, document: this);
  }

  void changeState(DocumentState state) {
    this.state = state;
  }

  void publish() {
    state.publish();
  }

  void saveAsDraft() {
    state.saveAsDraft();
  }
}

void main(List<String> args) {
  final user = User("Tolkien", true);

  final document = Document(user: user);
  document.publish();
  document.saveAsDraft();
  document.publish();
}
