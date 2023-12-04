import os

os.system('clear')

def converter_dolar_para_reais(cotacao_dolar, quantidade_dolar):
    valor_em_reais = cotacao_dolar * quantidade_dolar
    return valor_em_reais

def main():
    try:
        cotacao_dolar = float(input("Digite a cotação do dólar: "))
        quantidade_dolar = float(input("Digite a quantidade de dólares: "))

        valor_em_reais = converter_dolar_para_reais(cotacao_dolar, quantidade_dolar)

        print(f"O valor em reais é: R${valor_em_reais:.2f}")

    except ValueError:
        print("Por favor, insira valores numéricos válidos.")

if __name__ == "__main__":
    main()
