dat = read.csv("dataene_abr.csv", header = TRUE , quote="\"")

edad = aggregate(especialidad ~ edad + estado, data=dat, FUN=length)

nrow(dat[dat$estado == 'ASISTIO',])
nrow(dat[dat$estado == 'FALTO',])





library(ggplot2)
ggplot(data=edad, aes(x=edad, y=especialidad, group=estado, shape=estado, color=estado)) +    
  geom_line() + geom_point() +  xlab("AÑOS")+ ylab("CITAS") + 
  stat_smooth(method = "lm")

asistencias  = edad[edad$estado == 'ASISTIO',]
faltas = edad[edad$estado == 'FALTO',]
especialidad = aggregate(edad ~ especialidad + estado, data=dat, FUN=length)
especialidad = especialidad[order(especialidad$edad , decreasing=TRUE),]
especialidad$especialidad = factor(especialidad$especialidad)                      
str(especialidad)

ggplot(especialidad, aes(x=especialidad, y=edad, fill=estado)) + 
  geom_bar(position=position_dodge()) + coord_flip()+ xlab("ESPECIALIDAD")+
  ylab("CANTIDAD") 


especialidad[especialidad$estado == "ASISTIO", 1]