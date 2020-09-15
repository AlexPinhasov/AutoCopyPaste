//
//  Duplication.swift
//  
//
//  Created by Alex Pinhasov on 15/09/2020.
//

import Foundation
import SWXMLHash

struct Duplication {
    private(set) var lines: Int = 0
    private(set) var tokens: Int = 0
    private(set) var content: String = ""
    private(set) var files: [File] = []

    private enum Keys: String {
        case totalLines = "lines"
        case tokens
        case filePath = "path"
        case line
        case content = "codefragment"
        case file
    }

    init(xml: XMLIndexer) {
        if let linesText = xml.element?.attribute(by: Keys.totalLines)?.text, let lines = Int(linesText),
            let tokensText = xml.element?.attribute(by: Keys.tokens)?.text, let tokens = Int(tokensText) {
            self.lines = lines
            self.tokens = tokens
        }

        xml[Keys.file].all.forEach {
            if let pathText = $0.element?.attribute(by: Keys.filePath)?.text,
                let lineText = $0.element?.attribute(by: Keys.line)?.text, let line = Int(lineText) {
                self.files.append(File(path: pathText, line: line))
            }
        }
        self.content = xml[Keys.content].element?.text ?? ""
    }
}
