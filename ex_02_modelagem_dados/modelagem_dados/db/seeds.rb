puts "Limpando dados antigos..."
EventParticipation.destroy_all
Event.destroy_all
User.destroy_all
puts "Criando novos dados..."

puts "Criando Usuarios"
10.times do |i|
  User.create!(
    name: "Usuario #{i + 1}",
    email: "usuario#{i + 1}@gmail.com"
  )
end
puts "Usuario criado com Sucesso"

puts "Criando Eventos"
3.times do |i|
  Event.create!(
    title: "Workshop de Ruby on Rails #{i + 1}",
    date: (i + 1).days.from_now
  )
end
puts "Eventos criado com Sucesso"


puts "Cadastrando participações em eventos..."

# Pegamos todos os IDs de usuários e eventos existentes para garantir que a relação funcione
user_ids = User.pluck(:id)
event_ids = Event.pluck(:id)

if user_ids.empty? || event_ids.empty?
  puts "Você precisa ter usuários e eventos cadastrados antes de rodar este seed!"
else
  6.times do |i|
    EventParticipation.create!(
      user_id: user_ids.sample,
      event_id: event_ids.sample,
      present: i.even? 
    )
  end
  puts "6 participações criadas com sucesso (alternando true/false)!"
end


