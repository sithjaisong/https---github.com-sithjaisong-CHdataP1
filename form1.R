# this the dunction to extract the data from excel

form1 <- function(dataf1){
      
  
        field.no <- dataf1[3,3]
        names(field.no) <- 'Field.No'
        
        #==
        village.name <- dataf1[4, 10]
        names(village.name) <- 'Village.Name'
        
        #===
        field.area <- dataf1[13, 7] 
        names(field.area) <- 'Field.Area'
        
        #===
        farmer.name <- dataf1[13, 14]
        names(farmer.name) <- 'Farmer.Name'
        
        # ==========LANDFORM==========
        
        land.form <- "Irrigated"
        names(land.form) <- 'Land.Form'
        
        #===
        prev.crop <- dataf1[19, 4]
        names(prev.crop) <- 'Previous.Crop'
        
        #===
        fallow.prd <- dataf1[19, 23]
        names(fallow.prd) <- 'Fallow.Period'
        
        #===
        soil.prob <- ifelse(is.character(dataf1[22, 8]) == FALSE, "Salt",
                            ifelse(is.na(dataf1[22, 11]) == FALSE, "Zine",
                                   ifelse(is.na(dataf1[22, 17]) == FALSE, "Aluminum",
                                          "None")))
        names(soil.prob) <- 'Soil.Problem'
        
        # ==========CROP ESTABLISHMENT==========
        
        #===
        crop.est.method <- ifelse(is.character(dataf1[26, 7]) == TRUE, "Transplanted", "Direct_seeded")
        names(crop.est.method) <- 'Planting.Method'
        
        #===
        seed.age <- dataf1[26, 21]
        names(seed.age) <- 'Seedling.Age'
        
        #===
        crop.est.date <- dataf1[31, 12]
        names(crop.est.date) <- 'Planting.Date' 
        
        #===
        crop.harv.date <- dataf1[31, 24]
        names(crop.harv.date) <- 'Harvest.Date' 
        
        #===
        rice.var <- dataf1[33, 5] 
        names(rice.var) <- 'Rice.Variety'
        
        #===
        var.type <- ifelse(is.character(dataf1[33, 13]) == FALSE, "Traditional",
                           ifelse(is.na(dataf1[33, 20]) == FALSE, "Mordern",
                                  ifelse(is.na(dataf1[33, 26]) == FALSE, "Hybrid",
                                         "NA")))
        names(var.type) <- 'Variety.Type'
        
        # ==========FERTILISER==========
        
        Ntotal <- dataf1[51, 11]
        
        names(Ntotal) <- "N_total"
        
        Ptotal <- dataf1[52, 11]
        names(Ptotal) <- "P_total"
        
        Ktotal <- dataf1[53, 11]
        names(Ktotal) <- "K_total"
        
        # ==========CROP STATUS==========
        
        yld.area1 <- dataf1[90, 14]
        
        names(yld.area1) <- 'Yield.Area1'
        
        yld.area2 <- dataf1[90, 18]
        
        names(yld.area2) <- 'Yield.Area2'
        
        yld.area3 <- dataf1[90, 22]
        names(yld.area3) <- 'Yield.Area3'
        
        #====
        
        form1data <- cbind(field.no, 
                           field.area,
                           farmer.name,
                           land.form,
                           prev.crop,
                           fallow.prd,
                           soil.prob,
                           crop.est.method,
                           seed.age,
                           rice.var,
                           var.type,
                           Ntotal,
                           Ptotal,
                           Ktotal,
                           yld.area1,
                           yld.area2,
                           yld.area3)
        
        return(form1data)
        
}
# ==========EOS==========