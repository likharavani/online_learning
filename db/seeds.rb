@data=[
  {
    name: "Java for begineers",
    price: 5600,
    description: "5 lessons",
    image:'/assets/course_images/background.jpg'
  },
  {
    name:"DSA using Python",
    price:5600,
    description:"5 lessons",
    image: '/assets/course_images/background.jpg'
  },
  {
    name:"C language",
    price:5600,
    description:"5 lessons",
    image: '/assets/course_images/background.jpg'
  },
  {
    name:"Web Development",
    price:5600,
    description:"5 lessons",
    image: '/assets/course_images/background.jpg'
  },
  {
    name:"C++ Language",
    price:5600,
    description:"5 lessons",
    image: '/assets/course_images/background.jpg'
  },
  {
    name:"Python for begineers",
    price:5600,
    description:"5 lessons",
    image: '/assets/course_images/background.jpg'
  },
  {
    name:"Java Advanced",
    price:5600,
    description:"5 lessons",
    image: '/assets/course_images/background.jpg'
  },
  {
    name:"STL in C++",
    price:5600,
    description:"5 lessons",
    image: '/assets/course_images/background.jpg'
  },
  {
    name:"C,C++ and DSA",
    price:5600,
    description:"5 lessons",
    image: '/assets/course_images/background.jpg'
  },
]
@data.each do |data_item|
  Course.create(data_item) end
@pdf_data=[
  {
  name: "Java tutorial",
  path: "/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf"
},
{
  name: "DSA using python tutorial",
  path: "/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf"
},
{
  name: "C language tutorial",
  path: "/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf"
},
{
  name: "Web Development tutorial",
  path: "/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf"
},
{
  name: "C++ Language tutorial",
  path: "/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf"
},
{
  name: "Python for begineers tutorial",
  path: "/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf"
},
{
  name: "Java Advanced tutorial",
  path: "/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf"
},
{
  name: "STL in C++ tutorial",
  path: "/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf"
},
{
  name: "C,C++ and DSA tutorial",
  path: "/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf,/assets/course_pdfs/java_tutorial.pdf"
},]
@course_ids=Course.pluck(:id)

@pdf_data.each_with_index do |data_item,index|
  course=Course.find_by(id:@course_ids[index])
    course.pdfs.create(data_item)

end
