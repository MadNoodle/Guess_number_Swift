//
//  main.swift
//  Devinator
//
//  Created by Mathieu Janneau on 24/10/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import Foundation

///Tuple that declare the min and max between the computer will guess a number
var (min, max) = (0, 9)
/// Int that counts the number of guess by the AI
var count = 0
/// Boolean that says the player is winning while the AI has not guessed the correct number
var win = true

///Generate a random number in a range between a & b
func random(from a:Int, to b:Int) -> Int {
  let randomNumber = Int(arc4random_uniform(UInt32(b)) + UInt32(a))
  return randomNumber
}

/// Ask the user to evaulate the random Number and adapt the range to his answer to make a new proposal
func evaluate(_ randomNumber : Int){
  if let usrChoice = readLine(){
    switch usrChoice {
    case "y":
      print("Vous avez perdu")
      win = false
    case ">":
      if randomNumber == 9 {
        print("Cela n'est pas possible")
      } else {
        min = randomNumber
      }
    case "<":
      if randomNumber == 0 {
        print("Cela n'est pas possible")
      } else {
      max = randomNumber
      }
    default:
      print( "Veuillez entrez y / < / >"
      + "\n Est ce que votre chiffre est \(randomNumber)?")
      evaluate(randomNumber)
    }
  }
}

///MECANICS
//Ask the user to choose a number
print("Choisissez un nombre entre 1 et 9. Appuyez sur une ENTRÉE quand vous etes pret")
 let userChoice = readLine()!
//Propose a random number and ask the users feedback during 3 rounds. The Ai adapts the range following user's choice
 while count < 3 && win {
  let randomNumber: Int
    randomNumber = random(from: min,to: max)
    print("Est ce que votre chiffre est \(randomNumber)?")
    evaluate(randomNumber)
    count += 1
  }
//Says that user wins if the AI has not guess the number after 3 rounds
  if win {print("Vous avez gagné")}
  






