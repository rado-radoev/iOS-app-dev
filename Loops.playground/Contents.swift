//: Playground - noun: a place where people can play

import UIKit
func beerSong(_ totalNumberOfBottles : Int) -> String {
    var lyrics: String = ""
    var bottle : String = ""
    
    for number in (1...totalNumberOfBottles).reversed() {
        if number == 1 {bottle = "bottle"} else { bottle = "bottles"}; if number - 1 == 0 {bottle = "no more"}
        lyrics += "\(number) " + bottle + " of beer on the wall, \(number) bottles of beer\n"
        lyrics += "Take one down and pass it around, \(number - 1 == 0 ? "no more" : \(number)) bottles of beer\n\n"
    }
    
    lyrics += "No more bottles of beef on the wall, no more bottles of beer.\n" +
    "Go to the sotre and buy some more, 99 bottles of beer on the wall.\n"
    
    return lyrics
}

print(beerSong(99))
