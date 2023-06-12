# ViewBuilderResearch
In this two-part blog series, I will explore ViewBuilder, the tool for building SwiftUI views.
- The first part will introduce the implementer of ViewBuilder — **result builders**; 
- the second part will further explore the secrets of SwiftUI views through **the imitation of ViewBuilder**.

## Goals of this article
After reading both articles, I hope to eliminate or alleviate your confusion about the following questions:
- How to make custom views and methods support ViewBuilder.
- Why complex SwiftUI views are prone to freezing or experiencing compile timeouts in Xcode.
- Why “Extra arguments” error messages appear. (only a limited number of views can be placed on the same level.)
- Why caution should be exercised when using AnyView.
- How to avoid using AnyView.
- Why views still contain information about all choice branches regardless of whether they are displayed or not.
- Why the body of the vast majority of official view types is Never.
- The difference between ViewModifier and modifier specific to a particular type of view.

## How SwiftUI handles views
In SwiftUI, the process of **loading**, responding to **state changes**, and **drawing** on the screen generally goes through the following steps:
- Starting from the root view, **instantiate views** one by one along **a specific branch of the view hierarchy structure** (based on the initial state), **until all the current display needs are met.**
- **The instantiated view values** (structural values, not body values) **will be saved** in SwiftUI’s managed data pool.
- **Create a dependency graph** in the AttributeGraph data pool that corresponds to the currently displayed view tree based on the view’s dependency information, and **monitor changes in dependencies.**
- **Layout and render** based on the **body attribute of the view’s value** in the SwiftUI data pool or the **specific type method** of the view type (not public).
- **When the dependency data changes** due to user or system behavior, **SwiftUI will locate the view** that needs to be re-evaluated based on the dependency graph.
- Starting from the view that needs to be re-evaluated as the root, **instantiate the view type** one by one according to the **current state of the view hierarchy structure** (until all display requirements are met).
- **Remove the values of views that are no longer needed** for layout and rendering from the SwiftUI data pool, and **add new view values** to the data pool.
- **For views** that still need to be displayed but **have changed view values**, **replace the original view values with new view values.**
- **Reorganize the dependency graph** and **draw the newly added and changed views.**
- **Repeat the process cyclically.**


<br>

***

CC.<br>
https://itnext.io/viewbuilder-research-part-1-mastering-result-builders-65ac4f8dcf0d <br>
https://itnext.io/viewbuilder-research-part-2-creating-a-viewbuilder-imitation-7832ab96506b
