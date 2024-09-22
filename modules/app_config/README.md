### Features
Application Configs., save all static vars for application
ex. boolean var., update status var., .v.v.

### Getting started

1. Define|Save `app state|configs` vars or `enum` class. 

2. in `cc_application.dart`, 
   
    - Init Storage Prefs.
    - Config to Init list data storage, ex. ['key_field_1' : value1, ....]
    - Define key param field in list data, using to set|get in Prefs. storage,

    ```dart
      /// ex. 'key_field_1', ...
      @HiveField(0)
      String? token;    
    ```
   
### How to use

MUST binding `registerTypeAdapter()` in `main.dart` for injection.

### Additional information
[pub.dev/hive](https://pub.dev/packages/hive)
