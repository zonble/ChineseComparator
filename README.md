# ChineseComparator

A Swift package for comparing and sorting Chinese text using various collation methods.

## Copyright

Copyright © 2024 zonble. All rights reserved.

## Installation

### Swift Package Manager

You can add ChineseComparator to your project using Swift Package Manager. In Xcode:

1. Go to File → Add Package Dependencies...
2. Enter the repository URL: `https://github.com/zonble/ChineseComparator`
3. Click Add Package

Or add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/zonble/ChineseComparator", from: "1.0.0")
]
```

## Usage

ChineseComparator provides two main ways to compare Chinese text:

### 1. String Extension for Comparison

```swift
import ChineseComparator

let string1 = "一"
let string2 = "二"

// Compare using Pinyin method
let result = string1.compare(string2, options: [], range: nil, method: .pinyin)
```

### 2. SortComparator for Sorting Arrays (iOS 15.0+, macOS 12.0+)

```swift
import ChineseComparator

let chineseNumbers = ["一", "二", "三", "四"]

// Sort using different methods
let sortedByPinyin = chineseNumbers.sorted(using: ChineseSortComparator(method: .pinyin))
let sortedByStroke = chineseNumbers.sorted(using: ChineseSortComparator(method: .stroke))
let sortedByGB2312 = chineseNumbers.sorted(using: ChineseSortComparator(method: .gb2313))
```

## Available Comparison Methods

ChineseComparator supports five different Chinese collation methods:

- **`.stroke`** - Sort by stroke count
- **`.pinyin`** - Sort by Pinyin pronunciation
- **`.big5`** - Sort using Big5 encoding order
- **`.gb2313`** - Sort using GB2312 encoding order  
- **`.unihan`** - Sort using Unicode Han database order

## Platform Support

- iOS 15.0+
- macOS 12.0+
- tvOS 15.0+
- watchOS 8.0+

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
