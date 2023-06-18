import SwiftUI


@ImitatingViewBuilder
func makeMyView() -> some ImitatingView {}
print("type of:", type(of: makeMyView()))
// Print: type of: ImitatingEmptyView

struct MyContentView1: ImitatingView {
    var body: some ImitatingView {
        ImitatingEmptyView()
    }
}
MyContentView1().body.debug()
// Print: ImitatingEmptyView

struct MyContentView2: ImitatingView {
    var body: some ImitatingView {
        ImitatingEmptyView()
        ImitatingEmptyView()
    }
}
MyContentView2().body.debug()
// Print: TupleView<(ImitatingEmptyView, ImitatingEmptyView)>

struct MyContentView3: ImitatingView {
    var body: some ImitatingView {
        ImitatingGroup {
            ImitatingEmptyView()
            ImitatingEmptyView()
        }
    }
}
MyContentView3().body.debug()
// Print: ImitatingGroup<TupleView<(ImitatingEmptyView, ImitatingEmptyView)>>

struct MyContentView4: ImitatingView {
    var body: some ImitatingView {
        ImitatingGroup {
            ImitatingEmptyView()
            ImitatingText("Hello, Playground!")
        }
    }
}
MyContentView4().body.debug()
// Print: ImitatingGroup<TupleView<(ImitatingEmptyView, ImitatingText)>>
