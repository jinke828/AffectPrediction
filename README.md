# AffectPrediction

**Ke, J., Song, H., Bai, Z., Rosenberg, M. D., & Leong, Y. C. (2025). Dynamic brain connectivity predicts emotional arousal during naturalistic movie-watching. PLOS Computational Biology, 21(4), e1012994.**  

[https://www.biorxiv.org/content/10.1101/2023.11.14.566767v2](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1012994](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1012994)
       
         
**FMRI datasets used in the study**          

* Sherlock dataset : http://arks.princeton.edu/ark:/88435/dsp01nz8062179 (Chen et al., 2017; Nat. Neurosci.)  
* Friday Night Lights dataset : https://openneuro.org/datasets/ds003521/versions/2.2.0 (Chang et al., 2021; Sci. Adv.)  
* Merlin dataset: https://openneuro.org/datasets/ds001110/versions/00003 (Zadbood et al., 2017; Cereb. Cortex.)  
* North by Northwest dataset: Collected by our group, access upon request -- please email jin.ke@yale.edu

**Behavioral data & arousal network**       

* Data openly available after paper being published
* update on 1.20.2025: the valence and arousal behavioral rating data in all 4 movies (i.e., Sherlock, Friday Night Lights, North by Northwest, and Merlin) are now openly available to the public:  https://github.com/jinke828/AffectPrediction/tree/main/beh_ratings
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

