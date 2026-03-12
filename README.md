# ChineseComparator

A Swift package for comparing and sorting Chinese text using standard collation methods.

## Installation

### Swift Package Manager

To add ChineseComparator to your Xcode project:

1. Go to **File → Add Package Dependencies...**
2. Enter the repository URL: `https://github.com/zonble/ChineseComparator`
3. Click **Add Package**

Alternatively, add it directly to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/zonble/ChineseComparator", from: "1.0.0")
]
```

## Usage

ChineseComparator offers two ways to compare Chinese strings:

### 1. Direct String Comparison

Use the `compare(_:options:range:method:)` method on any `String` to compare two Chinese strings using a specified collation method:

```swift
import ChineseComparator

let string1 = "一"
let string2 = "二"

// Compare the two strings using Pinyin ordering
let result = string1.compare(string2, options: [], range: nil, method: .pinyin)
```

### 2. Sorting Arrays with `SortComparator`

Use `ChineseSortComparator` with Swift's `sorted(using:)` API to sort an array of Chinese strings. This requires iOS 15.0+, macOS 12.0+, tvOS 15.0+, or watchOS 8.0+.

```swift
import ChineseComparator

let chineseNumbers = ["一", "二", "三", "四"]

// Sort by Pinyin pronunciation: 二 (èr), 三 (sān), 四 (sì), 一 (yī)
let sortedByPinyin = chineseNumbers.sorted(using: ChineseSortComparator(method: .pinyin))

// Sort by stroke count
let sortedByStroke = chineseNumbers.sorted(using: ChineseSortComparator(method: .stroke))

// Sort by GB2312 encoding order
let sortedByGB2312 = chineseNumbers.sorted(using: ChineseSortComparator(method: .gb2313))
```

You can also sort in reverse order by passing `.reverse` to the `order` parameter:

```swift
let reverseSorted = chineseNumbers.sorted(using: ChineseSortComparator(method: .pinyin, order: .reverse))
```

## Collation Methods

ChineseComparator supports five collation methods, each suited to different use cases:

| Method | Description |
|--------|-------------|
| **`.stroke`** | Sorts by the number of strokes in each character. Commonly used in Taiwan and Hong Kong. |
| **`.pinyin`** | Sorts by Mandarin pronunciation (Pinyin). Commonly used in Mainland China. |
| **`.big5`** | Sorts by Big5 encoding order. Big5 is a character encoding used for Traditional Chinese. |
| **`.gb2313`** | Sorts by GB2312 encoding order. GB2312 is a character encoding used for Simplified Chinese. |
| **`.unihan`** | Sorts by Unicode Han database (Unihan) order. |

## Platform Support

- iOS 15.0+
- macOS 12.0+
- tvOS 15.0+
- watchOS 8.0+

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

Copyright © 2024 zonble. All rights reserved.
