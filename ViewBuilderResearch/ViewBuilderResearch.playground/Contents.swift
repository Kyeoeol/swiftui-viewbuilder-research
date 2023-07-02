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

struct MyContentView5: ImitatingView {
    
//    var show: Bool
    var section: Int
    
    var body: some ImitatingView {
//        if show {
//            ImitatingEmptyView()
//        }
//        else {
//            ImitatingEmptyView()
//            ImitatingEmptyView()
//        }
        switch section {
        case 0:
            ImitatingText("section 0")
        case 1:
            ImitatingText("section 1")
        default:
            ImitatingText("section ...")
        }
    }
}
//MyContentView5(show: true).body.debug()
MyContentView5(section: 2).body.debug()


struct OverlayTestView: ImitatingView {
    var body: some ImitatingView {
        ImitatingGroup {
            ImitatingText("Hello,")
        }
        .overlay(ImitatingText("World!"))
    }
}
