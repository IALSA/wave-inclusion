# Title

<!-- These two chunks should be added in the beginning of every .Rmd that you want to source an .R script -->
<!--  The 1st mandatory chunck  -->
<!--  Set the working directory to the repository's base directory -->


<!--  The 2nd mandatory chunck  -->
<!-- Set the report-wide options, and point to the external code file. -->




<!-- Load 'sourced' R files.  Suppress the output when loading packages. --> 



<!-- Load the sources.  Suppress the output when loading sources. --> 



<!-- Load any Global functions and variables declared in the R file.  Suppress the output. --> 


<!-- Declare any global functions specific to a Rmd output.  Suppress the output. --> 


<!-- Load the datasets.   -->

```
           software version       date     time study_name model_number subgroup model_type physical_construct
1 Mplus VERSION 7.3     0.1 10/02/2015  1:40 PM       RADC           b1   female          a                 NA
2 Mplus VERSION 7.3     0.1 10/02/2015  1:40 PM       RADC           b1   female          a                 NA
3 Mplus VERSION 7.3     0.1 10/02/2015  1:41 PM       RADC           b1   female          a                 NA
4 Mplus VERSION 7.3     0.1 10/02/2015  1:41 PM       RADC           b1   female          a                 NA
5 Mplus VERSION 7.3     0.1 10/02/2015  1:41 PM       RADC           b1   female          a                 NA
6 Mplus VERSION 7.3     0.1 10/02/2015  1:42 PM       RADC           b1   female          a                 NA
  cognitive_construct physical_measure cognitive_measure converged subject_count wave_count datapoint_count
1                  NA             grip      digitsymbols      TRUE           336         10              NA
2                  NA             grip      digitsymbols      TRUE           336         11              NA
3                  NA             grip      digitsymbols      TRUE           336         12              NA
4                  NA             grip      digitsymbols      TRUE           336         13              NA
5                  NA             grip      digitsymbols      TRUE           336         14              NA
6                  NA             grip      digitsymbols      TRUE           336         15              NA
  parameter_count         LL      aic      bic  adj_bic     aaic                          output_file         data_file
1              21  -9666.408 19374.82 19454.97 19388.36 19377.76 b1_female_a_grip_digitsymbols_10.out  radcMAP_wide.dat
2              21  -9897.040 19836.08 19916.24 19849.62 19839.02 b1_female_a_grip_digitsymbols_11.out  radcMAP_wide.dat
3              21 -10008.704 20059.41 20139.57 20072.95 20062.35 b1_female_a_grip_digitsymbols_12.out  radcMAP_wide.dat
4              21 -10043.541 20129.08 20209.24 20142.63 20132.02 b1_female_a_grip_digitsymbols_13.out  radcMAP_wide.dat
5              21 -10068.271 20178.54 20258.70 20192.09 20181.48 b1_female_a_grip_digitsymbols_14.out  radcMAP_wide.dat
6              21 -10079.413 20200.83 20280.99 20214.37 20203.77 b1_female_a_grip_digitsymbols_15.out  radcMAP_wide.dat
  pc_TAU_00_est pc_TAU_00_se pc_TAU_00_wald pc_TAU_00_pval pc_TAU_11_est pc_TAU_11_se pc_TAU_11_wald pc_TAU_11_pval
1        23.810        8.423          2.827          0.005         0.245        0.108          2.267          0.023
2        24.191        8.405          2.878          0.004         0.229        0.107          2.151          0.031
3        23.903        8.363          2.858          0.004         0.241        0.105          2.304          0.021
4        24.222        8.383          2.890          0.004         0.233        0.104          2.250          0.024
5        24.314        8.384          2.900          0.004         0.238        0.104          2.297          0.022
6        24.238        8.377          2.893          0.004         0.240        0.103          2.325          0.020
  pc_TAU_01_est pc_TAU_01_se pc_TAU_01_wald pc_TAU_01_pval pc_TAU_10_est pc_TAU_10_se pc_TAU_10_wald pc_TAU_10_pval
1         1.244        1.141          1.090          0.276         0.921        1.322          0.696          0.486
2         1.087        1.144          0.950          0.342         0.978        1.303          0.751          0.453
3         1.217        1.149          1.060          0.289         0.983        1.289          0.763          0.446
4         1.259        1.141          1.104          0.270         0.843        1.289          0.654          0.513
5         1.214        1.138          1.067          0.286         0.843        1.282          0.658          0.511
6         1.204        1.136          1.060          0.289         0.870        1.277          0.681          0.496
  pc_SIGMA_est pc_SIGMA_se pc_SIGMA_wald pc_SIGMA_pval pp_TAU_00_est pp_TAU_00_se pp_TAU_00_wald pp_TAU_00_pval
1        0.372       0.990         0.376         0.707       274.339       28.281          9.701              0
2        0.427       0.955         0.447         0.655       273.033       28.086          9.721              0
3        0.564       0.971         0.580         0.562       271.857       28.000          9.709              0
4        0.730       0.976         0.748         0.454       272.336       27.902          9.760              0
5        0.702       0.976         0.720         0.472       272.390       27.875          9.772              0
6        0.724       0.975         0.743         0.458       272.164       27.829          9.780              0
  pp_TAU_11_est pp_TAU_11_se pp_TAU_11_wald pp_TAU_11_pval pp_TAU_01_est pp_TAU_01_se pp_TAU_01_wald pp_TAU_01_pval
1         2.307        0.670          3.444          0.001        -9.019        2.813         -3.206          0.001
2         2.205        0.664          3.322          0.001        -8.402        2.727         -3.081          0.002
3         2.108        0.662          3.187          0.001        -7.914        2.684         -2.949          0.003
4         2.129        0.652          3.263          0.001        -8.020        2.633         -3.046          0.002
5         2.116        0.651          3.248          0.001        -7.985        2.613         -3.055          0.002
6         2.107        0.650          3.240          0.001        -7.923        2.600         -3.048          0.002
  p_SIGMA_est p_SIGMA_se p_SIGMA_wald p_SIGMA_pval cc_TAU_00_est cc_TAU_00_se cc_TAU_00_wald cc_TAU_00_pval
1      35.155      2.435       14.437            0        58.733        5.298         11.086              0
2      34.831      2.358       14.775            0        58.684        5.296         11.082              0
3      34.981      2.354       14.858            0        58.789        5.317         11.057              0
4      34.869      2.347       14.859            0        59.075        5.312         11.121              0
5      34.741      2.345       14.816            0        59.317        5.313         11.164              0
6      34.700      2.341       14.821            0        59.313        5.313         11.165              0
  cc_TAU_11_est cc_TAU_11_se cc_TAU_11_wald cc_TAU_11_pval cc_TAU_10_est cc_TAU_10_se cc_TAU_10_wald cc_TAU_10_pval
1         0.365        0.111          3.283          0.001        -0.725        0.699         -1.038          0.299
2         0.370        0.108          3.441          0.001        -0.700        0.705         -0.994          0.320
3         0.395        0.115          3.430          0.001        -0.755        0.736         -1.026          0.305
4         0.368        0.111          3.317          0.001        -0.818        0.721         -1.136          0.256
5         0.367        0.110          3.341          0.001        -0.876        0.712         -1.230          0.219
6         0.367        0.110          3.346          0.001        -0.873        0.713         -1.225          0.221
  c_SIGMA_est c_SIGMA_se c_SIGMA_wald c_SIGMA_pval p_GAMMA_00_est p_GAMMA_00_se p_GAMMA_00_wald p_GAMMA_00_pval
1      21.364      1.045       20.442            0         80.590         1.798          44.831               0
2      21.226      1.023       20.745            0         80.533         1.792          44.935               0
3      21.252      1.012       21.009            0         80.561         1.785          45.136               0
4      21.543      1.060       20.328            0         80.605         1.786          45.141               0
5      21.553      1.068       20.187            0         80.609         1.785          45.147               0
6      21.519      1.062       20.271            0         80.599         1.785          45.154               0
  p_GAMMA_10_est p_GAMMA_10_se p_GAMMA_10_wald p_GAMMA_10_pval c_GAMMA_00_est c_GAMMA_00_se c_GAMMA_00_wald
1         -1.791         0.255          -7.018               0         36.000         0.798          45.116
2         -1.756         0.248          -7.069               0         36.040         0.798          45.149
3         -1.778         0.246          -7.224               0         36.040         0.799          45.111
4         -1.792         0.246          -7.276               0         36.073         0.802          44.979
5         -1.794         0.246          -7.303               0         36.084         0.803          44.939
6         -1.791         0.245          -7.305               0         36.083         0.803          44.946
  c_GAMMA_00_pval c_GAMMA_10_est c_GAMMA_10_se c_GAMMA_10_wald c_GAMMA_10_pval R_IPIC_est R_IPIC_se R_IPIC_wald
1               0         -0.320         0.114          -2.811           0.005         NA        NA          NA
2               0         -0.340         0.117          -2.902           0.004         NA        NA          NA
3               0         -0.341         0.123          -2.774           0.006         NA        NA          NA
4               0         -0.358         0.120          -2.982           0.003         NA        NA          NA
5               0         -0.363         0.119          -3.047           0.002         NA        NA          NA
6               0         -0.362         0.119          -3.040           0.002         NA        NA          NA
  R_IPIC_pval R_SPSC_est R_SPSC_se R_SPSC_wald R_SPSC_pval R_RES_PC_est R_RES_PC_se R_RES_PC_wald R_RES_PC_pval
1          NA         NA        NA          NA          NA           NA          NA            NA            NA
2          NA         NA        NA          NA          NA           NA          NA            NA            NA
3          NA         NA        NA          NA          NA           NA          NA            NA            NA
4          NA         NA        NA          NA          NA           NA          NA            NA            NA
5          NA         NA        NA          NA          NA           NA          NA            NA            NA
6          NA         NA        NA          NA          NA           NA          NA            NA            NA
  covar_covered has_converged Error
1             0          TRUE  <NA>
2             0          TRUE  <NA>
3             0          TRUE  <NA>
4             0          TRUE  <NA>
5             0          TRUE  <NA>
6             0          TRUE  <NA>
```

<!-- Tweak the datasets.   -->




<!-- Basic table view.   -->


<!-- Basic graph view.   -->

```r
dual_grid(ds,  vertical="wave_count",  border=5)
```

![](figure_rmd/basic_graph-1.png) 




