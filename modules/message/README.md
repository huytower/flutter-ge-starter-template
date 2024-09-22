## Features
Config. multi-language, multi-locale

## Getting started
How to use?

    1. Aware about `/assets` folder exists in this module.

    2. Create corresponding locale folder if need, 
      ex. `modules/locale/assets/translations/{$USER}/{$PAGE}`,
      [with {$USER} = userA; {$PAGE} = home]
    
    3. Add corresponding text in *.json, ex. : en.json && vi.json ..v.v
    
    4. Define corresponding locale path in `cc_localization.dart` if has,
    /// ex. '$path_language_directory/thanh_ph/home/home_en.json',
    
    5. Define corresponding locale path in `pubspec.yaml`
    
    /// ex.
    ```yaml
    flutter:
      uses-material-design: true
      
      assets:
      - assets/translations/
      
          - assets/translations/thanh_ph/home/
          - assets/translations/thanh_ph/setting/
      
          - assets/translations/huy_ph/home/
          - assets/translations/huy_ph/setting/
    ```

## Additional information
[pub.dev/easy_localization](https://pub.dev/packages/easy_localization)