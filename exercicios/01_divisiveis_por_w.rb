=begin
1 - Escreva um método que dado um inteiro x, um inteiro y e um inteiro w retorne todos os
números divisíveis por w entre x e y.
=end

def divisiveis_w(x, y, w)
  intervalo = if x <= y
                x..y
              else
                y..x
              end

  array_intervalo = []

  intervalo.each do |i|
    array_intervalo << i if (i % w).zero?
  end
  puts array_intervalo
end

divisiveis_w(20, 4, 5)
