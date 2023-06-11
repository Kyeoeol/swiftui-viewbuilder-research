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

<br>

***

CC.<br>
https://itnext.io/viewbuilder-research-part-1-mastering-result-builders-65ac4f8dcf0d <br>
https://itnext.io/viewbuilder-research-part-2-creating-a-viewbuilder-imitation-7832ab96506b
