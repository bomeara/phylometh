MyTree
$Carneyella_pilea
[1] "0" "0" "0" "1" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0"
[21] "0" "0" "?"

$Foerstediscus_grandis
[1] "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0"
[21] "0" "0" "?"

$Isorophus_cincinnatiensis
[1] "0" "1" "0" "1" "1" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0"
[21] "0" "0" "?"

$Isorophusella_spp.
[1] "0" "1" "1" "1" "1" "0" "0" "0" "0" "0" "0" "0" "0" "0" "0" "1" "?" "?" "?" "0"
[21] "0" "0" "?"

$Neoisorophysella_lanei
[1] "0" "?" "1" "0" "1" "1" "0" "?" "0" "0" "0" "0" "0" "0" "0" "1" "?" "?" "?" "0"
[21] "0" "0" "?"

$Agelacrinites_hamiltonensis
[1] "1" "?" "0" "0" "1" "0" "0" "0" "0" "1" "0" "0" "1" "0" "0" "0" "0" "0" "0" "0"
[21] "0" "0" "?"

$Stalticodiscus_milleri
[1] "1" "?" "0" "0" "1" "1" "1" "1" "0" "0" "0" "0" "1" "1" "0" "0" "1" "0" "0" "0"
[21] "0" "0" "?"

$Postibulla_legrandensis
[1] "1" "?" "0" "0" "1" "0" "1" "0" "0" "0" "0" "0" "1" "0" "0" "0" "0" "0" "0" "0"
[21] "0" "0" "?"

$Ulrichidiscus_pulaskiensis
[1] "1" "?" "0" "0" "1" "1" "1" "1" "0" "1" "1" "0" "1" "1" "0" "0" "1" "0" "0" "0"
[21] "1" "0" "0"

$Lepidodiscus_squamosus
[1] "1" "?" "0" "0" "1" "1" "1" "1" "0" "0" "0" "0" "0" "1" "0" "0" "0" "0" "0" "0"
[21] "0" "0" "?"

$Lepidodiscus_laudoni
[1] "1" "?" "0" "0" "1" "1" "1" "1" "1" "1" "1" "0" "1" "1" "0" "0" "1" "0" "1" "1"
[21] "1" "1" "1"

$Chester_Lepidodiscus_laudoni
[1] "1" "?" "0" "0" "1" "1" "1" "1" "1" "1" "2" "1" "1" "1" "1" "0" "1" "1" "1" "1"
[21] "1" "1" "1"

$Discocystis_kaskaskiensis
[1] "1" "?" "0" "0" "1" "1" "1" "1" "1" "1" "2" "1" "1" "1" "1" "0" "1" "1" "1" "1"
[21] "1" "1" "1"

$Cooperidiscus
[1] "?" "?" "1" "?" "?" "?" "?" "?" "?" "1" "1" "?" "1" "?" "0" "0" "1" "0" "0" "1"
[21] "?" "?" "?"

$Lispidecodus
[1] "1" "?" "0" "?" "1" "1" "1" "1" "1" "0" "2" "?" "1" "1" "1" "?" "?" "?" "?" "?"
[21] "1" "0" "1"

> do.call(MyTree, rbind)
Error in do.call(MyTree, rbind) : second argument must be a list
> do.call(rbind, MyTree)
[,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
Carneyella_pilea             "0"  "0"  "0"  "1"  "0"  "0"  "0"  "0"  "0"  "0"  
Foerstediscus_grandis        "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"  
Isorophus_cincinnatiensis    "0"  "1"  "0"  "1"  "1"  "0"  "0"  "0"  "0"  "0"  
Isorophusella_spp.           "0"  "1"  "1"  "1"  "1"  "0"  "0"  "0"  "0"  "0"  
Neoisorophysella_lanei       "0"  "?"  "1"  "0"  "1"  "1"  "0"  "?"  "0"  "0"  
Agelacrinites_hamiltonensis  "1"  "?"  "0"  "0"  "1"  "0"  "0"  "0"  "0"  "1"  
Stalticodiscus_milleri       "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "0"  
Postibulla_legrandensis      "1"  "?"  "0"  "0"  "1"  "0"  "1"  "0"  "0"  "0"  
Ulrichidiscus_pulaskiensis   "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "1"  
Lepidodiscus_squamosus       "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "0"  
Lepidodiscus_laudoni         "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"  
Chester_Lepidodiscus_laudoni "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"  
Discocystis_kaskaskiensis    "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"  
Cooperidiscus                "?"  "?"  "1"  "?"  "?"  "?"  "?"  "?"  "?"  "1"  
Lispidecodus                 "1"  "?"  "0"  "?"  "1"  "1"  "1"  "1"  "1"  "0"  
[,11] [,12] [,13] [,14] [,15] [,16] [,17] [,18] [,19]
Carneyella_pilea             "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
Foerstediscus_grandis        "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
Isorophus_cincinnatiensis    "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
Isorophusella_spp.           "0"   "0"   "0"   "0"   "0"   "1"   "?"   "?"   "?"  
Neoisorophysella_lanei       "0"   "0"   "0"   "0"   "0"   "1"   "?"   "?"   "?"  
Agelacrinites_hamiltonensis  "0"   "0"   "1"   "0"   "0"   "0"   "0"   "0"   "0"  
Stalticodiscus_milleri       "0"   "0"   "1"   "1"   "0"   "0"   "1"   "0"   "0"  
Postibulla_legrandensis      "0"   "0"   "1"   "0"   "0"   "0"   "0"   "0"   "0"  
Ulrichidiscus_pulaskiensis   "1"   "0"   "1"   "1"   "0"   "0"   "1"   "0"   "0"  
Lepidodiscus_squamosus       "0"   "0"   "0"   "1"   "0"   "0"   "0"   "0"   "0"  
Lepidodiscus_laudoni         "1"   "0"   "1"   "1"   "0"   "0"   "1"   "0"   "1"  
Chester_Lepidodiscus_laudoni "2"   "1"   "1"   "1"   "1"   "0"   "1"   "1"   "1"  
Discocystis_kaskaskiensis    "2"   "1"   "1"   "1"   "1"   "0"   "1"   "1"   "1"  
Cooperidiscus                "1"   "?"   "1"   "?"   "0"   "0"   "1"   "0"   "0"  
Lispidecodus                 "2"   "?"   "1"   "1"   "1"   "?"   "?"   "?"   "?"  
[,20] [,21] [,22] [,23]
Carneyella_pilea             "0"   "0"   "0"   "?"  
Foerstediscus_grandis        "0"   "0"   "0"   "?"  
Isorophus_cincinnatiensis    "0"   "0"   "0"   "?"  
Isorophusella_spp.           "0"   "0"   "0"   "?"  
Neoisorophysella_lanei       "0"   "0"   "0"   "?"  
Agelacrinites_hamiltonensis  "0"   "0"   "0"   "?"  
Stalticodiscus_milleri       "0"   "0"   "0"   "?"  
Postibulla_legrandensis      "0"   "0"   "0"   "?"  
Ulrichidiscus_pulaskiensis   "0"   "1"   "0"   "0"  
Lepidodiscus_squamosus       "0"   "0"   "0"   "?"  
Lepidodiscus_laudoni         "1"   "1"   "1"   "1"  
Chester_Lepidodiscus_laudoni "1"   "1"   "1"   "1"  
Discocystis_kaskaskiensis    "1"   "1"   "1"   "1"  
Cooperidiscus                "1"   "?"   "?"   "?"  
Lispidecodus                 "?"   "1"   "0"   "1"  
> MyData<-do.call(rbind, read.nexus.data("Maggie_nexus"))
> MyData
[,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
Carneyella_pilea             "0"  "0"  "0"  "1"  "0"  "0"  "0"  "0"  "0"  "0"  
Foerstediscus_grandis        "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"  
Isorophus_cincinnatiensis    "0"  "1"  "0"  "1"  "1"  "0"  "0"  "0"  "0"  "0"  
Isorophusella_spp.           "0"  "1"  "1"  "1"  "1"  "0"  "0"  "0"  "0"  "0"  
Neoisorophysella_lanei       "0"  "?"  "1"  "0"  "1"  "1"  "0"  "?"  "0"  "0"  
Agelacrinites_hamiltonensis  "1"  "?"  "0"  "0"  "1"  "0"  "0"  "0"  "0"  "1"  
Stalticodiscus_milleri       "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "0"  
Postibulla_legrandensis      "1"  "?"  "0"  "0"  "1"  "0"  "1"  "0"  "0"  "0"  
Ulrichidiscus_pulaskiensis   "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "1"  
Lepidodiscus_squamosus       "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "0"  
Lepidodiscus_laudoni         "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"  
Chester_Lepidodiscus_laudoni "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"  
Discocystis_kaskaskiensis    "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"  
Cooperidiscus                "?"  "?"  "1"  "?"  "?"  "?"  "?"  "?"  "?"  "1"  
Lispidecodus                 "1"  "?"  "0"  "?"  "1"  "1"  "1"  "1"  "1"  "0"  
[,11] [,12] [,13] [,14] [,15] [,16] [,17] [,18] [,19]
Carneyella_pilea             "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
Foerstediscus_grandis        "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
Isorophus_cincinnatiensis    "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
Isorophusella_spp.           "0"   "0"   "0"   "0"   "0"   "1"   "?"   "?"   "?"  
Neoisorophysella_lanei       "0"   "0"   "0"   "0"   "0"   "1"   "?"   "?"   "?"  
Agelacrinites_hamiltonensis  "0"   "0"   "1"   "0"   "0"   "0"   "0"   "0"   "0"  
Stalticodiscus_milleri       "0"   "0"   "1"   "1"   "0"   "0"   "1"   "0"   "0"  
Postibulla_legrandensis      "0"   "0"   "1"   "0"   "0"   "0"   "0"   "0"   "0"  
Ulrichidiscus_pulaskiensis   "1"   "0"   "1"   "1"   "0"   "0"   "1"   "0"   "0"  
Lepidodiscus_squamosus       "0"   "0"   "0"   "1"   "0"   "0"   "0"   "0"   "0"  
Lepidodiscus_laudoni         "1"   "0"   "1"   "1"   "0"   "0"   "1"   "0"   "1"  
Chester_Lepidodiscus_laudoni "2"   "1"   "1"   "1"   "1"   "0"   "1"   "1"   "1"  
Discocystis_kaskaskiensis    "2"   "1"   "1"   "1"   "1"   "0"   "1"   "1"   "1"  
Cooperidiscus                "1"   "?"   "1"   "?"   "0"   "0"   "1"   "0"   "0"  
Lispidecodus                 "2"   "?"   "1"   "1"   "1"   "?"   "?"   "?"   "?"  
[,20] [,21] [,22] [,23]
Carneyella_pilea             "0"   "0"   "0"   "?"  
Foerstediscus_grandis        "0"   "0"   "0"   "?"  
Isorophus_cincinnatiensis    "0"   "0"   "0"   "?"  
Isorophusella_spp.           "0"   "0"   "0"   "?"  
Neoisorophysella_lanei       "0"   "0"   "0"   "?"  
Agelacrinites_hamiltonensis  "0"   "0"   "0"   "?"  
Stalticodiscus_milleri       "0"   "0"   "0"   "?"  
Postibulla_legrandensis      "0"   "0"   "0"   "?"  
Ulrichidiscus_pulaskiensis   "0"   "1"   "0"   "0"  
Lepidodiscus_squamosus       "0"   "0"   "0"   "?"  
Lepidodiscus_laudoni         "1"   "1"   "1"   "1"  
Chester_Lepidodiscus_laudoni "1"   "1"   "1"   "1"  
Discocystis_kaskaskiensis    "1"   "1"   "1"   "1"  
Cooperidiscus                "1"   "?"   "?"   "?"  
Lispidecodus                 "?"   "1"   "0"   "1"  
> ?phangorn
No documentation for ‘phangorn’ in specified packages and libraries:
  you could try ‘??phangorn’
> library(phangorn)
Warning message:
  package ‘phangorn’ was built under R version 3.3.2 
> ?phangorn
> browseVignettes("phangorn")
> dm<-dist.ml(MyData)
Error in dist.ml(MyData) : x has to be element of class phyDat
> edrio<-read.phyDat("MyData",format=phylip+ type="Nexus")
Error: unexpected '=' in "edrio<-read.phyDat("MyData",format=phylip+ type="
> ?read.phyDat
> phyDatdata<-as.phyDat("MyData")
> phyDatdata
1 sequences with 0 character and 0 different site patterns.
The states are a c g t 
> phyDatdata<-phyDat("MyData"=USER)
Error in phyDat(MyData = USER) : 
  argument "data" is missing, with no default
> phyDatdata<-phyDat(MyData)
> phyDatdata
15 sequences with 0 character and 0 different site patterns.
The states are a c g t 
> phyDatdata<-phyDat(MyData,type="USER")
Error in phyDat.default(data, levels = levels, return.index = return.index,  : 
                          Either argument levels or contrast has to be supplied
                        > MyData
                        [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
                        Carneyella_pilea             "0"  "0"  "0"  "1"  "0"  "0"  "0"  "0"  "0"  "0"   "0"   "0"  
                        Foerstediscus_grandis        "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"   "0"   "0"  
                        Isorophus_cincinnatiensis    "0"  "1"  "0"  "1"  "1"  "0"  "0"  "0"  "0"  "0"   "0"   "0"  
                        Isorophusella_spp.           "0"  "1"  "1"  "1"  "1"  "0"  "0"  "0"  "0"  "0"   "0"   "0"  
                        Neoisorophysella_lanei       "0"  "?"  "1"  "0"  "1"  "1"  "0"  "?"  "0"  "0"   "0"   "0"  
                        Agelacrinites_hamiltonensis  "1"  "?"  "0"  "0"  "1"  "0"  "0"  "0"  "0"  "1"   "0"   "0"  
                        Stalticodiscus_milleri       "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "0"   "0"   "0"  
                        Postibulla_legrandensis      "1"  "?"  "0"  "0"  "1"  "0"  "1"  "0"  "0"  "0"   "0"   "0"  
                        Ulrichidiscus_pulaskiensis   "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "1"   "1"   "0"  
                        Lepidodiscus_squamosus       "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "0"   "0"   "0"  
                        Lepidodiscus_laudoni         "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"   "1"   "0"  
                        Chester_Lepidodiscus_laudoni "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"   "2"   "1"  
                        Discocystis_kaskaskiensis    "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"   "2"   "1"  
                        Cooperidiscus                "?"  "?"  "1"  "?"  "?"  "?"  "?"  "?"  "?"  "1"   "1"   "?"  
                        Lispidecodus                 "1"  "?"  "0"  "?"  "1"  "1"  "1"  "1"  "1"  "0"   "2"   "?"  
                        [,13] [,14] [,15] [,16] [,17] [,18] [,19] [,20] [,21] [,22]
                        Carneyella_pilea             "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Foerstediscus_grandis        "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Isorophus_cincinnatiensis    "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Isorophusella_spp.           "0"   "0"   "0"   "1"   "?"   "?"   "?"   "0"   "0"   "0"  
                        Neoisorophysella_lanei       "0"   "0"   "0"   "1"   "?"   "?"   "?"   "0"   "0"   "0"  
                        Agelacrinites_hamiltonensis  "1"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Stalticodiscus_milleri       "1"   "1"   "0"   "0"   "1"   "0"   "0"   "0"   "0"   "0"  
                        Postibulla_legrandensis      "1"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Ulrichidiscus_pulaskiensis   "1"   "1"   "0"   "0"   "1"   "0"   "0"   "0"   "1"   "0"  
                        Lepidodiscus_squamosus       "0"   "1"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Lepidodiscus_laudoni         "1"   "1"   "0"   "0"   "1"   "0"   "1"   "1"   "1"   "1"  
                        Chester_Lepidodiscus_laudoni "1"   "1"   "1"   "0"   "1"   "1"   "1"   "1"   "1"   "1"  
                        Discocystis_kaskaskiensis    "1"   "1"   "1"   "0"   "1"   "1"   "1"   "1"   "1"   "1"  
                        Cooperidiscus                "1"   "?"   "0"   "0"   "1"   "0"   "0"   "1"   "?"   "?"  
                        Lispidecodus                 "1"   "1"   "1"   "?"   "?"   "?"   "?"   "?"   "1"   "0"  
                        [,23]
                        Carneyella_pilea             "?"  
                        Foerstediscus_grandis        "?"  
                        Isorophus_cincinnatiensis    "?"  
                        Isorophusella_spp.           "?"  
                        Neoisorophysella_lanei       "?"  
                        Agelacrinites_hamiltonensis  "?"  
                        Stalticodiscus_milleri       "?"  
                        Postibulla_legrandensis      "?"  
                        Ulrichidiscus_pulaskiensis   "0"  
                        Lepidodiscus_squamosus       "?"  
                        Lepidodiscus_laudoni         "1"  
                        Chester_Lepidodiscus_laudoni "1"  
                        Discocystis_kaskaskiensis    "1"  
                        Cooperidiscus                "?"  
                        Lispidecodus                 "1"  
                        > as.DNAbin(MyData)
                        15 DNA sequences in binary format stored in a matrix.
                        
                        All sequences of same length: 23 
                        
                        Labels: Carneyella_pilea Foerstediscus_grandis Isorophus_cincinnatiensis Isorophusella_spp. Neoisorophysella_lanei Agelacrinites_hamiltonensis ...
                        
                        Base composition:
                          a   c   g   t 
                        NaN NaN NaN NaN 
                        > phyDatdata <- phyDat(MyData, type="USER", levels=c("0", "1", "2"))
                        > phyDatdata
                        15 sequences with 23 character and 23 different site patterns.
                        The states are 0 1 2 
                        > as.character(phyDatdata)
                        [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
                        Carneyella_pilea             "0"  "0"  "0"  "1"  "0"  "0"  "0"  "0"  "0"  "0"   "0"   "0"  
                        Foerstediscus_grandis        "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"  "0"   "0"   "0"  
                        Isorophus_cincinnatiensis    "0"  "1"  "0"  "1"  "1"  "0"  "0"  "0"  "0"  "0"   "0"   "0"  
                        Isorophusella_spp.           "0"  "1"  "1"  "1"  "1"  "0"  "0"  "0"  "0"  "0"   "0"   "0"  
                        Neoisorophysella_lanei       "0"  "?"  "1"  "0"  "1"  "1"  "0"  "?"  "0"  "0"   "0"   "0"  
                        Agelacrinites_hamiltonensis  "1"  "?"  "0"  "0"  "1"  "0"  "0"  "0"  "0"  "1"   "0"   "0"  
                        Stalticodiscus_milleri       "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "0"   "0"   "0"  
                        Postibulla_legrandensis      "1"  "?"  "0"  "0"  "1"  "0"  "1"  "0"  "0"  "0"   "0"   "0"  
                        Ulrichidiscus_pulaskiensis   "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "1"   "1"   "0"  
                        Lepidodiscus_squamosus       "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "0"  "0"   "0"   "0"  
                        Lepidodiscus_laudoni         "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"   "1"   "0"  
                        Chester_Lepidodiscus_laudoni "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"   "2"   "1"  
                        Discocystis_kaskaskiensis    "1"  "?"  "0"  "0"  "1"  "1"  "1"  "1"  "1"  "1"   "2"   "1"  
                        Cooperidiscus                "?"  "?"  "1"  "?"  "?"  "?"  "?"  "?"  "?"  "1"   "1"   "?"  
                        Lispidecodus                 "1"  "?"  "0"  "?"  "1"  "1"  "1"  "1"  "1"  "0"   "2"   "?"  
                        [,13] [,14] [,15] [,16] [,17] [,18] [,19] [,20] [,21] [,22]
                        Carneyella_pilea             "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Foerstediscus_grandis        "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Isorophus_cincinnatiensis    "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Isorophusella_spp.           "0"   "0"   "0"   "1"   "?"   "?"   "?"   "0"   "0"   "0"  
                        Neoisorophysella_lanei       "0"   "0"   "0"   "1"   "?"   "?"   "?"   "0"   "0"   "0"  
                        Agelacrinites_hamiltonensis  "1"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Stalticodiscus_milleri       "1"   "1"   "0"   "0"   "1"   "0"   "0"   "0"   "0"   "0"  
                        Postibulla_legrandensis      "1"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Ulrichidiscus_pulaskiensis   "1"   "1"   "0"   "0"   "1"   "0"   "0"   "0"   "1"   "0"  
                        Lepidodiscus_squamosus       "0"   "1"   "0"   "0"   "0"   "0"   "0"   "0"   "0"   "0"  
                        Lepidodiscus_laudoni         "1"   "1"   "0"   "0"   "1"   "0"   "1"   "1"   "1"   "1"  
                        Chester_Lepidodiscus_laudoni "1"   "1"   "1"   "0"   "1"   "1"   "1"   "1"   "1"   "1"  
                        Discocystis_kaskaskiensis    "1"   "1"   "1"   "0"   "1"   "1"   "1"   "1"   "1"   "1"  
                        Cooperidiscus                "1"   "?"   "0"   "0"   "1"   "0"   "0"   "1"   "?"   "?"  
                        Lispidecodus                 "1"   "1"   "1"   "?"   "?"   "?"   "?"   "?"   "1"   "0"  
                        [,23]
                        Carneyella_pilea             "?"  
                        Foerstediscus_grandis        "?"  
                        Isorophus_cincinnatiensis    "?"  
                        Isorophusella_spp.           "?"  
                        Neoisorophysella_lanei       "?"  
                        Agelacrinites_hamiltonensis  "?"  
                        Stalticodiscus_milleri       "?"  
                        Postibulla_legrandensis      "?"  
                        Ulrichidiscus_pulaskiensis   "0"  
                        Lepidodiscus_squamosus       "?"  
                        Lepidodiscus_laudoni         "1"  
                        Chester_Lepidodiscus_laudoni "1"  
                        Discocystis_kaskaskiensis    "1"  
                        Cooperidiscus                "?"  
                        Lispidecodus                 "1"  
                        > dm<-dist.ml(phyDatdata)
                        > treeUPGM<-upgma(dm)
                        > treeNJ<-NJ(dm)
                        > plot(treeNJ, "unrooted",main="NJ")
                        > plot(treeUPGM,main=upgma)
                        Error in title(...) : 
                          cannot coerce type 'closure' to vector of type 'character'
                        > plot(treeUPGM,main="upgma")
                        > fit=pml(treeNJ,data=phyDatdata)
                        negative edges length changed to 0!
                          > fit
                        
                        loglikelihood: -187.8409 
                        
                        unconstrained loglikelihood: -72.11637 
                        
                        Rate matrix:
                          0 1 2
                        0 0 1 1
                        1 1 0 1
                        2 1 1 0
                        
                        Base frequencies:  
                          0.3333333 0.3333333 0.3333333 
                        > plot(treeNJ)
                        > treeNJ
                        
                        Phylogenetic tree with 15 tips and 13 internal nodes.
                        
                        Tip labels:
                          Carneyella_pilea, Foerstediscus_grandis, Isorophus_cincinnatiensis, Isorophusella_spp., Neoisorophysella_lanei, Agelacrinites_hamiltonensis, ...
                        
                        Unrooted; includes branch lengths.
                        > str(treeNJ)
                        List of 4
                        $ edge       : int [1:27, 1:2] 19 19 18 18 17 17 28 28 27 27 ...
                        $ edge.length: num [1:27] 0.0455 0.0839 0.1882 -0.0506 0.0968 ...
                        $ tip.label  : chr [1:15] "Carneyella_pilea" "Foerstediscus_grandis" "Isorophus_cincinnatiensis" "Isorophusella_spp." ...
                        $ Nnode      : int 13
                        - attr(*, "class")= chr "phylo"
                        - attr(*, "order")= chr "postorder"
                        > plot.phylo(treeNJ, type="cladogram")
                        > parsimony(treeUPGM,phyDatdata)
                        [1] 41
                        > parsimony(treeNJ,phyDatdata)
                        [1] 33
                        > treepars<-optim.parsimony(treeUPGM,phyDatdata)
                        Final p-score 32 after  5 nni operations 
                        > (trees<-bab(phyDatdata))
                        [1] "lower bound: 24"
                        [1] "upper bound: 32"
                        12 phylogenetic trees
                        > plot(trees)
                        Hit <Return> to see next plot: 
                          Hit <Return> to see next plot: 
                          Hit <Return> to see next plot: 
                          Hit <Return> to see next plot: 
                          Hit <Return> to see next plot: 
                          Hit <Return> to see next plot: 
                          Hit <Return> to see next plot: 
                          Hit <Return> to see next plot: 
                          Hit <Return> to see next plot: 
                          Hit <Return> to see next plot: 
                          Hit <Return> to see next plot: 
                          Hit <Return> to see next plot: 