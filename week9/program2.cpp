#include <iostream>
#include <fstream>
using namespace std;

class road_vehicle {
	int wheels;
	int passengers;
	char str[255];
public:
	road_vehicle *next;
	road_vehicle() {
		next = NULL;
	};
	void show();

	void insert_str() {
		if (next == NULL) {
			next = new road_vehicle;
		}
		else {
			next->insert_str();
		}
	}

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
void set_class(char vehicletype [200]) {
	strcpy(str, vehicletype);
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
	void show() {
		cout << "road_vehicle" << "truck" << "wheels" << get_wheels() << "passengers" << get_passengers() << "cargo" << cargo << endl;
		;
	}
};
enum type { car, van, wagon };
class automobile : public road_vehicle {
	enum type car_type;
public:
	void set_type(type t) { car_type = t; }
	enum type get_type() { return car_type; }
	void show() {
		cout << "road_vehicle" << "automobile" << "wheels" << get_wheels() << "passengers" << get_passengers() << "type" << car_type << endl;
		;
	}
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
	road_vehicle linked_list;
	char str[255];
	ifstream in;
	in.open("output.txt");

	while (in) {
		in.getline(str, 255);  // delim defaults to '\n'
		linked_list.set_class(str);

		in.getline(str, 255);
		linked_list.set_wheels(int(str));

		in.getline(str, 255);
		linked_list.set_passengers(int(str));

		
		cout << "LINE:*" << str << "*" << endl; //Was told not to use arrows.
	}

	in.close();

	ofstream out;
	out.open("test.txt");
	while (linked_list.next != NULL) { //Loop until there are no more nodes left;
		void show();
	}
	out.close();

	return 0;
}
