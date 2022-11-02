<img style="float: left" width="100%" height="100" alt="TSE"  src="https://www.telecom-st-etienne.fr/wp-content/themes/telecom/asset/images/logo.svg">
# Classification bayesienne et ses application de detection automatique de visage.
## Apprentissage du modèle de peau
On souhaite mettre en place un système pour détecter automatiquement la présence de visages sur des images. Ce système exploitera un modèle de couleur de peau gaussien multivarié et fonctionnera sur le principe d'un classifieur bayésien optimal, avec modèles de gaussiennes.

On souhaite modéliser la couleur de peau par un modèle gaussien
multi-varié. Soit $\mathbf{x}$ le vecteur qui contient les données
couleur d'un pixel (rgb par exemple). On cherche à déterminer le
modèle suivant 



avec $| \Sigma_1 |$ le déterminant de la matrice $\Sigma_1$. Les paramètres $(\mu_1, \Sigma_1)$ sont inconnus. Ils doivent être appris à partir de donnèes d'apprentissage.

## Les données d'apprentissage
Il est donc nécessaire de disposer de données d'apprentissage. Par chance, de nombreuses personnes ont constitué des bases de données d'images couleur de visage et les ont rendu accessibles. Nous allons utiliser les images fournies à l'adresse : http://vis-www.cs.umass.edu/lfw/ La base de données complètes contient un très grand nombre d'images, largement plus qu'il nous en faut pour définir notre modèle de peau. Par conséquent, vous ne devez télécharger qu'une petite proportion d'images à : http://viswww.cs.umass.edu/lfw/lfw-bush.zip. On se propose d'utiliser ces images pour apprendre le modèle de couleur de peau (il n'est pas utile d'utiliser toutes les images pour apprendre le modèle).

## Choix des caractéristiques
Maintenant que l'on dispose des échantillons d'apprentissage, une question essentielle porte sur le choix des caractéristiques. On propose d'utiliser l'information chromatique de la peau, qui représente des caractéristiques importantes
- Sur un visage quelconque, on constate que les valeurs prises par les pixels de peau ont une distribution d'allure gaussienne dans les espaces couleurs, ce qui incite naturellement à vouloir les décrire grâce à des mélanges de gaussiennes. 
- On préfére de se placer dans l'espace couleur YCbCr (pour ces excellente résultats selon les travaux de recherche.

### L'histogramme des images de la base de données
L'histogramme représente les caractéristique de la distribution de chrominances Cb Cr, selon les différents échantillons, cette histogramme peut être modélisé par une distribution gaussienne.
Donc le modèle de probabilité théorique le plus adapter pour modéliser les classes est le modèle des distributions gaussiennes.

## Application du modèle à une image test
On souhaite étudier la pertinence du modèle appris précédemment en l'appliquant sur des images d'entrée. Pour une image d'entrée (non utilisée pour l'apprentissage), on souhaite regarder pour chaque pixel s la valeur de la probabilité $p (\mathbf{x}_s | \omega_1)$ en utilisant la loi estimée précédemment.
