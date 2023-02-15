library(rentrez)

ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") # create a vector of three text values
Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") # get data files from NCBI corresponding to the identifiers given (ncbi_ids)
print(Bburg)

Sequences <- strsplit(Bburg, "\n\n")
Sequences <- unlist(Sequences)


header <- gsub("(^>.*sequence)\\n[ATCG].*", "\\1", Sequences)
seq <- gsub("^>.*sequence\\n([ATCG].*)", "\\1", Sequences)
Sequences <- data.frame(Name = header, Sequence = seq)

Sequences$Sequence <- gsub("\n", "", Sequences$Sequence)
write.csv(Sequences, file = "Sequences.csv")


