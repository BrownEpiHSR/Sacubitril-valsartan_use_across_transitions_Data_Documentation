library(touch)

# start with ICD-9 HF codes

hf_icd9_reduced <- c('42820', '42821', '42822', '42823', '42840', '42841', '42842', '42843')
hf_icd9_preserved <- c('42830', '42831', '42832', '42833')
hf_icd9_unknown <- c('4280', '4281', '4289')

# forward map to ICD-10 HF codes

convert_icd9_to_icd10 <- function(codes) {
  # icd_map() comes from the touch package & can translate ICD-9 to ICD-10
  mapped_codes <- icd_map(codes)
  # format icd_map() output to make it one-dimensional
  mapped_codes_split <- sapply(mapped_codes, function(x) strsplit(x, ','))
  mapped_codes_split <- unname(mapped_codes_split)
  mapped_codes <- unlist(mapped_codes_split)
  return(mapped_codes)
}

hf_icd10_reduced <- convert_icd9_to_icd10(hf_icd9_reduced)
hf_icd10_preserved <- convert_icd9_to_icd10(hf_icd9_preserved)
hf_icd10_unknown <- convert_icd9_to_icd10(hf_icd9_unknown)

# create combined lists of ICD-9 & ICD-10 HF codes

hf_icd9 <- c(hf_icd9_reduced, hf_icd9_preserved, hf_icd9_unknown)
hf_icd10 <- c(hf_icd10_reduced, hf_icd10_preserved, hf_icd10_unknown)

