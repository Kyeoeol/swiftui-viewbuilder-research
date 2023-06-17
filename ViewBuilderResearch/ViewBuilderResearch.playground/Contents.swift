import SwiftUI


@ImitatingViewBuilder
func makeMyView() -> some ImitatingView {}
print("type of:", type(of: makeMyView()))
// Print: type of: ImitatingEmptyView

//struct MyContentView: ImitatingView {
//    var body: some ImitatingView {
//        ImitatingEmptyView()
//    }
//}
//MyContentView().body.debug()
// Print: ImitatingEmptyView

struct MyContentView: ImitatingView {
    var body: some ImitatingView {
        ImitatingEmptyView()
        ImitatingEmptyView()
    }
}
MyContentView().body.debug()
// Print: TupleView<(ImitatingEmptyView, ImitatingEmptyView)>
