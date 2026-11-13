#Luis Jose Sainda M&A

# Exercicio limpeza de dados sujos
# Importacao de Daos

dados <- read.csv("C:/Users/Medicina I/Downloads/dados_sujos_limpeza.csv")
View(dados)

#Idetificar valores ausentes
is.na(dados)
colSums(is.na(dados))

#Eliminar dados duplicados
sum(duplicated(dados))
dados <- dados[!duplicated(dados), ]
sum(duplicated(dados))

# Corrigir espacos
dados$nome_cliente <- trimws(dados$nome_cliente)
dados$cidade <- trimws(dados$cidade)
dados$produto <- trimws(dados$produto)
dados$nome_cliente <- tools::toTitleCase(tolower(dados$nome_cliente))
dados$cidade <- tools::toTitleCase(tolower(dados$cidade))
dados$produto <- tools::toTitleCase(tolower(dados$produto))

#Identificar outliers

summary(dados$idade)
boxplot(dados$idade)

# Corrigir tipos de dados

str(dados)

# Validar emails

dados$email <- trimws(dados$email)
validar_email <- grepl("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",dados$email)

dados$email[!validar_email & !is.na(dados$email)]

# Guardar os dados limpados

write.csv(
  dados,
  file = "C:/Users/Medicina I/Downloads/dados_limpos.csv",
  row.names = FALSE,
  na = "",
  fileEncoding = "UTF-8"
)
file.exists("C:/Users/Medicina I/Downloads/dados_limpos.csv")
