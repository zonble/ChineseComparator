import Foundation

public enum ChineseCompareMethod: String {
    case stroke = "zh@collation=stroke"
    case pinyin = "zh@collation=pinyin"
    case big5 = "zh@collation=big5han"
    case gb2313 = "zh@collation=gb2312"
    case unihan = "zh@collation=unihan"
}

public extension String {
    func compare(_ another: String, options: String.CompareOptions, range: Range<Index>?, method: ChineseCompareMethod) -> ComparisonResult {
        let locale = Locale(identifier: method.rawValue)
        return self.compare(another, options: options, range: range, locale: locale)
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct ChineseSortComparator: SortComparator {
    public typealias Compared = String
    public var order: SortOrder = .forward
    public private(set) var method: ChineseCompareMethod
    private var locale: Locale

    public init(method: ChineseCompareMethod, order: SortOrder = .forward) {
        self.method = method
        self.order = order
        self.locale = Locale(identifier: method.rawValue)
    }

    public func compare(_ lhs: String, _ rhs: String) -> ComparisonResult {
        switch self.order {
        case .forward:
            return lhs.compare(rhs, options: [], range: nil, locale: locale)
        case .reverse:
            return rhs.compare(lhs, options: [], range: nil, locale: locale)
        }
    }
}
