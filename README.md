# flutter_session_manager

> Adds an easy to use wrapper to session management in flutter. Allows for easy session storage and management. The session persists in the app's' lifetime.

### Store values in the session:
```sh
await SessionManager().set("key", value);
```
or
```sh
var sessionManager = SessionManager();
await sessionManager.set("name", "cool user");
await sessionManager.set("id", 3);
await sessionManager.set("measure", 23.2);
await sessionManager.set("isLoggedIn", true);
await sessionManager.set("user", new User(id: 1, name: "John", isCool: true, postCount: 4));
```

### Read values from the session:
```sh
dynamic id = await SessionManager().get("id");
```
### Saving objects:
To save objects, the class must have the toJson() method. When getting a object, it returns as a Json that you can Serialize using fromJson() method.

```sh
class User {
  final int id;
  final String name;
  final bool isCool;
  final int postCount;

  User({this.id, this.name, this.isCool, this.postCount});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = Map<String, dynamic>();
    user["id"] = id;
    user["name"] = this.name;
    user["isCool"] = this.isCool;
    user["postCount"] = this.postCount;
    return user;
  }
}

User user = User(id: 1, name: "John", isCool: true, postCount: 4);
await SessionManager().set('user', user);
User u = User.fromJson(await SessionManager().get("user"));
```

### Session Management:
This package contains all operations that may be necessary to manage a session.

- Update session
```sh
await SessionManager().update();
```

- Delete session and all data in it
```sh
await SessionManager().destroy();
```

- Remove a specific item
```sh
await SessionManager().remove("id");
```

- Verify wether or not a key exists
```sh
await SessionManager().containsKey("id"); // true or false
```

## Getting Started

With Flutter, run:
```sh
 $ flutter pub add flutter_session_manager
```

This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
```sh
 dependencies:
  flutter_session_manager: ^1.0.1
```

To import it in your Dart code, you can use:

import 'package:flutter_session_manager/flutter_session_manager.dart';


<!-- CONTRIBUTING -->

## Contributing

  

Contributions are what make the open source community such an amazing place to be learn, inspire, and create.

  

1. Fork the Project

2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)

3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)

4. Push to the Branch (`git push origin feature/AmazingFeature`)

5. Open a Pull Request

  
  
  

<!-- LICENSE -->

## License


Distributed under the MIT License. See `LICENSE` for more information.

Copyright (c) Eduardo Migueis 2021.