//Demonstrate inheritance
#include <iostream>
using namespace std;
//Define the base class for vehicles
class road_vehicle {
	int wheels;
	int passengers;
public:
	void set_wheels(int num) {
		wheels = num;
	}
	int get_wheels() {
		return wheels;
	}
	void set_passengers(int num) {
		passengers = num;
	}
	int get_passengers() {
		return passengers;
	}
};
//Define a truck
class truck : public road_vehicle {
	int cargo;
public:
	void set_cargo(int size) {
		cargo = size;
	}
	int get_cargo() {
		return cargo;
	}
	void show(); //not yet defined!
};
enum type { car, van, wagon };
class automobile : public road_vehicle {
	enum type car_type;
public:
	void set_type(type t) { car_type = t; }
	enum type get_type() { return car_type; }
	void show();
};
void truck::show() {
	cout << "wheels: " << get_wheels() << endl;
	cout << "passengers: " << get_passengers() << endl;
	cout << "cargo: " << get_cargo() << endl;
}
void automobile::show() {
	cout << "wheels: " << get_wheels() << endl;
	cout << "passengers: " << get_passengers() << endl;
	cout << "type: ";
	switch (get_type()) {
	case car:
		cout << "car";
		break;
	case van:
		cout << "van";
		break;
	case wagon:
		cout << "wagon";
		break;
	}
	cout << endl;
}
int main() {
	truck t1;
	automobile c;
	char AddMore[10] = "yes";
	char vType[100] = "tada";
	while (!strcmp(AddMore, "yes")) {
		cout << "Is this an automobile or a truck? Enter 'automobile' or 'truck'" << endl;
		cin.getline(vType, 100);
		if (!strcmp(vType, "truck"))
		{
			cout << "How many wheels does this vehicle have?" << endl;
			int wheels = 0;
			cin >> wheels;
			t1.set_wheels(wheels);
			cout << "How many passengers can this vehicle hold?" << endl;
			int passengers = 0;
			cin >> passengers;
			t1.set_passengers(passengers);
			//	___ if truck ___
			cout << "How much cargo (in pounds) can this vehicle hold?" << endl;
			int cargo = 0;
			cin >> cargo;
			t1.set_cargo(cargo);
		}
		if (!strcmp(vType, "automobile"))
		{
			cout << "How many wheels does this vehicle have?" << endl;
			int wheels = 0;
			cin >> wheels;
			c.set_wheels(wheels);
			cout << "How many passengers can this vehicle hold?" << endl;
			int passengers = 0;
			cin >> passengers;
			c.set_passengers(passengers);
			//	___ if automobile ___
			cout << "What type of automobile is this?   Enter van, car or wagon" << endl;
			char aType[50];
			cin >> aType;
			//cin.getline(aType, 50);
			if (aType == "van")
			{
				c.set_type(van);
			}
			else if (aType == "car")
			{
				c.set_type(car);
			}
			else if (aType == "wagon")
			{
				c.set_type(wagon);
			}
			else {
				//cout << "What you have entered is wrong. Please try again." << endl;
				//cin.getline(aType, 50);
			}
		}
		//	___ before the next, to end the loop ___
		cout << "Would you like to enter another vehicle? yes or no" << endl;
		cin >> AddMore;
		//cin.getline(AddMore, 100); // When "no" is entered, exit loop because it is no longer AddMore does not = "yes"
		if (!strcmp(AddMore, "yes" ))
		{
			continue;
		}
		else {
			continue;
		}
	}

	t1.show();
	c.show();

	cin.get();
	return 0;
}
