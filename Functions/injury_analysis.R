
# Load function
source("~/Documents/Github/surveySKEP1/Functions/function.audpc.R")

# write the function
injury_analysis <- function(dataF2){
  dataF2[is.na(dataF2)] <- 0 
  dataF2 %>% transform(
  filename = as.character(filename),
  visit = as.numeric(visit),
  Q = as.numeric(Q),
  DVS = as.numeric(DVS),
  Nt = as.numeric(Nt),
  Np = as.numeric(Np),
  Nl = as.numeric(Nl),
  SNL = as.numeric(SNL),
  DH = as.numeric(DH),
  WH = as.numeric(WH),
  GM = as.numeric(GM),
  RT = as.numeric(RT),
  WM = as.numeric(WM),
  LF = as.numeric(LF),
  def = as.numeric(def),
  BPH = as.numeric(BPH),
  WPH = as.numeric(WPH),
  AW = as.numeric(AW),
  RB = as.numeric(RB),
  BLB = as.numeric(BLB),
  LB = as.numeric(LB),
  BS = as.numeric(BS),
  BLS = as.numeric(BLS),
  NBS = as.numeric(NBS),
  RS = as.numeric(RS),
  LS = as.numeric(LS),
  SHB = as.numeric(SHB),
  SHR = as.numeric(SHR),
  SR = as.numeric(SR),
  FS = as.numeric(FS),
  NB = as.numeric(NB),
  DP = as.numeric(DP)
)  %>%
  mutate(Nlh = Nl * Nt, 
         # Number of leave = number of tiller * number of leave per tiller
         # tiller injuries
         SNL.percent = (SNL/Nt*100), # Percent of SNL damage on hill is number
         DH.percent = (DH/Nt)*100, # Percent of Dead Heart in on hill is number tiller damaged by dead heart divide by number of tiller *100
         RT.percent = RT/Nt*100, # Percent of Rat damage in one hill
         GM.percent =GM/Nt*100, # Percent of GM or silver shoot
         RB.percent = RB/Nt*100, # Percent of Rice Bug injuries in one hill
         WH.percent = WH/Nt*100, # Percent of Whitehead in one hill
         DP.percent = DP/Nt*100, # Percent of Dirty Panicle in one hill
         FS.percent = FS/Nt*100, # Percent of False smut in one hill
         NB.percent = NB/Nt*100, # Percent of Neck Blast in one hill
         SHB.percent = SHB/Nt*100, # Percent of Shealth Blight injuries in one hill
         SHR.percent = SHR/Nt*100, # Percent of Shealth Rot in one hill
         SR.percent = SR/Nt*100, # Percent of Stem rot on one hill
         # leave injuries
         LF.percent = LF/Nlh*100, # Percent of Leaffolder in one hill
         WM.percent = WM/Nlh*100, # Percent of Whorl maggot injuries in one hill
         BLB.percent = BLB/Nlh*100, # Percent of Bacterial leaf Blight in one hill
         BLS.percent = BLS/Nlh*100, # Percent of Bacterial leaf streak in one hill
         BS.percent = BS/Nlh*100, # Percent of Brown Spot in one hill
         LB.percent = LB/Nlh*100, # Percent of leaf Blight in one hill
         LS.percent = LS/Nlh*100, # Percent of leaf scald in one hill
         NBS.percent = NBS/Nlh*100, # Percent of Narrow brown spot in one hill
         RS.percent = RS/Nlh*100 # Percent of Red stripe in one hill
  ) %>%
  group_by(filename, visit, DVS) %>%
  
  summarise(#m.RT = mean(RT.percent), # Percent of Rat damage in one hill
    #    m.SNL = mean(SNL.percent), # Percent of Snail damage in one hill
    m.SNL = mean(SNL.percent),
    m.DH = mean(DH.percent),
    m.RT = mean(RT.percent),
    m.GM = mean(GM.percent),
    m.RB = mean(RB.percent), # Percent of Rice Bug injuries in one hill
    m.WH = mean(WH.percent), # Percent of Whitehead in one hill
    m.DP = mean(DP.percent), # Percent of Dirty Panicle in one hill
    m.FS = mean(FS.percent), # Percent of False smut in one hill
    m.NB = mean(NB.percent), # Percent of Neck Blast in one hill
    m.SHB = mean(SHB.percent), # Percent of Shealth Blight injuries in one hill
    m.SHR = mean(SHR.percent), # Percent of Shealth Rot in one hill
    m.SR = mean(SR.percent),
    
    #===insect count
    BPH.total = sum(BPH),
    WPH.total = sum(WPH),
    AW.total = sum(AW),
    RB.total = sum(RB),
    
    m.LF = mean(LF.percent), # mean within DVS which is following the designed group
    m.WM = mean(WM.percent),
    m.BLB = mean(BLB.percent),
    m.BLS = mean(BLS.percent),
    m.BS = mean(BS.percent),
    m.LB = mean(LB.percent),
    m.LS = mean(LS.percent),
    m.NBS = mean(NBS.percent),
    m.RS = mean(RS.percent)
  ) %>%
  group_by(filename) %>% summarise(
  SNL.max = max(m.SNL),
  DH.max = max(m.DH),
  RT.max = max(m.RT),
  GM.max = max(m.GM),
  RB.max = max(m.RB),
  WH.max = max(m.WH),
  DP.max = max(m.DP),
  FS.max = max(m.FS),
  NB.max = max(m.NB),
  SHB.max = max(m.SHB),
  SHR.max = max(m.SHR),
  SR.max = max(m.SR),
  
  #===insect count
  BPH.max = max(BPH.total),
  WPH.max = max(WPH.total),
  AW.max = max(AW.total),
  RB.max = max(RB.total),
  
  LF.audpc = audpc(m.LF, DVS),
  WM.audpc = audpc(m.WM, DVS),
  BLB.audpc = audpc(m.BLB, DVS),
  BLS.audpc = audpc(m.BLS, DVS),
  BS.audpc = audpc(m.BS, DVS),
  LB.audpc = audpc(m.LB, DVS),
  LS.audpc = audpc(m.LS, DVS),
  NBS.audpc = audpc(m.NBS, DVS),
  RS.audpc = audpc(m.RS, DVS)
)
}



