
# Identifying Lesions in Paediatric Epilepsy using Morphometric and Textural Analysis of Magnetic Resonance Images
Sancgeetha Kulaseharan, Mehran Ebrahimi, and Elysa Widjaja
__________________________________________________________________________________________________________________

### Abstract

Focal Cortical Dysplasia (FCD) is a brain malformation that is frequently responsible for epilepsy in children and accounts for approximately 26% of intractable epilepsy in children (Wyllie et al., 1998). FCD is one of the main causes of Epilepsy in adults and children. FCD is one of the most challenging groups of lesions to detect on conventional MRI as the imaging features may be subtle and not infrequently missed. In studies conducted with adult cohorts, FCD detection was improved with computational techniques. In this research we developed a computer-aided diagnosis system to classify and detect FCD lesions in MRI images, applied to developing brains. We implemented a modified version of the 2-Step Bayesian classifier method to a pediatric cohort with medically intractable epilepsy with MRI-positive and MRI-negative epilepsy, and evaluated the performance of the algorithm trained on textural features derived from T1-weighted (T1-w), T2-weighted (T2-w), and FLAIR (Fluid Attenuated Inversion Recovery) sequences. The 2-Step Naive Bayes classifier correctly rejected 13/13 healthy subjects and co-localized lesions in 29/31 of the MRI-positive cases, with 63% coverage of the complete extent of the lesion using supplied lesional labels. 

### Software

These Research was conducted on an Ubuntu operating system using R (v3.4.1), MATLAB (R2017a) in combination with SPASM (Statistical Parametric Mapping), and FreeSurfer software packages. FreeSurfer v5.3.0 (Dale, Fischl, & Sereno, 1999; Dale & Sereno, 1993) (Fischl & Dale, 2000) (Fischl, Sereno, & Dale, 1999) (Fischl et al., 2004) was employed for pre-processing T1-w images for all cases and controls in order to perform cortical reconstruction using Surface Based Morphometry (SBM), produce anatomical labeling and structural details. FreeSurfer can directly process T1-w acquisitions, as opposed to T2-w and FLAIR. In order to incorporate T2-w and FLAIR sequences into the analysis, the SPM package was used with MATLAB and FreeSurfer output for T2-w and FLAIR acquisitions to prepare the images for analysis. 

### Repository

This implementation performs a 2 Step Bayesian classification for Focal Cortical Dysplasia (FCD) Detection in Magnetic Resonance Imaging (MRI). It uses a combination of established morphometric features and textural analysis using Gray-Level Co-occurrence Matrices (GLCM) on MRI sequences.


#### Inputs
* A text file* containing feature vectors for training instances
* A text file* containing feature vectors for test instances

  *Data file headers:
  *'case','struct','class','V1','V2','V3','ASM','CONTRAST','ENTROPY','CORRELTN','HOMOG','VARIANCE','SUMMN','INERTIA','CLUSTSHADE','CLUSTTEND','MAXPROB','INVVAR','CORTICAL','GRADMAG'


#### Output
* An Excel sheet where first colomn is the  .... in each sample case and the second colomn is ts corresponding predicted class lablel





Paper is available at:
https://ir.library.dc-uoit.ca/bitstream/10155/877/1/Kulaseharan_Sancgeetha.pdf
