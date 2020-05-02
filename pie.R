slices = c(226710,56990,19700,15316,18581) 
lbls  = c("USA", "UK", "Canada", "Australia", "Other")
pct = round(slices/sum(slices)*100)
lbls = paste(lbls, pct) # add percents to labels 
lbls = paste(lbls,"%",sep="") # ad % to labels 
pie(slices,labels = lbls, col=rainbow(length(lbls)),
  	 main="Pie Chart of Countries")