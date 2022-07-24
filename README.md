# Segmentation_WBC_microscopy
Shape and size detection for WBC in blood is necessary for ensuring the ability to eliminate or control the infections or any inflammatory problems in the body. 

WBC are of five types, subdivided into two parts:
1)Granulocytes: neutrophils , basophils, eosinophils 
2)Agranulocytes: lymphocytes, monocyts. 

The nucleus of WBC contains DNA and RNA that are stained by hematoxyline in Purple/blue color and the granules in cytoplasm are stained by eosine in pink color. As agranulocytes does not have granules in cytoplasm we won’t see eosine stained image for them. The function deconv is separating out the hematoxyline stained region and eosin stained region in different output images. The function segmentation can be used on this images to segment out nucleus and cytoplasmics granules. 

Approach:
Input RGB image is first deconvoluted to H and E stained Image.
Find threshold for each output deconvolved image.
Plot histogram representing two regions after segmentation.
Apply segmentation based on threshold values.
Output image is binary.
