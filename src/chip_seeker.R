#if (!requireNamespace("BiocManager", quietly = TRUE))
# install.packages("BiocManager")
#BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
#BiocManager::install("ChIPseeker")
#BiocManager::install("clusterProfiler")
#BiocManager::install("org.Hs.eg.db")

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(clusterProfiler)
setwd('C:/Users/����/Desktop/HSE/�������������/������/����������/src/')
###
data_dir <- '../data/'
out_dir <- '../images/'
name_1 <- 'H3K36me3_HepG2.ENCFF296VZN.hg19.filtered'
name_2 <- 'H3K36me3_HepG2.ENCFF924TKB.hg19.filtered'
BED_FN_1 <- paste0(data_dir, name_1, '.bed')
BED_FN_2 <- paste0(data_dir, name_2, '.bed')

###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno_1 <- annotatePeak(BED_FN_1, tssRegion=c(-3000, 3000), 
                         TxDb=txdb, annoDb="org.Hs.eg.db")

pdf(paste0(out_dir, 'chip_seeker.', name_1, '.plotAnnoPie.pdf'))
plotAnnoPie(peakAnno_1)
dev.off()


peakAnno_2 <- annotatePeak(BED_FN_2, tssRegion=c(-3000, 3000), 
                           TxDb=txdb, annoDb="org.Hs.eg.db")
pdf(paste0(out_dir, 'chip_seeker.', name_2, '.plotAnnoPie.pdf'))
plotAnnoPie(peakAnno_2)
dev.off()
