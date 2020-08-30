df_2 = read.csv("datos_proyect.csv")
df_1 = read.csv("df_lim.csv")
df <- df_1[c(2:3,5:8)]

table(df$Recommended_IND)
table(df$Rating)

#Con datos productos
#Queremos ver las clases de prouctos más representativas
#z <- table(df$Class_Name) # Tomamos en cuenta 8 clases
#barplot(z)
#Solo tomamos del df esas 8 valores del la clase para que haya menos varianza
#nom <- names(z[z > 600])
#sum(z[z > 600])
#df <- df[df$Class_Name %in% nom,]

#length(df)
#Distribucion de edad del cliente 
#barplot(table(df$Age))

#Las personas que interactuan con los comentarios de otras personas
barplot(table(df$Positive_Feedback_Count), xlab = "Cantidad de positivos",
                                           ylab = "Cantidad de comentarios",
                                           main = "Cantidad de comentarios por sus \"Me gusta\"",
                                           col = "red")

median(df$Age)
quantile(df$Age)
#Nos intereasan los que tuvieron más likes (más de 20)
df <- df[df$Positive_Feedback_Count >= 1,]

sum(df$Positive_Feedback_Count)

#plot(df$Rating, df$Recommended_IND, type = "p")
#plot(table(df$Rating, df$Recommended_IND))

write.csv(df, "Datos_nu_1.csv")

df$Recommended_IND <- as.character(df$Recommended_IND)
table(df$Recommended_IND)
table(df$Rating)

library(ggplot2)
ggplot(df, aes(df$Rating, df$Positive_Feedback_Count,color=df$Recommended_IND)) +
geom_point() +
  ggtitle("Número de recomendaciones por calificación y cantidad de \"me gusta\"") +
  labs(x ="Calificación al producto", y = "Número de \"Me gusta\"", color = "Recomendación") + scale_color_manual(values=c("red", "blue"))

ggplot(df, aes( df$Rating,df$Positive_Feedback_Count ,  fill = df$Recommended_IND)) +
  geom_bar(stat="identity", position=position_dodge())

ggplot(df, aes( df$Rating, sum(df$Recommended_IND) ,  fill = df$Recommended_IND)) +
  geom_bar(stat="identity", position=position_dodge())


df[df$Recommended_IND == "0" & df$Rating == 5, c("Recommended_IND", "Rating")]
dim(df[df$Recommended_IND == "0" & df$Rating == 1, c("Recommended_IND", "Rating")])


table(df$Recommended_IND)[3]

barplot(table( df$Recommended_IND,df$Rating))

table(df_2$Rating, df_2$Recommended_IND)

table(df$Positive_Feedback_Count, df$Rating)


#
ggplot(df, aes(df$Age, df$Positive_Feedback_Count)) + geom_point()
