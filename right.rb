require 'mathn.rb'


#сама функция f(x)
def f(x)
	x**2 - Math::log10(x + 2)
end

def iF(x)
	x**3/3 - (x + 2)*Math::log10(x + 2) + (x + 2)/Math::log(10)
end

$a = 0.5
$b = 1.0
$h = ($b - $a)/100

#Табличные значения
$xi = Array.new(101){|i| $a + $h * i}
$fi = Array.new(101){|i| f($xi[i])}
#Интегрирование
def integral(a, b)
	iF(b) - iF(a)
end

#Интегрирование численное
def myIntegrate(a, b)
	r = 0
	for i in (0...100)
		r += $fi[i + 1]
	end
	r * $h
end

puts "Фактический: #{integral($a, $b)}"
puts "Численно подсчитанный: #{myIntegrate($a, $b)}"
