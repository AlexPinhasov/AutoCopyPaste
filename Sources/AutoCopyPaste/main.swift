import Foundation
import SWXMLHash

guard let xmlOutput = Array(CommandLine.arguments.dropFirst()).first else { fatalError("Missing XML output as an argument")}

print(duplications: SWXMLHash.parse(xmlOutput)["pmd-cpd"].children.compactMap { Duplication(xml: $0) })

func print(duplications: [Duplication]) {
    duplications.forEach({ duplication in
        duplication.files.forEach { file in
            let otherFilesPath = duplication.files.filter({ $0 != file }).compactMap({ "📕 \(NSString(string: $0.path).lastPathComponent) (\($0.line)-\($0.line + duplication.lines))" })
            print("\(file.path):\(file.line): warning: 📝 Lines (\(file.line)-\(file.line + duplication.lines)) are a copy-paste from: \(otherFilesPath)")
        }
    })
}
