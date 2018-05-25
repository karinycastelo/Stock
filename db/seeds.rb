# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

User.create(id: 2, name: "ADMIN", email: "admin@admin.com",
  password: "123456", password_confirmation: "123456", role_id: 1)

User.create(id: 3,
name: "Secretário de Saúde", email: "saude@saude.com",
password: "123456", password_confirmation: "123456", role_id: 2)

User.create(id: 4, name: "Secretário de Educacão", email: "edu@edu.com",
password: "123456", password_confirmation: "123456", role_id: 2)

User.create(id: 5, name: "Secretário de Finanças", email: "fin@fin.com",
password: "123456", password_confirmation: "123456", role_id: 2)

User.create(id: 6, name: "Secretário de Finanças", email: "fin@fin.com",
      password: "123456", password_confirmation: "123456", role_id: 2)

User.create(id: 7, name: "Secretário de Finanças", email: "fin@fin.com",
      password: "123456", password_confirmation: "123456", role_id: 2)

User.create(id: 8, name: "Nanderson", email: "nanderson@gmail.com",
      password: "123456", password_confirmation: "123456", role_id: 4)

User.create(id: 9, name: "Tales", email: "tales@gmail.com",
        password: "123456", password_confirmation: "123456", role_id: 4)
  
Secretary.create(id: 1, name: "Secretaria de Saúde", address: "", user_id: 3)
Secretary.create(id: 2, name: "Secretaria de Educação", address: "", user_id: 4)
Secretary.create(id: 3, name: "Secretaria de Finanças", address: "", user_id: 5)

Sector.create(id: 1, name: "UPA", address: "", secretary_id: 1)
Sector.create(id: 2, name: "Hospital", address: "", secretary_id: 1)
Sector.create(id: 3, name: "UBS 1", address: "", secretary_id: 1)
Sector.create(id: 4, name: "UBS 2", address: "", secretary_id: 1)

Type.create(description: "Bloco")
Type.create(description: "Caixa")
Type.create(description: "Máquina")

Enterprise.create(id: 1, name: "ALUCOM", address: "", description: "Aluguel de máquinas")

Item.create(code: 1, name: "Teste 1", description: "Testessss ssss ss ss ss s s s sSSSSSsssss ssss",
    patrimony: 123, type_id: 1, sector_id: 1, quantity: 0, user_id: 8, rent: false)
Item.create(code: 2, name: "Teste 2", description: "Testessss aa aaa aaaaaa aa s s s AAAaaAAaAa ssss",
    patrimony: 321, type_id: 1, sector_id: 1, quantity: 0, user_id: 8, rent: false)
Item.create(code: 3, name: "Teste 2", description: "Testessss ssss fasdfasf sdfsfasdf ss fasdfsdf s s sSSSSSsssss ssss",
    patrimony: 456, type_id: 2, sector_id: 3, quantity: 0, user_id: 8, rent: false)
Item.create(code: 4, name: "Computer 1", description: "Testessss bbbbb ccc ssdd aaaaa s s s sSSSSSsssss ssss",
    patrimony: 654, type_id: 3, sector_id: 3, quantity: 0, user_id: 8, rent: true, enterprise_id: 1)