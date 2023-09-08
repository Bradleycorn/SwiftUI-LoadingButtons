# SwiftUI-LoadingButtons

This is a demo app that includes a set of animations for a set of "Loading Indicators".
It includes three types of Indicators:
 - **Flashing**: A set of dots with animated opacity to create a sequenced "flashing" effect. 
 - **Pulsing**: A set of dots with animated opacity and scale to create a sequenced "pulsing" effect. 
 - **Bouncing**: A set of dots with animated offset (y-axis) to create a "bouncing" effect.

## Loading Buttons
The Primary use case is for a "Loading Button". That is, a button that has a text label, and can be put into a "loading" state where the text label is replaced with a set of loading indicators.

To show a button, just use the `LoadingButton` View:
```
// This would probably be in a ViewModel or other ObservableObject
@State var isLoading: Bool = false

LoadingButton(
    label: "My Button",
    type: .Pulsing,
    isLoading: isLoading,
    action: { isLoading.toggle() }
)
.buttonStyle(.borderedProminent)
```

The Loading button will look like this:
![](https://github.com/Bradleycorn/SwiftUI-LoadingButtons/blob/master/docs/images/LoadingButtons.gif)

## ViewModifier
The LoadingButton relies on a `loadingOverlay` view modidifer to render the "loading dots". 
And In fact, you could use this modifier on any view to show loading dots.

Just add the `.loadingOverlay(type:isLoading:)` modifier to any view. 

![](https://github.com/Bradleycorn/SwiftUI-LoadingButtons/blob/master/docs/images/LoadingOverlay.gif)

# SwiftUI Views
The overlay uses the `LoadingIndicator(_:dotSize:)` view to show a set of 3 loading dots.
You can use this view anywhere you like to show 3 animated loading dots. 
The LoadingIndicator view uses the `AnimatedDots` view to show it's dots. 
You can call the `AnimatedDots(numberOfDots:type:size:)` view anywhere to show as many dots as you like.

![](https://github.com/Bradleycorn/SwiftUI-LoadingButtons/blob/master/docs/images/AnimatedDots.gif)
