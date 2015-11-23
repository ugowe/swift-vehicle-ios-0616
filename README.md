# Swift — Vehicle

## Objectives

1. Create custom classes in an inheritance chain.
2. Add properties to a subclass.
3. Write initializers that call the superclass's initializer.
4. Write new methods available to a subclass.
5. Override methods inherited from a superclass.

## Instructions

Open the `swift-vehicle.xcworkspace` file.

### I. `Vehicle`

Create a new file to hold a custom class named `Vehicle`.

It should have five properties:

* an immutable `String` named `name`,
* an immutable `Double` named `weight`,
* an immutable `Double` named `maxSpeed`,
* a mutable `Double` named `speed`, and
* a mutable `Double` named `heading`.  
**Top-tip:** *The* `heading` *property is measured in angular degrees,* `0` *to* `360`. *Changes to this property should always keep it within this range.*

Set the variable properties to zero as a default.

Write a designated initializer that covers the three immutable properties.

#### Methods

Write the following six methods, none of which take any arguments nor provide a return:

1. `goFast()` which sets the vehicle's `speed` equal to its `maxSpeed`.

2. `halt()` which sets the vehicle's `speed` to zero.

3. `accelerate()` which increases the `speed` by one tenth (1/10th) of the vehicle's `maxSpeed`. This should not increase the `speed` beyond the `maxSpeed`.

4. `decelerate()` which decreases the `speed` by one tenth (1/10th) of the vehicle's `maxSpeed`. This should not decrease the `speed` below zero.

5. `turnRight()` which increases the `heading` by 90 angular degrees and cuts the `speed` in half (the physics of turning has a momentum cost). This method should have no effect on a stationary vehicle (a vehicle can only turn if it is moving).  
**Top-tip:** *Remember to keep the* `heading`*'s value between* `0` *and* `360`.

6. `turnLeft()` which has the *effect* of decreasing the `heading` by 90 angular degrees. Similarly, this should cut the `speed` in half and should have no effect on a stationary vehicle.  
**Top-tip:** *The modulus operator won't perform the math that you want if you simply feed it* `-90`. *You're going to have to help it figure out how to simulate a left turn.*

![](https://curriculum-content.s3.amazonaws.com/swift/swift-vehicle/zoolander_ambiturner.gif)

### II. `Car`

Create a new file for a custom class named `Car` that inherits from the `Vehicle` class.

The `Car` class should add three new properties:

* an immutable `String` named `transmission`,
* an immutable `Int` named `cylinders`, and
* an immutable `Double` named `milesPerGallon`.

Write a designated initializer that takes six arguments total, the three arguments for the superclass's initializer (`name`, `weight`, and `maxSpeed`), and three arguments for these new properties (`transmission`, `cylinders`, and `milesPerGallon`). The initializer should set all three new properties to their associated arguments, and call the superclass's initializer, passing it the correct arguments that it requires.

#### Add New Methods

1. Write a new method named `drive()` which takes no arguments and provides no return. This method should simply call the `accelerate()` method inherited from the superclass.

2. Write a new method named `brake()` which take no arguments and provides no return. This method should simply call the `decelerate()` method inherited from the superclass.

### III. `RaceCar`

Create a new file for a custom class named `RaceCar` that inherits from the `Car` class.

The `RaceCar` class should add two new properties:

* an immutable `String` named `driver`, and
* a mutable array of type `String` named `sponsors`.

The designated initializer should accept eight (8) arguments total, six for the superclass's initializer, and two for the new properties. It should set these two new properties to the arguments, and pass the other six along to the superclass's initializer.

#### Override Superclass Methods 

Race cars have powerful engines and high performance brakes.

1. Override the `accelerate()` method that is inherited from the `Vehicle` class. It should increase the `speed` by one fifth (1/5th) of the `maxSpeed`. However, it should not increase the `speed` beyond the `maxSpeed`.

2. Override the `decelerate()` method that is also inherited from the `Vehicle` class. It should decrease the `speed` by one fifth (1/5th) of the `maxSpeed`. However, it should not decrease the `speed` below zero.

#### Add New Methods

Race cars also have professional drivers who can navigate sharp turns without losing as much speed. We'll refer to this ability as "drifting".

1. Write a new method named `driftRight()` which takes no arguments and provides no return. If the race car is in motion, it should increase the heading by 90 angular degrees, but only decrease the `speed` by one quarter (1/4) of its current value (instead of one half).

2. Write a new method named `driftLeft()` which takes no arguments and provides no return. If the race car is in motion, it should have the *effect* of decreasing the heading by 90 angular degrees (handle this the same way you handled the heading in `turnLeft()`), but only decrease the `speed` by one quarter (1/4) of its current value (instead of one half).

These new methods should not affect `turnRight()` or `turnLeft()`; they are separate abilities.

### `Plane`

Create a new file for a custom class named `Plane` that also inherits from `Vehicle`.

The `Plane` class should add three new properties:

* an immutable `Double` named `maxAltitude`,
* a mutable `Double` named `altitude`, and
* a calculated `Bool` named `inFlight`.

Set `altitude`'s initial value to zero.

Program `inFlight` to return `True` if **both** the `speed` and the `altitude` are greater than zero.

Write a designated initializer that takes four arguments, three for the superclass's properties and one for `maxAltitude`.

#### Add New Methods

Write new aviation methods which take no arguments nor provide any returns:

1. `takeOff()` which only affects a plane that is not in flight. This method should set the `speed` and `altitude` properties to one tenth (1/10th) of their maximums.

2. `land()` which sets the `speed` and `altitude` properties to zero.

3. `climb()` which increases the `altitude` by one tenth (1/10th) of the plane's `maxAltitude` and causes the plane to *decelerate*. This method should not increase the `altitude` beyond the `maxAltitude` and can only be performed when the plane is in flight.

4. `dive()` which decreases the `altitude` by one tenth (1/10th) of the plane's `maxAltitude` and causes the plane to *accelerate*. This method should not decrease the `altitude` below zero and can only be performed if the plane is not already on the ground. However, if the plane's speed is zero, it is still in the air but has "stalled" and is still able to perform a dive in order to convert altitude into speed.

5. `bankRight()` which increases the `heading` by 45 angular degrees but only decreases the `speed` by one tenth (1/10th) of its current value. This method can only be performed by a plane that is in flight.

6. `bankLeft()` which has the *effect* of decreasing the `heading` by 45 angular degrees, but only decreases the `speed` by one tenth (1/10th) of its current value. This method can only be performed by a plane this is in flight.

### `Jet`

Create a new file for a custom class named `Jet` that inherits from `Plane`.

The `Jet` class does not add any new properties.

#### Override Methods

Jets have stronger engines than regular planes and are more aerodynamic. This allows them to climb and dive at better rates.

1. Override the `climb()` method to increase the jet's `altitude` by one fifth (1/5) of the `maxAltitude` (instead of one tenth). Similar to the superclass's implementation, this method should *decelerate* the plane, should not increase the `altitude` beyond the `maxAltitude`, and can only be performed by a jet that is in flight.

2. Override the `dive()` method to decrease the jet's `altitude` by one fifth (1/5) of the `maxAltitude` (instead of one tenth). Similar to the superclass's implementation, this method should *accelerate* the plane, should not decrease the `altitude` below zero, and can only be performed by a jet that is in flight.

#### Add A New Method

Jets (i.e. military jets) have a special ability called "using the afterburner" that allows them to reach incredible speeds.

1. Write a new method named `afterburner()` which takes no arguments and provides no return. This method should set the `speed` to *twice* the value of the jet's `maxSpeed` but **only** if the jet is in flight **and** already traveling at its maximum speed.

**//Flat-fact:** *The* [SR-71 Blackbird](https://en.wikipedia.org/wiki/Lockheed_SR-71_Blackbird) *is the fastest non-experimental aircraft in the world and can reach a speed of Mach 3.3 which is in excess of 2200 miles per hour.*

## Play Around

Create a few instances of your new vehicular classes in the `AppDelegate`'s `application:didfinishLaunchingWithOptions:` method. See what methods and properties are available to your instances at different places in the inheritance chain.