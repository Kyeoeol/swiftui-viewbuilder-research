import SwiftUI


// MARK: Simple Usage
@resultBuilder
struct StringBulider {
    static func buildBlock(_ components: String...) -> String {
        components.map { "⭐️" + $0 + "🌈" }.joined(separator: " ")
    }
}

@StringBulider
func getStrings() -> String {
    "아메리카노"
    "돌체라떼"
    "콜드브루"
}
print(getStrings())


// MARK: @resultBuilder
/*
 Swift 5.4에서 SE-0289의 ResultBuilder가 도입되었다.
 이미 Swift 5.1에서 _functionBuilder 라는 이름으로 구현되었으며, Swift 5.4에서 ResultBuilder라는 이름으로 사용되고 있다.
 Result Builder Type은 함수의 표현식-문에서 부분 결과를 수집하여 반환 값(return value)로 결합하기 위한 임베디드 DSL(Domain Specific Language) 이다. 즉, 각 함수의 표현식-문의 결과를 모으고 조립하여 전체 결과를 반환한다.
 Property Wrapper인 @resultBuilder 를 추가하고 build 함수들을 구현하면 된다.
 */

@resultBuilder
struct ResultBuilderSample {
    
    /// Used to build the combined result of a statement block.
    /// @resultBuilder는 최소 하나의 buildBlock을 제공해야함
    static func buildBlock(_ components: String...) -> String {
        ""
    }
    
    /// Builder가 `buildOptional(_:)`을 채택할 경우 statement block에서 옵셔널 처리를 할 수 있다
//    static func buildOptional(_ component: <#Component#>?) -> <#Component#> {
//        <#code#>
//    }
    
    /// Builder가 `buildEither(_:)`을 채택할 경우 statement block에서 `if else` or `swift`문 사용 가능
//    static func buildEither(first component: <#Component#>) -> <#Component#> {
//        <#code#>
//    }
//    static func buildEither(second component: <#Component#>) -> <#Component#> {
//        <#code#>
//    }
    
    /// Builder가 `buildArray(_:)`을 채택할 경우 statement block에서 `for...in`문 사용 가능
//    static func buildArray(_ components: [<#Component#>]) -> <#Component#> {
//        <#code#>
//    }
    
    /// Allows the result builder to distinguish between Expression types and Component types, providing contextual type information for statement expressions.
//    static func buildExpression(_ expression: <#Expression#>) -> <#Component#> {
//        <#code#>
//    }
    
    /// Builder는 `buildFinalResult(_:)`을 통해 최종적으로 반환되는 타입을 변경할 수 있다
//    static func buildFinalResult(_ component: <#Component#>) -> <#Result#> {
//        <#code#>
//    }
    
    /// API 호환성을 개선하기 위해 제한된 환경(예: #available인 경우)에서 buildBlock에 의해 생성된 부분 결과를 모든 환경에 적합한 결과로 변환하는 데 사용
//    static func buildLimitedAvailability(_ component: <#Component#>) -> <#Component#> {
//        <#code#>
//    }
}
