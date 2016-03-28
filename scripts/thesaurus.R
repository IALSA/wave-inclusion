
# ---- evaluating_conditions_in_long_data -------------------------
# see https://github.com/IALSA/wave-inclusion/issues/15

# given the dataset,
(ds <- data.frame(
  id           = c(111,111,111,222,222,222, 333, 333),
  wave         = c(0, 1, 2, 0, 1, 2, 0, 1),
  dementia = c(0, 0, 1, 0, 0, NA, 0, 1)
))
# develop a rule with dplyr idioms that would excluded those persons, for whom dementia == 1 is true at any time point.

ds %>% dplyr::group_by(id) %>%
  dplyr::mutate(dementia_ever = any(dementia==1)) %>%
  dplyr::ungroup() %>%
  dplyr::filter(dementia_ever %in% c(FALSE, NA))



