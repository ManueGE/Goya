# Goya
An easy way to set custom styles to any `UIResponder` from the Interface Builder written in swift.

## Note
If you need the **Objective-C** version of this library, you are looking for [MGEStyles](http://github.com/ManueGE/MGEStyles).

## Summary
As an iOS developer, I feel very often frustrated with how difficult is to set consistent styles to my views in the Xcode Interface Builder. If you think in a `UILabel`, you can use the same style (font, color and size) for a set of labels in different `UIViewController`. If, some time later, the design changes you'll have to change the properties of all these labels one by one, which is a tedious work. I try to solve this issue by developing `Goya`. This library, inspired by the android **styles** system, simplify this task, giving you the chance of define a totally custom styles in one single place and using it all over your project, using the Inerface Builder or by code. 

**Goya** is provided in two flavours, **Default** and **Lite**. The only difference is that the default version add an inspectable attribute in the interface builder, and lite version doesn't. For more details, please go to the [applying styles section](#applying_styles)

## Installation
### CocoaPods
Add the following to your `Podfile`:

```
pod 'Goya'
```

or if you prefer the **Lite** flavour:

```
pod 'Goya/Lite'
```

If you want the **Swift 2** version, you can use the old version of the library:

```
pod 'Goya', '~> 1.0'
```

Then run `$ pod install`.

If you don't have CocoaPods installed or integrated into your project, you can learn how to do so [here](http://cocoapods.org).

Import the library by doing `import Goya`.

### Manually
Clone or donwload the project and copy the contents of the **Goya** folder into your project. Then, you can remove the **inspectable** folder if you prefer the Lite flavour.


## Usage

The library works in 3 steps:

1 - You have to create the styles you need

2 - You have to register all the stlyes that you want to use in your application. 

3 - Apply these styles in your `UIResponder` in the interface builder or with code. 

### Creating styles:
In this library, the styles are `Style` objects. Each style will have a configuration block, which will tell the library what to do with the `UIResponder`. For example, if you want to create a style for `UILabels` you would do:

````swift
let baseStyle = Style<UILabel> { (label) in
        label.font = .boldSystemFont(ofSize: 50)
        label.numberOfLines = 0
}
````

`Goya` allows inheritance. When a `Style` has a parent, the parent's configuration block is executed before the own block. As an example, we can create a child for the previous style with this method:

````swift
let titleStyle = Style<UILabel>(parent: baseStyle) { (label) in
    label.textColor = .red
    label.textAlignment = .Center
}
````

### Registering Styles:

Registering a `Style` is very easy. You just have to call the following method:

````swift
public func register(name: String)
````

For example, if we want to register the defined **titleStyle** we'll do:

````swift
titleStyle.register("style")
````

The styles should be registered at application launch, so `application:didFinishLaunchingWithOptions:` might seems a good place to do it. Anyway, in order to keep the **AppDelegate** as clean as possible, creating a helper class to create and register all the styles and call this class from the AppDelegate is strongly recommended. 

<a name="applying_styles"></a>
### Applying Styles: 

The final step is to apply the styles. There is 2 ways to do it: 

#### Using Interface Builder:
When you use the **Default** flavour, a new property appears in the attribute inspector in the interface builder. It is called **Style Name**. Here you should provide the key of the registered style you want to apply:

![](https://github.com/ManueGE/Goya/blob/master/readme_imgs/goya_inspector.png?raw=true)

If are using the **Lite** flavour or your version of Xcode doesn't supoort **IBInspectables** you can achieve the same result by addign a new attribute in the **User defined runtime attributes** section. The name must be **gy_styleName**, the type must be **String** and the Value must be the key of your registered style:

![](https://github.com/ManueGE/Goya/blob/master/readme_imgs/goya_manually.png?raw=true)

#### By Code:
`Goya` provides a category which allow apply a style to any `UIResponder`. If you want to apply the registered **style** to a label, you can do it by typing:

````swift
let label = UILabel()
label.gy_styleName = "style"
````

You can also apply a no registered style:

````swift
let label = UILabel()
let titleStyle = Style<UILabel>(parent: baseStyle) { (label) in
    label.textColor = .red
    label.textAlignment = .Center
}
label.gy_style = titleStyle
```` 

## Contact  
[@ManueGE](https://twitter.com/ManueGE)

## License
Goya is available under the MIT License. See [LICENSE](https://github.com/ManueGE/Goya/blob/master/LICENSE).



