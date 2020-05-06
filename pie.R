slices = c(326766748, 66573504, 36953765, 24772247,  4749598 )
lbls  = c("USA", "UK", "Canada", "Australia", "New Zealand")
pct = round(slices/sum(slices)*100)
lbls = paste(lbls, pct) # add percents to labels 
lbls = paste(lbls,"%",sep="") # ad % to labels 
pie(slices,labels = lbls, col=rainbow(length(lbls)),
  	 main="Pie Chart")
