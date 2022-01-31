"""
parseArguments(commandARGS)

Função para filtrar os argumentos da linha de comando

# Arguments
- `commandARGS`: String com os argumentos na linha de comando

# Returns
- Um dicionario onde o índice é a string com a chave.

"""
function parseArguments(commandARGS)
	if length(commandARGS) < 6
		println(stderr, "Uso:\n\t julia ", 
 			PROGRAM_FILE, " -v \"sequencia de valores entre aspas\" ",
	                "-c <chave> -n <valor de n>")
		exit(1)
	end

	Parametros = Dict{String,String}("-c"=>"", "-n"=>"", "-v"=>"")

	for i in 1:length(commandARGS)
	    if (i%2 == 1)
		if (commandARGS[i] == "-c")
			global chave = "-c"
		elseif (commandARGS[i] == "-n")
			global chave = "-n"	    
		elseif (commandARGS[i] == "-v")
			global chave = "-v"
		end
	    else
		Parametros[chave]=commandARGS[i]
	    end
	end
	return Parametros
end #Fim da função parseArguments
