# start-swift3
still on learning progress

Things we learn.

  - DATA TYPE/ VARIABLE
  - IF ELSE and SCWITH CASE
  - LOOP
  - FUNCTION
  - OPTIONAL
  - CLASS
  - INHERITANCE

## DATA TYPE/ VARIABLE
    var —> changable
    let —> constant
    data type: String, Boolean, Int, Double (), Float(shorter than double)

### Array:
```
var someInt = [Int] ()
someint.append(1) / someInt += [1,2,3,4]
someints.count
```
### Sets:
```
var letter = Set<Character>()
var letter = Set<Int>()
```
### Dictionary: <key : value>:
```
var nameOfInteger= [Int: String]()
nameOfInteger[2] = "two"

var nameOfInteger = [Int: [String]] ()
nameOfInteger[2] = ["two","dua"]

print(nameOfInteger[2]?[0])
```

## IF ELSE and SCWITH CASE
```
var num = 131

if (num == 33) {
    print(num)
}else if (num > 33){
    print("bigger than 33")
}else {
    print("smaller than 33")
}

switch num {
case 33:
    print(num)
case 0..<33:
    print("smaller than 33")
default:
    print("bigger than 33")
}
```

## LOOP
```
for i in 0..<10 {
    print(i)
}

var number: [Int] = [1,2,3,4]
for i in number {
    print(i)
}

var count: Int = 10

while count < 10 {
    print(count)
    count+=1
}

repeat {
    print("ass")
    count+=1
}
while count < 10
```

## FUNCTION
```
func Count (response: String, ct: Int) -> String {
    var count = ct
    var res: String = ""
    while count < 10 {
        res = response
        count+=1
    }
    return res
}

Count(response: "hai", ct: 4)
```

## OPTIONAL
```
var myStr: String?

//WRONG
print(mystr+ “suffix”)

// RIGHT
myStr = "grant"
if let test = myStr {
    print(test + "suffix")
}
```

## CLASS
```
class FastCar {
    var topSpeed: Int
    
    // constructor
    init(topSpeed : Int) {
        self.topSpeed = topSpeed
    }
    
    func GetTopSpeed() -> Int {
        return self.topSpeed
    }
}

var myCar = FastCar(topSpeed: 210)
myCar.GetTopSpeed()
```

## INHERITANCE
```
class Car {
    var topSpeed: Int
    
    init(topSpeed : Int) {
        self.topSpeed = topSpeed
    }
    
    func GetTopSpeed() -> Int {
        return self.topSpeed
    }
}

class MyCar: Car {
    var door = 4
    
    init(door : Int, topSpeed: Int) {
        super.init(topSpeed: topSpeed)
        self.door = door
    }
}

var distra = MyCar(door: 4, topSpeed: 200)
distra.door
distra.GetTopSpeed()
```
