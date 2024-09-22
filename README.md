# Project Structure Template - Project Base

Project Structure templates enable you to capture and re-use the structure and content of existing
projects, including :

    - project pages,
    - custom tracker fields,
    - and work flow definitions,

to speed new project creation and standardize lifecycle processes.

## Documents

Main technologies was used in this project structure.

1. [Dependency Injection in dart](https://medium.com/zipper-studios/dependency-injection-in-flutter-using-inject-dart-package-20d6a5918a5)
   [More References](https://viblo.asia/p/flutter-dependency-injection-di-that-don-gian-voi-get-it-va-injectable-naQZRLkP5vx)

**Dependency Injection using GetIt + Injectable :**
Allows us to focus on logic and not worry how we are going to access it.

    ![alt text](https://blog.pragmaticengineer.com/content/images/2021/04/Screenshot-2021-04-30-at-12.41.10.png)

## Libraries & Tools Used

- [getx](https://pub.dev/packages/get)
- [bloc](https://pub.dev/packages/bloc)

- [get_it](https://pub.dev/packages/get_it)

- [retrofit](https://pub.dev/packages/retrofit)

- [injectable](https://pub.dev/packages/injectable)
- [floor](https://pub.dev/packages/floor)
- [hive_box](https://pub.dev/packages/hive)

- [flutter_hooks](https://pub.dev/packages/flutter_hooks)

- [analyzer](https://pub.dev/packages/analyzer)
- [lint](https://pub.dev/packages/lint)

- [build_runner](https://pub.dev/packages/build_runner)
- [json_serializable](https://pub.dev/packages/json_serializable)

### Explanation

##### Build Runner

Allow us to run our generators during development.

    pub run build_runner **<command>**

<br>
where <command> can be one of these :<br>

    build: run a single build and exit<br>
    watch: runs a daemon that will run on file changes and rebuilds if necessary<br>
    serve: similar to watch, but also runs as a development server<br>
    test: for testing purposes

Most popular command line :

    flutter pub run build_runner build

##### Json Serializable

Allow you to make regular classes serializable by using annotations, an automated source code
generator that generates the JSON serialization boilerplate.

***user.dart***

```
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'user.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class User {
  User(this.name, this.email);

  String name;
  String email;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

```

##### Injectable

It's totally effectively when using combine with `get_it` library as a convenient code generator.

Injectable generates code that we would have otherwise written by using annotations. This allows us
to worry more about logic and less about how we are going to access it.

The *injectable* uses code generation and is based on these annotations :

    1. @injectable : Marks a class as an injectable dependency and generate.
    Most using with model, data .v.v.

        /// `Ex.`
        @injectable
        abstract class ICounterRepository {
            int getIncrement();
        }

        @injectable
        class CounterRepository implements ICounterRepository {
            @override
            int getIncrement() => 1;
        }

        @injectable
        class CounterChangeNotifier extends ChangeNotifier {
            final ICounterRepository _counterRepository;

            CounterChangeNotifier(this._counterRepository);
        }

        void main() {
            configureInjection(Env.prod);
            runApp(MyApp());
        }

        class MyApp extends StatelessWidget {
            @override
            Widget build(BuildContext context) {
                return MaterialApp(
                     title: 'Material App',
                     home: ChangeNotifierProvider(
                       create: (_) => getIt<CounterChangeNotifier>(),
                       child: CounterPage(),
                     ),
                );
            }
        }

    2. @module : Annotates a class as a collection of providers for dependency injection.
    Most using for feature, 3rd library, .v.v.
    3. @preResolve : pre-await the future and register its resolved value.

        /// `Ex.`
        @module
        abstract class RegisterModule {
            @preResolve
            Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
        }

    4. @named : automatically assign the implementation class name to the instance name

        /// `Ex.`
        @named
        @Injectable(as: Service)
        class A implements Service {}

        @injectable
        class MyRepo {
           final Service service;

           MyRepo(@Named.from(A) this.service)
        }

    5. @Named : define names (tags) for registered instance, for later mapping.

        /// `Ex.`
        @Named("impl1")
        @Injectable(as: Service)
        class ServiceImpl implements Service {}


    6. @singleton || @lazySingleton : An injectable class or module provider that provides a single instance.
        (singleton : at first time launch app for using later, cons : ex. make waiting splash screen more longer;
         lazySingleton : inject when using)

        /// `Ex.`
        @module
        abstract class RegisterModule {
          // You can register named preemptive types like follows
          @Named("BaseUrl")
          String get baseUrl => 'My base url';

          // url here will be injected
          @lazySingleton
          Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

          // same thing works for instances that's gotten asynchronous.
          // all you need to do is wrap your instance with a future and tell injectable how
          // to initialize it
          @preResolve // if you need to pre resolve the value
          Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
          // Also, make sure you await for your configure function before running the App.
        }

    7. @Singleton || @LazySingleton

        /// `Ex.`
        @Singleton(dispose: disposeDataSource)
        class DataSource {

          void dispose() {
            // logic to dispose instance
          }
        }
        /// dispose function signature must match Function(T instance)
        FutureOr disposeDataSource(DataSource instance){
           instance.dispose();
        }

        @Singleton(as: Service)
        class ServiceImpl implements Service {}

##### get_it

is a service locator that allows you to create interfaces and their implementations, and access
those implementations globally, anywhere in your app.

    /// `Ex.`
    abstract class RestService {}

    // Initialize
    getIt.registerLazySingleton<PregnancyService>(() => RestService());

    // Using
    PregnancyService pregnancyService = getIt<PregnancyService>();

##### Floor

The *floor* library provides a lightweight SQLite abstraction with automatic mapping between
in-memory objects and database rows while still offering full control of the database with the use
of SQL.

    /// `Ex.`
    @dao
    abstract class PersonDao {
      @Query('SELECT * FROM Person')
      Future<List<Person>> findAllPersons();

      @Query('SELECT * FROM Person WHERE id = :id')
      Stream<Person?> findPersonById(int id);

      @insert
      Future<void> insertPerson(Person person);
    }

##### Retrofit

*retrofit* is a networking library that is used to call the API to fetch or post the data to the
server,

+ JSON data parse into models,
+ easy make GET, POST, PUT, etc requests by using awesome annotations.

    ```
    /// `Ex.`
    @RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
    abstract class RestClient { 
  
        factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
    
        @GET("/tasks")
        Future<List<Task>> getTasks();
    }
    ```

##### Hive Box

*hive* is a fast, lightweight, NoSQL database, for flutter and dart apps. Using same
as `shared_preference`, but faster.

    /// `Ex.`
    var box = Hive.box('myBox'); /// Initialize

    box.put('name', 'David'); /// Save

    var name = box.get('name'); /// Get

    print('Name: $name');

##### Flutter Hooks

The *flutter_hooks* library increasing code-sharing between widgets and reducing duplicates in code.
Most using with `flutter animation`.

    /// `Ex.`
    class Example extends HookWidget {
        const Example({Key key, required this.duration}) : super(key: key);

        final Duration duration;

        @override
        Widget build(BuildContext context) {
            final controller = useAnimationController(duration: duration);
            return Container();
        }
    }

### Folder Structure

```
Template
    ├── lib
    │    ├── src
    │    │    ├── app
    │    │    │    ├── app.dar
    │    │    │    └── app_impl.dart
    │    │    ├── core
    │    │    │    ├── di
    │    │    │    │    ├── module
    │    │    │    │    │      └── ...
    │    │    │    │    └── injection.dart
    │    │    │    ├── network
    │    │    │    │    └── ...
    │    │    │    ├── page
    │    │    │    │    └── page_config.dart
    │    │    │    └── state_management
    │    │    └── presentation
    │    │            ├── home
    │    │            │     └── ...
    │    │            └── setting
    │    │                  └── ...
    │    ├── main.dart
    │    └── main_uat.dart
    │
    ├── modules 
    │   ├── cc_library                                     │
    │   ├── app_config_prefs
    │   │      │
    │   │      ├── box
    │   │      │    ├── cc_hive_box.dart                   │    define type_id for hive_box    
    │   │      │    └── register_type_adapter              │
    │   │      │              └── type_adapter.dart        │    đăng ký type_adapter của hive_box.
    │   │      ├── config
    │   │      │    ├── app_config 
    │   │      │    │         └──  cc_app_config.dart
    │   │      │    ├── application
    │   │      │    │         └──  cc_application.dart
    │   │      │    └──  device_info 
    │   │      │              └──  cc_device_info.dart     │
    │   │      └── enum                                    │    Nơi chứa class enum.     
    │   │           └── ...
    │   ├── content
    │   │      └── cc_localization.dart 
    │   │      
    │   ├── data
    │   │     │
    │   │     ├── config
    │   │     │     ├── floor
    │   │     │     │      └── ...
    │   │     │     ├── di
    │   │     │     │      └── ...
    │   │     │     └── retrofit
    │   │     │            └── ...
    │   │     ├── datasource
    │   │     │      ├── local
    │   │     │      │      └── ...                         │    Nơi chứa local database.    
    │   │     │      └── remote
    │   │     │             └── ...    
    │   │     ├── entities
    │   │     │      └── ...    
    │   │     └── repositories
    │   │            └── ...  
    │   ├── reusable
    │   │     └── custom_widget
    │   │            └── ...    
    │   ├── theme
    │   │     └── src  
    │   │          ├── cc_color.dart                        │         
    │   │          └── cc_text_style.dart                   │
    │   └── widget
    └── End
```
