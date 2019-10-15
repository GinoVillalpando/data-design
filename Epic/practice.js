/**
 * let seniorInState = 4
let seniorOutState = 4
let adultInState = 5
let adultOutState = 6
let teenInState = 5
let teenOutState = 6
let childInState = 3
let childOutState = 3

function getPrice (age, instate) {
	let price
	if(instate) {
		// instate cases
		if(age >= 65) {
			price = seniorInState
		} else if(age > 18 && age < 65) {
			price = adultInState
		} else if(age <= 18 && age > 12) {
			price = teenInState
		} else if(age > 3 && age < 13) {
			price = childInState
		} else if(age >= 0 && age <= 3) {
			price = 0
		}
	} else {
		// out of state cases
		if(age >= 65) {
			price = seniorOutState
		} else if(age > 18 && age < 65) {
			price = adultOutState
		} else if(age <= 18 && age > 12) {
			price = teenOutState
		} else if(age > 3 && age < 13) {
			price = childOutState
		} else if(age >= 0 && age <= 3) {
			price = 0
		}
	}
	return price;
}

// let age = 30
// let instate = false
// let price = getPrice(age, instate)
// console.log ("price ", price)

let customers = [
	{age: 35, instate: true},
	{age: 5, instate: true},
	{age: 17, instate: false},
	{age: 67, instate: true},
	{age: 1, instate: false},
	{age: 21, instate: false},
	{age: 0, instate: true},
	{age: 47, instate: false},
];

customers.forEach(function(customer) {

	let price = getPrice(customer.age,customer.instate)

	console.log(customer.age + " " + customer.instate + " " + price)

})

for (let customer = 0; customer < customers.length; customer++){

	let price = getPrice(customers[customer].age,customers[customer].instate)

	console.log(customer + " " + customers[customer].age + " " + customers[customer].instate + " " + price)
}

// or...

for (let i = 0; i < customers.length; i++){

	let price = getPrice(customers[i].age,customers[i].instate)

	console.log(i + " " + customers[i].age + " " + customers[i].instate + " " + price)
}**/