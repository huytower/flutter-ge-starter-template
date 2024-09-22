# TIPS

### Import curl request into Postman?

Easily config using by importing `curl command line` into `Postman tool`.

   ```
   ex.
   Step 1 : In `Logcat|Run` tab, the ex. displayed logging :
   `[Curl]:
   curl --location --request GET https://6065f2b5b8fbbd0017567c45.mockapi.io/apiv1/test \
   -d "{}"`
   
   Step 2 : Open `Postman` tool -> click `Import` button -> select `Raw text` -> paste it
   ```

#### Hide Generated Files

- `Android Studio` tool : `Preferences` -> `Editor`-> `File Types` -> `ignore files and folders`, then paste 
  separate lines :

  ```
    *.inject.summary
    *.inject.dart
    *.g.dart
  ```

- `Visual Studio Code` tool : `Preferences` -> `Settings` and search for `Files:Exclude`, then paste separate lines :

  ```
    **/*.inject.summary
    **/*.inject.dart
    **/*.g.dart
  ```

#### Increase capacity of macos while using Developer Tool
This way will `increase capacity` significantly

<br />
- Remove many unnecessary `system_image` files (`android emulator` os version)

![](/docs/increase_capacity/delete_system_image.png)

<br />
- Remove old version, ex. `kotlin_version`, `jdk version` ...

![](/docs/increase_capacity/delete_old_version.png)

<br />
- Delete folder `CoreSimulator` (`ios simulator` os version), by this way :

![](/docs/increase_capacity/select_xcode_device_emulator.png)

<br />
then, `delete all unnecessary simulator version`, as below example :

![](/docs/increase_capacity/xcode_simulator_list.png)

![](/docs/increase_capacity/delete_folder_core_simulator.png)

<br />
- Only build|run app with `Real Device`, not use `Emulator|Simulator` anymore

<br />
- Delete folder `Caches` in folder path : `Library/Caches/`

<br />
- Delete `App Caches`

![](/docs/increase_capacity/delete_app_cache.png)

<br />
- Delete old|unnecessary `gradle` version, keep `using stable gradle version`

<br />
- Delete old|unnecessary `flutter sdk` version, keep `using stable flutter sdk version`

<br />
- Delete old|unnecessary `android ndk` version, keep `using stable ndk version`

![](/docs/increase_capacity/delete_unnecessary_ndk_version.png)

<br />
- Delete all `*.apk` was built by `Developer Tools`

<br />
- Turn of auto-update : `macos version`, `postman version`, ...