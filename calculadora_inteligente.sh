
#!/bin/bash

   echo "Digite seu nome:"
   read nome
   echo "Bem-vindo, $nome!"

   while true; do
       echo "Deseja iniciar o programa? (S/n)"
       read iniciar

       if [[ "$iniciar" == "S" || "$iniciar" == "s" ]]; then
           echo "Digite o primeiro numero:"
           read num1
           echo "Digite o segundo numero:"
           read num2

           echo "Escolha a operaçao (+ - * /):"
           read operacao

           case $operacao in
               +)
                   resultado=$(echo "$num1 + $num2" | bc)
                   echo "Resultado: $resultado"
                   ;;
               -)
                   resultado=$(echo "$num1 - $num2" | bc)
                   echo "Resultado: $resultado"
                   ;;
               \*)
                   resultado=$(echo "$num1 * $num2" | bc)
                   echo "Resultado: $resultado"
                   ;;
               /)
                   if [ "$num2" != "0" ]; then
                       resultado=$(echo "scale=2; $num1 / $num2" | bc)
                       echo "Resultado: $resultado"
                   else
                       echo "Erro: Divisao por zero nao e permitida."
                   fi
                   ;;
               *)
                   echo "Operaçao invalida."
                   ;;
           esac
       elif [[ "$iniciar" == "N" || "$iniciar" == "n" ]]; then
           echo "Programa encerrado."
           break
       else
           echo "Opçao invalida. Por favor, digite S ou N."
       fi

       echo "Deseja continuar? (S/n)"
       read continuar
       if [[ "$continuar" == "N" || "$continuar" == "n" ]]; then
           echo "Programa encerrado."
           break
       fi
   done

