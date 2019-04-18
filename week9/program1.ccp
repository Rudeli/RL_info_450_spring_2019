//Demonstrate inheritance
#include <iostream>
using namespace std;
#include <fstream>

class road_vehicle {
public:
	int wheels;
	int passengers;
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

//							 THIS IS THE NODE CLASS 
class node {
public:
	road_vehicle data;
	/*
	int wheels;
	int passengers;
	char vType[255];
	int cargo;
	char aType[250];
	*/
	node *next;
	//node *list = NULL;
	node() {
		next = NULL;
	}
	/*
	void set_wheels(int w) {
		wheels = w;
	}
	void set_passengers(int w) {
		passengers = w;
	}
	void set_vType(char str[250]) {
		strcpy_s(vType, str);
	}
	void set_aType(char str[250]) {
		strcpy_s(aType, str);
	}
	void set_cargo(int i) {
		cargo = i;
	}
	*/

	//CAN'T FIGURE THIS OUT
	void insert(road_vehicle *rv) {
		if (next == NULL) {
			data = *rv;
		}
		else {
			next->insert(rv);
		}
	}

	void show() {
		cout << " road_vehicle " << "truck" << " wheels " << data.get_wheels() << " passengers " << data.get_passengers();

		if (next != NULL) {
			next->show();
		}
	}
	};



int main() {
		node list;

		//list->insert(&s); // This should be at the bottom after you set the numbers


		truck t1;
		automobile c;
		char AddMore[10] = "yes";
		char vType[100] = "tada";
		while (!strcmp(AddMore, "yes")) {
			//list.insert();
			cout << "Is this an automobile or a truck? Enter 'automobile' or 'truck'" << endl;
			cin.getline(vType, 100);
			if (!strcmp(vType, "truck"))
			{
				//list.set_vType(vType);
				cout << "How many wheels does this vehicle have?" << endl;
				int wheels = 0;
				cin >> wheels;
				t1.set_wheels(wheels);
				//list.set_wheels(wheels);
				cout << "How many passengers can this vehicle hold?" << endl;
				int passengers = 0;
				cin >> passengers;
				t1.set_passengers(passengers);
				//list.set_passengers(passengers);
				cout << "How much cargo (in pounds) can this vehicle hold?" << endl;
				int cargo = 0;
				cin >> cargo;
				t1.set_cargo(cargo);
				//list.set_cargo(cargo);
			}
			else if (!strcmp(vType, "automobile"))
			{
				//list.set_vType(vType);
				cout << "How many wheels does this vehicle have?" << endl;
				int wheels = 0;
				cin >> wheels;
				c.set_wheels(wheels);
				//list.set_wheels(wheels);
				cout << "How many passengers can this vehicle hold?" << endl;
				int passengers = 0;
				cin >> passengers;
				c.set_passengers(passengers);
				//list.set_passengers(passengers);
				cout << "What type of automobile is this?   Enter van, car or wagon" << endl;
				char aType[50];
				cin >> aType;
				//cin.getline(aType, 50);
				if (!strcmp(aType, "van"))
				{
					c.set_type(van);
					//list.set_aType(aType);
				}
				else if (!strcmp(aType, "car"))
				{
					c.set_type(car);
					//list.set_aType(aType);
				}
				else if (!strcmp(aType, "wagon"))
				{
					c.set_type(wagon);
					//list.set_aType(aType);
				}
				else {
					cout << "What you have entered is wrong. Please try again." << endl;
					cin.ignore();
					cin.getline(aType, 50);
				}
			}
			//	___ before the next, to end the loop ___
			cout << "Would you like to enter another vehicle? yes or no" << endl;
			cin.ignore();
			cin.getline(AddMore, 10); // When "no" is entered, exit loop because it is no longer AddMore does not = "yes"
		}

	
		ofstream out;
		out.open("output.txt"); //Start Writing
		t1.show();
		c.show();
		list.show();

		out.close(); // Stop writing


		cin.get();
		cin.get();
		return 0;
}
