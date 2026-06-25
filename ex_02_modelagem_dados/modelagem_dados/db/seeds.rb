puts "Limpando dados antigos..."
# Limpamos os prêmios primeiro por causa das chaves estrangeiras
Prize.destroy_all 
EventParticipation.destroy_all
Event.destroy_all
User.destroy_all
puts "Dados limpos!"

puts "\nCriando novos dados..."

# 1. Criando Usuários
puts "Criando Usuários..."
10.times do |i|
  User.create!(
    name: "Usuário #{i + 1}",
    email: "usuario#{i + 1}@gmail.com"
  )
end
puts "10 Usuários criados com sucesso!"

# 2. Criando Eventos
puts "\nCriando Eventos..."
3.times do |i|
  Event.create!(
    title: "Workshop de Ruby on Rails #{i + 1}",
    date: (i + 1).days.from_now
  )
end
puts "3 Eventos criados com sucesso!"

# 3. Cadastrando participações em eventos
puts "\nCadastrando participações em eventos..."

# Pegamos os objetos de usuários e eventos para trabalhar melhor
users = User.all
events = Event.all

if users.empty? || events.empty?
  puts "Você precisa ter usuários e eventos cadastrados antes de rodar este seed!"
else
  events.each do |event|
    # Para cada evento, vamos pegar 5 usuários aleatórios e únicos para se inscreverem
    # O método .sample(5) garante que não vamos pegar o mesmo usuário duas vezes para o mesmo evento
    users.sample(5).each_with_index do |user, index|
      EventParticipation.create!(
        user: user,
        event: event,
        # Alterna entre true e false para termos uma lista de presentes e ausentes
        present: index.even? 
      )
    end
  end
  puts "Participações criadas com sucesso para todos os eventos!"
end

# 4. Criando e distribuindo os Prêmios
puts "\nCriando e distribuindo os Prêmios..."

events.each do |event|
  # Criamos os 3 prêmios permitidos por evento (estamos no limite máximo da validação)
  3.times do |i|
    prize = Prize.new(
      event: event,
      title: "Prêmio #{i + 1} do #{event.title}"
    )

    # Buscando APENAS os usuários que estão marcados como presentes neste evento
    presentes = event.users.where(event_participations: { present: true })

    # Se houver alguém presente, o seed já sorteia o ganhador respeitando a regra do model
    if presentes.any?
      prize.winner = presentes.sample
    end

    prize.save!
  end
end
puts "3 Prêmios criados e sorteados por evento com sucesso!"
puts "\n🚀 Seed executado com sucesso completo!"