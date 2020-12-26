# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all

d = Category.create(title: "Decor")
f = Category.create(title: "Furniture")
a = Category.create(title: "Architectural & Salvage")
g = Category.create(title: "Garden")
l = Category.create(title: "Lighting")
app = Category.create(title: "Art, Posters & Paintings")
s = Category.create(title: "Sculpture")
c = Category.create(title: "Ceramics")
kt = Category.create(title: "Kitchen & Tabletop")
tx = Category.create(title: "Textiles")
ca = Category.create(title: "Clothing & Accessories")
b = Category.create(title: "Books")
t = Category.create(title: "Toys")
cu = Category.create(title: "Curiosities")
