## Features
Able to get for all projects :

    - re-use popular widgets, ex. : InkWellClick, ArrowWidget, FavoriteButtonWidget .v.v 
    
    - re-use feature|function, ex. : Scan QR code, CountDownTimer, Deep Link, Logger .v.v 

It always exists at `git` url for projects to import in `pubspec.yaml` file.

    ex.
    cc_library:
    git:
      url: https://bitbucket.org/${prj_name}
      ref: master
      path: modules/cc_library/
      version: ^0.0.10


NOTICE that : 

    a. Distribution : Everytime distribute latest source code to sub-project, MUST increase version in `pubspec.yaml`
    
    b. If there are duplicated|oldest `cc_library` module in section `Dart Packages` (at Project tab)
    
        Sometimes it happens when IDE can not know where is latest version.
        
        Try to get latest version by using :
    
        * Solution 1 :

            - MUST run `flutter clean` in module `widget` & `root` project
    
            - MUST invalidate & restart IDE (if has)
            
            - MUST `flutter pub cache clean` to clean old version

            - MUST `flutter pub upgrade` in module `widget` & `root` project, to get latest version

            - MUST `flutter pub get` in module `widget` & `root` project

        * Solution 2 : (FAST STEP)

            - Guarantee commit|push all code

            - Delete current project

            - Then get latest project by using `git clone https://coc.mobile.erp.git`

            at : https://coc.mobile.erp/src/master/

            - Switch to correct branch, ex. `master`.v.v

### Refs.
<br />
- CurlUtils
<br />
Tutorial : [![Define new constants in file configuration](https://img.youtube.com/vi/khiMnGwhD8U/0.jpg)](https://www.youtube.com/watch?v=khiMnGwhD8U)