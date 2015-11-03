// Playground - noun: a place where people can play

import UIKit

/*
var name = "Variavel"
let rname = "Constantes"

name = "TEste 1234"
println(name)

// comentarios

comentarios
*/

/*
var first:String
var second = 10 //int
var third:Double
var last = true //bool


let name = "eggplant"
let calories = 50.5
let eggplantIsVegetable = true

func helloCalories() {
    println("Hello calories !!!");
}

helloCalories();
println("teste")
helloCalories();

func add(name:String, calories:Double) {
    println("adding \(name) \(calories)")
}

add("eggplant", 50.5)
*/

/*
let calories = [50.5, 100, 300, 500]
let items:Array<Double> = []


for (var i = 0; i<calories.count; i++) {
    println(calories[i])
}

for i in 0...3 {
    println(calories[i])
}

for i in calories {
    println(i)
}

func allCalories(calories:Array<Double>) -> Double {
    var total:Double = 0
    for c in calories {
        total+=c
    }
    return total
}

var totalCalories = allCalories([10.5, 100, 300, 500]);
println("total calories = \(totalCalories)")

var total = 0
var values = [1,2]
for v in values {
    total += v
}

println(total / values.count)
*/

/*
class Meal {
    var name:String?
    var happiness:Int?
}

var brownie = Meal()

println(brownie.name)

brownie.name = "Eggplant brownie"
brownie.happiness = 3

println(brownie.name)
println(brownie.happiness)

//var name:String!
var name:String? //declara como optional
name = "teste"

//if (name != nil) {
if let n = name {
    println(countElements(n))
} else {
    println("")
}
// ! utiliza valor mesmo sendo optional

var hap = "5"
println(hap.toInt()!)

var happiness = "5"
println(happiness.toInt())

*/

class Meal {
    var name:String
    var happiness:Int
    var items = Array<Item>()
    init(name:String, happiness:Int) {
        self.name      = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total;
    }
    
}

class Item {
    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

let brownie = Meal(name: "eggplant", happiness: 5)
brownie.items.append(Item(name: "brownie", calories: 115))
brownie.items.append(Item(name: "meat cream", calories: 200))

println(brownie.name)
println(brownie.happiness)
println(brownie.allCalories())



