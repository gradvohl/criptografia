# Algoritmo para calcular os valores de d, baseado nos valores de p, q e e, para o algoritmo RSA.
#
# Prof. Andre Leon Sampaio Gradvohl, Dr.
# Ultima atualizacao: seg 31 jan 2022

"""
maxFatorComum(n1::Integer, n2::Integer)::Integer

Calcula o máximo fator em comum entre `n1` e `n2`.

# Arguments
- `n1::Integer`: inteiro com o primeiro fator.
- `n2::Integer`: inteiro com o segundo fator.

# Returns
- Zero ou o máximo fator em comum entre `n1` e `n2`.
"""
function maxFatorComum(n1::Integer, n2::Integer)::Integer
	i=2
	while (i<= n1 && i<=n2)
		if ((n1%i == 0) && (n2%i == 0))
			return i
		end
		i = i+1 
	end
	return 0
end # Fim da Funcao maxFatorComum

"""
parseArguments(commandARGS)

Filtra os argumentos passados pela linha de comando ao programa.

# Arguments
- `commandARGS::String`: linha de argumentos passados para a função.

# Returns
Retorna os cinco parametros `p`, `q`, `e`, limite inferior e limite superior.
"""
function parseArguments(commandARGS)
        if length(commandARGS) < 5
                println(stderr, "Uso:\n\t julia ",
                        PROGRAM_FILE, "<valor p> <valor q> <valor e> ",
                                      "<limite inferior busca> ",
				      "<limite superior busca>\n")
		exit(1)
        end
        return parse(UInt128, commandARGS[1]), parse(UInt128, commandARGS[2]), 
               parse(UInt128, commandARGS[3]), parse(UInt128, commandARGS[4]),
               parse(UInt128, commandARGS[5])

end #Fim da função parseArguments

"""
calculaD(e::UInt128, z::UInt128, li::UInt128, ls::UInt128)

Calcula os valores possiveis para `d` e `e`.

# Arguments
- `e::UInt128`: Valor de `e`.
- `z::UInt128`: Valor de `z`.
- `li::UInt128`: limite inferior.
- `ls::UInt128`: limite superior.

"""
function calculaD(e::UInt128, z::UInt128, li::UInt128, ls::UInt128)

  for i in li:ls
	if (i==1) 
		continue
	end

	if ( ((e*i - 1) % z) == 0 )
		println("\te = ", e, " d = ", i)
	end
  end
end #Fim da Funcao calculaD

#Inicio programa principal
"Obtém os Parametros"
p, q, e, li, ls = parseArguments(ARGS)

n = p * q
z = (p-1)*(q-1)

if (e >= n)
	println("O valor de e(", e, ") deve ser menor que n(", n,")!")
	return nothing
end

if (maxFatorComum(e, z) != 0)
	println(stderr, "Os valores e(", e, ") e z(", z, ") devem ser primos entre si!")
	return nothing
end

println("Valores:\n\tp = ", p, "; q = ", q, ";\n\tn = ", p, " x ", q, " = ", n);
println("\tz = (", p, "-1) x (", q, "-1) = ",z);

print("\nPossiveis valores para e e d entre (", li," e ", ls, "):\n");
calculaD(e, z, li, ls);
