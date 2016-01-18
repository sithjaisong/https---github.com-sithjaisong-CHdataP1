
# this part wioll just for the information in form2

crop.dev <- dataf2[3, 4]
names(crop.dev) <- "Crop.dev"

w.status <- dataf2[3, 11]
names(w.status) <- "Water.status"

crop.development <- visit1 %>% select(filename, visit, crop.dev)

water.status <- visit1 %>% select(filename, visit, w.status) 
