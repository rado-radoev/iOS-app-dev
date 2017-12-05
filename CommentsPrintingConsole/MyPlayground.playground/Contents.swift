import UIKit

func bmiCalculatorImperialUnits (weightInPounds : Double, heightInFeet : Double, remainderInches : Double) -> String {
    let weightInKg = weightInPounds * 0.45359237
    let totalInches = heightInFeet * 12 + remainderInches
    let heightInMeters = totalInches * 0.254
    
    return bmiCalculator(wight: Float(weightInKg), height: Float(heightInMeters))
}

func bmiCalculator (wight : Float, height : Float) -> String {
    let bmi = wight / pow(height, 2)
    
    if bmi > 25 {
        return ("You are overweight")
    }
    else if bmi > 18 {
        return ("You are in the norms")
    }
    else {
        return ("Eat somethig")
    }

}

print(bmiCalculatorImperialUnits(weightInPounds: 180, heightInFeet: 5, remainderInches: 6))
print (bmiCalculator(wight: 81, height: 170))
