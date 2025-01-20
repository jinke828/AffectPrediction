# AffectPrediction

**Jin Ke, Hayoung Song, Zihan Bai, Monica D. Rosenberg & Yuan Chang Leong (2024). Dynamic functional connectivity encodes generalizable representations of emotional arousal across individuals and situational contexts. _bioRxiv_.**  

https://www.biorxiv.org/content/10.1101/2023.11.14.566767v2
       
         
**FMRI datasets used in the study**          

* Sherlock dataset : http://arks.princeton.edu/ark:/88435/dsp01nz8062179 (Chen et al., 2017; Nat. Neurosci.)  
* Friday Night Lights dataset : https://openneuro.org/datasets/ds003521/versions/2.2.0 (Chang et al., 2021; Sci. Adv.)  
* Merlin dataset: https://openneuro.org/datasets/ds001110/versions/00003 (Zadbood et al., 2017; Cereb. Cortex.)  
* North by Northwest dataset: Collected by our group, access upon request -- please email jinke@uchicago.edu  

**Behavioral data & arousal network**       

* Data openly available after paper being published
* update on 1.20.2025: the behavioral data is now publicly avaiable here: https://github.com/jinke828/AffectPrediction/tree/main/beh_ratings
* The arousal networks are available here: https://github.com/jinke828/AffectPrediction/tree/main/arousal_network.

**Code**      
* Computing dynamic functional connectivity and applying sliding window to behavioral timecourse: 
https://github.com/hyssong/NarrativeEngagement/tree/main/code/preprocess

* Within- and across-dataset arousal prediction:             
https://github.com/jinke828/AffectPrediction/tree/main/code

**Trained model**
* To run the trained model on your own data, please see apply_model.ipynb in https://github.com/jinke828/AffectPrediction/tree/main/arousal_network. This will run the saved SVR model (svr_model.pkl) trained on the overlap arousal network (arousal_network.mat) and the combined Sherlock and Friday Night Lights datasets.

please refer to the following guide for step-by-step instructions on how to run the analysis code and trained model
path: [./code/guide.pdf](https://github.com/jinke828/AffectPrediction/blob/main/code/Code_guide.pdf)

