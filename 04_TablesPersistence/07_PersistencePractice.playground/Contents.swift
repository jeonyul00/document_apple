import UIKit

struct Note:Codable {
    let title:String
    let text:String
    let timeStamp:Date
}

// let newNote = Note(title: "jobs", text: "apple story", timeStamp: Date())
let note1 = Note(title: "note1", text: "note1 content", timeStamp: Date())
let note2 = Note(title: "note2", text: "note2 content", timeStamp: Date())
let note3 = Note(title: "note3", text: "note3 content", timeStamp: Date())
let note4 = Note(title: "note4", text: "note4 content", timeStamp: Date())

let notes:[Note] = [note1,note2,note3,note4]

let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
let propertyListEncoder = PropertyListEncoder()
let encodedNotes = try? propertyListEncoder.encode(notes)
try? encodedNotes?.write(to: archiveURL, options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()
if let retrievedNotesData = try? Data(contentsOf: archiveURL), let decodedNotes = try? propertyListDecoder.decode([Note].self, from: retrievedNotesData) {
    print(decodedNotes)
}
