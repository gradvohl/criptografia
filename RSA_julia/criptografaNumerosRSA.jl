# Script em Julia para para aplicar a criptografia  RSA em cada valor de uma sequência de valores.
#
# Prof. Andre Leon S. Gradvohl, Dr.
# gradvohl@ft.unicamp.br
# Ultima atualizacao: seg 31 jan 2022

# Inclui o script para fazer o filtro dos argumentos da linha de comando.
include("parseArgsCriptografa.jl")

# Verifica se esta tudo certo com os parametros.
if ((Parametros = parseArguments(ARGS)) == nothing)
	return 
end

chave = parse(UInt128, Parametros["-c"])
n = parse(UInt128, Parametros["-n"])
criptaStrings = Parametros["-v"]

stringArray = split(criptaStrings," ")

print("Valores:  ")
for i in 1:length(stringArray)
	if (stringArray[i] != "")
		print(" ", parse(UInt128, stringArray[i]))
	end
end

print("\nRespostas: ")

for i in 1:length(stringArray)
	if (stringArray[i] != "")
		value = parse(BigInt, stringArray[i])
		print((value^chave)%n," ")
	end
end
println("")
