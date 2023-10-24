@data=[
  {
    name: "Java for begineers",
    price: 5600,
    description: "5 lessons"
  },
  {
    name:"DSA using Python",
    price:5600,
    description:"5 lessons"
  },
  {
    name:"C language",
    price:5600,
    description:"5 lessons"
  },
  {
    name:"Web Development",
    price:5600,
    description:"5 lessons"
  },
  {
    name:"C++ Language",
    price:5600,
    description:"5 lessons"
  },
  {
    name:"Python for begineers",
    price:5600,
    description:"5 lessons"
  },
  {
    name:"Java Advanced",
    price:5600,
    description:"5 lessons"
  },
  {
    name:"STL in C++",
    price:5600,
    description:"5 lessons"
  },
  {
    name:"C,C++ and DSA",
    price:5600,
    description:"5 lessons"
  },
]
@data.each do |data_item|
  Course.create(data_item) end
