import UIKit

/*
 1. Check to see if string need more than one edit
 
 Possible Edits
 - Remove a char
 - Replace a char
 - Insert new car
 
 Ex.
 pale, ple -> true
 pale, bale -> true
 pale, bake -> false
 
 Considerations/Questions
 
 - Capitalization?
 - (no symbols)
 - count of words
 - the present letters
 
 Brute force solution:
 - put original word into hash table
 - [Key: "a", value: false]
 - loop through other word
 - if hashtable's keys contain the letter, change to true
 - if not change to false
 - at end, if hashtable contains more than one false, return false
 - else return true
 */

func oneAway(origWord: String, compareWord: String) -> Bool {
    
    guard origWord.count > 1 else {
        if compareWord.count > 2 {
            return false
        }
        return false
    }

    var hashTable: [Character : Bool] = [:]

    for char in origWord {
        hashTable[char] = false
    }

    for char in compareWord {
        if hashTable.keys.contains(char) {
            hashTable[char] = true
        } else {
            hashTable[char] = false
        }
    }

   let array = hashTable.keys.filter({
        origWord.contains($0) == false
    })

    let count = array.count

    if count > 1 {
        return false
    }
    else {
        return true
    }
}

var testWord1 = "adam"
var testWord2 = "rady"

print(oneAway(origWord: testWord1, compareWord: testWord2))
