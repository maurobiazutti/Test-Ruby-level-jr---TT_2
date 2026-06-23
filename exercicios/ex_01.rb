def div_w(x, y, w)
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

div_w(12, 1, 2)
