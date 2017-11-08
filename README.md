# Tap
DRY and simple solution to fire an action when a view is tapped on iOS.

On any UIView (or subclass of UIView) object you can use it like this:
```
Tap.on(anyView) { print("Tap on anyView") }
```

You can hold a reference to the `Tap` object to enable/disable it:
```
let tapOnAnyView = Tap.on(anyView) { print("Tap on anyView") }
tapOnAnyView.isEnabled = NO

```
