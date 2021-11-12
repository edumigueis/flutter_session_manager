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

To save objects like in the last example, the class must have the toJson() method. When getting a object, it returns as a Json that you can Serialize using fromJson() method.

``` 
class User {
  final int id;
  final String name;
  final bool isCool;
  final int postCount;

  User({this.data, this.id, this.isCool, this.postCount});

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

### Read values from the session:
```sh
dynamic id = await SessionManager().get("id");
```