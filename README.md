# Notes
- Explain folder structure
- pubspec `flutter packages get`
  - vscode will auto install
  - Repo: https://pub.dartlang.org/
- Installed fontawesome: https://pub.dartlang.org/packages/font_awesome_flutter
- Flutter color from Hex
- Assets management
- Device usb debugging
- Camera plugins usage
- Debugging
- Profiling
- Orientation locking
- Orientation based layout

# Implmented Features:
## Drawer:
   - Swipeable from scren left edge towards right.  
   - Implementation was easy as flutter natively supports it.   
    <img src="./snapshots/swipeable_drawer.gif" alt="drawer" width="300"/>

## App Bar or Top Nav bar - With variants
- **Variant1**- Sticky top nav bar as shown in drawer demo.   
    <img src="./snapshots/navbar_sticky.gif" alt="sticky nav" width="300"/>
- **Variant2**- Sticky navbar based on scroll direction allowing more content      
    <img src="./snapshots/navbar_scroll_directional_sticky.gif" alt="scroll direction based sticky nav" width="300"/>
- **Variant3**- Animated parallax navbar with banner and sticky subheader (ex. tab)   
    <img src="./snapshots/navbar_parallax.gif" alt="parallax nav" width="300"/>

## Swipeable Bottom Nav bar with slide animation
- Slide animation on tap gesture
- Swipeable tabs   
    <img src="./snapshots/Animated_bottom_nav.gif" alt="parallax nav" width="300"/>

## Responsive Grid Content
- Layout update based on orientation detection. On potrait mode 2 column grid and On landscape mode 4 column grid

## Plugins Development
- Battery
- Camera

## Sticky Header
- Sticky header
- On keyboard sticky headers remain in place   
    <img src="./snapshots/sticky_header.gif" alt="sticky header" width="300"/>
  