### Features
Focus on `color|theme resources`, will define in application.
ex. support `dark|light theme`...

### Getting started
How to use?

   1. Aware about `/assets` folder exists in this module, included : `/fonts`, `/images`, ...

   2. Developer using color in `cc_color.dart` file.
   
   3. Developer using Text Style in `cc_text_style.dart` file.
   
   4. Dark|Light theme setup in `cc_themes.dart` file.

## Additional information
1. Docs
   
a. [Defined & inject color list](https://tailwindcss.com/docs/customizing-colors)


      Expect : Learn to setup color asset json file for :
      
      - Designer easily fill in
      
      - Developer only read it, no need fill in manually

b. [Design text style rule for mobile devices, follow material design](https://material.
io/blog/design-material-theme-type),
      

      ex. iphone, ipad .v.v. at line : "Typography in Material".
      
      Expect : Rules will restrict designer always update design file.

2. Utils

a. [Where design find color name](https://colors.artyclick.com/color-name-finder/)
      

      ex. : #194109
      
b. [After picked color ex. #194109, need convert to hex color using for mobile devices](https://convertingcolors.
com/android-color-4284900966.html)

      
      ex. : [#194109] => [Android (android.graphics.Color),  0xFF194109]

c. [Setup themes planning rule, included : color, text size, .v.v](https://pub.dev/packages/flex_color_scheme)

      
      ex. : dark theme, light theme .v.v.