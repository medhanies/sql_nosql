--Second portion of this assignment is to work on NoSQL queries.  Using the Restaurants database write the following queries using NoSQL syntax.


--1.	Write a MongoDB query to find the restaurants that do not prepare any cuisine of 'American' and their grade score more than 70 and latitude less than -65.754168.

db.restaurants.find(
	 {$and:
	[
	 {"cuisine":{$ne:"American "}},
	 {"grades.score":{$gt:70}},
	 {"address.coord":{$lt:-65.754168}}
	  ]},

{"name":1,"address.coord":1,"cuisine":1, "_id":0});

--2.	Write a MongoDB query to find the restaurants which do not prepare any cuisine of 'American' and achieved a score more than 70 and located in the longitude less than -65.754168. Note : Do this query without using $and operator.

db.restaurants.find(
                           {
                             "cuisine" : {$ne : "American "},
                             "grades.score" :{$gt: 70},
                             "address.coord" : {$lt : -65.754168}
                            }
                     );



--3.	Write a MongoDB query to find the restaurants which do not prepare any cuisine of 'American ' and achieved a grade point 'A' not belongs to the borough Brooklyn. The document must be displayed according to the cuisine in descending order.

db.restaurants.find( {
                             "cuisine" : {$ne : "American "},
                             "grades.grade" :"A",
                             "borough": {$ne : "Brooklyn"}
                       } 
                    ).sort({"cuisine":-1});


--4.	Write a MongoDB query to find the restaurant Id, name, borough and cuisine for those restaurants which contain 'Wil' as first three letters for its name.

db.restaurants.find({"name":/^Wil/},{"restaurant_id":1,"name":1, "borough":1,"cuisine":1, "_id":0});


--5.	Write a MongoDB query to find the restaurant Id, name, borough and cuisine for those restaurants which contain 'ces' as last three letters for its name.

db.restaurants.find({"name":/ces$/},{"restaurant_id":1,"name":1, "borough":1,"cuisine":1, "_id":0});



--6.	Write a MongoDB query to find the restaurant Id, name, borough and cuisine for those restaurants which contain 'Reg' as three letters somewhere in its name.

db.restaurants.find({"name":{$regex:".*Reg.*"}},{"restaurant_id":1,"name":1, "borough":1,"cuisine":1, "_id":0});


--7.	Write a MongoDB query to find the restaurants which belong to the borough Bronx and prepared either American or Chinese dish.

db.restaurants.find({
    "borough":"Bronx",
    $or:[
        {"cuisine":"American "},
        {"cuisine":"Chinese"}
    ]

});


--8.	Write a MongoDB query to find the restaurant Id, name, borough and cuisine for those restaurants which belong to the borough Staten Island or Queens or Bronx or Brooklyn.
db.restaurants.find(
{
    "borough":{
    $in:[
        "Staten Island", "Queens","Bronx","Brooklyn"

    ]
    }

},
{"restaurant
