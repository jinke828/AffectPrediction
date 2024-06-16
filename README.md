# AffectPrediction

**Jin Ke, Hayoung Song, Zihan Bai, Monica D. Rosenberg & Yuan Chang Leong (2024). Dynamic functional connectivity encodes generalizable representations of emotional arousal across individuals and situational contexts. _bioRxiv_.**  

https://www.biorxiv.org/content/10.1101/2023.11.14.566767v1
       
         
**FMRI datasets used in the study**          

* Sherlock dataset : http://arks.princeton.edu/ark:/88435/dsp01nz8062179 (Chen et al., 2017; Nat. Neurosci.)  
* Friday Night Lights dataset : https://openneuro.org/datasets/ds003521/versions/2.2.0 (Chang et al., 2021; Sci. Adv.)  
* Merlin dataset: https://openneuro.org/datasets/ds001110/versions/00003 (Zadbood et al., 2017; Cereb. Cortex.)  
* North by Northwest dataset: Collected by our group, access upon request -- please email jinke@uchicago.edu  

**Behavioral data, preprocessed brain data, & arousal network**       

* Data open available after paper being published

**Code**      
* Computing dynamic functional connectivity and applying sliding window to behavioral timecourse: 
https://github.com/hyssong/NarrativeEngagement/tree/main/code/preprocess

* Within- and across-dataset arousal prediction:             
https://github.com/jinke828/AffectPrediction/tree/main/code

* if you are interested in using the arousal network and apply the SVR to your own data to generate moment-to-moment arousal fluctuations:
https://github.com/jinke828/AffectPrediction/tree/main/arousal_network
run this code: apply_model.ipynb, which will use the arousal network ('arousal_network.mat') and the defined SVR model (svr_model.pkl)

please check the guidance for step-by-step instructions to run these code.
path: ./code/guide.pdf

