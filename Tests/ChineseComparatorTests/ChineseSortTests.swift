import XCTest
@testable import ChineseComparator

final class ChineseSortTests: XCTestCase {

    func testPinyin() throws {
        let input = ["一", "二", "三", "四"]
        let output = input.sorted(using: ChineseSortComparator(method: .pinyin, order: .forward))
        // er, san, si, yi
        XCTAssertTrue(output == ["二", "三", "四", "一"], "\(output)")
    }

    func testStroke() throws {
        let input = ["一", "二", "三", "四"]
        let output = input.sorted(using: ChineseSortComparator(method: .stroke, order: .forward))
        XCTAssertTrue(output == ["一", "二", "三", "四"])
    }

    func testGB2312() throws {
        let input = ["一", "二", "三", "四"]
        let output = input.sorted(using: ChineseSortComparator(method: .gb2313, order: .forward))
        XCTAssertTrue(output == ["二", "三", "四", "一"], "\(output)")
    }

    func testBig5() throws {
        let input = ["一", "二", "三", "四"]
        let output = input.sorted(using: ChineseSortComparator(method: .big5, order: .forward))
        XCTAssertTrue(output == ["一", "二", "三", "四"])
    }

    func testUnihan() throws {
        let input = ["一", "二", "三", "四"]
        let output = input.sorted(using: ChineseSortComparator(method: .unihan, order: .forward))
        XCTAssertTrue(output == ["一", "三", "二", "四"])
    }
}
