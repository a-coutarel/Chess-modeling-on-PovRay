/*
 * Importation des assets
 */
#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "woods.inc"
#include "glass.inc"
#include "metals.inc"
#include "functions.inc" 
#include "stones1.inc"
#include "skies.inc" 
#include "transforms.inc"

/*
 * Importation des pieces
 */
#include "pieces/cavalier.pov"
#include "pieces/dame.pov"
#include "pieces/fou.pov"
#include "pieces/pion.pov"
#include "pieces/roi.pov"
#include "pieces/tour.pov"

#declare Pi = 3.1415926535897932384626;

// Adaptation Linux :
#declare START = 0.0; // Debut clock 
#declare END = 6.2; // Fin clock
#declare myclock = START + (END-START)*clock;
//povray -W1280 -H720 +A +R9 +KFI1 +KFF186 echec.pov
//convert -loop 1 -delay 40 echec*.png echec.gif
                                   
 
    /* 
    *Version windows pour l'animation
    *On cree un fichier echec.ini contenant le code suivant : 
        
        ; Activation et configuration de l'Antialasing
            Antialias=On
            Antialias_Threshold=0.1
            Antialias_Depth=2
            
        ; Nom du fichier du projet
            Input_File_Name="echec.pov"
            
        ; Configuration du nombre d'image et de la variable clock
            Initial_Frame=1
            Final_Frame=186
            Initial_Clock=0
            Final_Clock=6.2
            
            Cyclic_Animation=on
            Pause_when_Done=off   
    
    *On lance le rendu du fichier echec.ini pour generer les images de l'animation
    *Les 3 declarations START, END et myclock ne sont donc plus necessaires, il faut alors remplacer la variable myclock par clock dans le code qui suit pour la version windows uniquement
    */                                  
    
                                  
//// AXES ////
 
#declare axe=0; // Afficher ou non les axes
#macro flecheDiffuseNom(G,H,Coul,alph,rCyl,rCon,diffu,text1,sca,rot,trans)
    #local H1 = G + alph* (H-G);
    union{
        union{
          cylinder{
    	  G, H1, rCyl
          }
          cone{
    	  H1, rCon
    	  H , 0
          }
        }
        text {
                ttf "timrom.ttf"  text1
    	        0.1, 0  
                scale sca 
                rotate rot
                translate trans 
        } 
        pigment {color Coul} finish {diffuse diffu}
    }
#end 

#declare O3 = <0, 0, 0>;
#declare I =<1, 0, 0>;
#declare J = <0, 1, 0>;
#declare K = <0, 0, 1>;
#declare rCyl = 0.025;
#declare rCone = 0.075;
#if (axe)
  flecheDiffuseNom(O3, I, Red,   0.75,   rCyl, rCone, 1, "X", 0.35, <90, 0, 0>,   <0.5,   0,    0.125>)
  flecheDiffuseNom(O3, J, Green, 0.75,   rCyl, rCone, 1, "Y", 0.35, <90, 0, -45>, <0.0,   0.75, 0.1250>)
  flecheDiffuseNom(O3, K, Blue,  0.75,   rCyl, rCone, 1, "Z", 0.35, <90, 0, 180>, <-0.20, 0.0,  0.750>)
#end

/////// CAMERA ///////

#declare sca=15;
camera {
    location <4, 16, 3+(myclock/2)>
    look_at <4, 4, 0>
    sky   <0, 0, 1>
    right <-image_width/image_height, 0, 0>
}


/////// LIGHTS ///////

light_source { <4, 4, 15> color White spotlight radius 100 point_at <4,4,0>}  
light_source { <4, 4, 2> color rgb <0.3,0.3,0.3> } 
               
               
#declare use_phot=1;                       
#declare use_area=0;

global_settings{
  max_trace_level 60//32*3
  ambient_light 1.00
  assumed_gamma 2.0
  #if (use_phot)
    photons{
        spacing .025
        autostop 0
    }
  #end
}


/////// CIEL ///////

#declare ciel=1;
#if (ciel)
  sky_sphere {S_Cloud2 rotate <90,0.051, 1>}
#end      


/////// PLAN ///////

plane{
-z 0.51
  material {
      texture{
	    Brushed_Aluminum
	    finish{phong 0.8	 
	      ambient 0.85
	      diffuse 0.2
	      reflection 0.2    
	  }
      }
      interior { ior 1.3333  fade_distance 1 fade_power 1
		  fade_color <0.5,0.5,0>  caustics 2.5
      }
  }
rotate <0,0,45>
}          


/////////////////////////////// PLATEAU ///////////////////////////////

union {
    box { <-0.5,-0.5,-0.51>, <8.5,8.5,-0.01>
        texture { pigment { DMFWood3 } } 
    } 
    box { <0,0,-0.5>, <8,8,0>    
        texture { checker texture { New_Brass }, texture { Chrome_Metal } }
    } 
}


/////////////////////////////// CREATIONS DES DEPLACEMENTS POUR L'ANIMATION /////////////////////////////// 
// Pour Windows : changer myclock en clock
#declare d1 = <6.5,0.5,0>;
#declare d2 = <1.5,5.5,0>;  
#declare d3 = <6.5,2.5,0>;
#declare d4 = <0.5,6.5,0>;
#declare d5 = <7.5,2.5,0>;                                    
#declare d5_curve = spline { cubic_spline
                             myclock, pow((1-(myclock-5)),3)*< 7.5, 2.5, 0> + 3*pow((1-(myclock-5)),2)*(myclock-5)*< 5.71, 3.4, 0> + 3*(1-(myclock-5))*pow((myclock-5),2)*< 4.71, 1.4, 0> + pow((myclock-5),3)*< 6.5, 0.5, 0> }

#switch(myclock)
    #range (0, 1)
        #declare d1 = <6.5-(myclock*2),0.5,0>;
    #break
    #range (1, 2)
        #declare d1 = <4.5,0.5,0>;
        #declare d2 = <1.5+((myclock-1)*2),5.5,0>;
    #break
    #range (2, 2.5)
        #declare d1 = <4.5,0.5,0>;
        #declare d2 = <3.5,5.5,0>;
        #declare d3 = <6.5-((myclock-2)*2),2.5,0>; 
    #break
    #range (2.5, 3)
        #declare d1 = <4.5,0.5,0>;
        #declare d2 = <3.5,5.5,0>;
        #declare d3 = <5.5,2.5+((myclock-2.5)*2),0>;
    #break
    #range (3, 3.5)
        #declare d1 = <4.5,0.5,0>;
        #declare d2 = <3.5,5.5,0>;
        #declare d3 = <5.5,3.5,0>; 
        #declare d4 = <0.5,6.5,0+((myclock-3)*4.2)>;
    #break
    #range (3.5, 4.5)
        #declare d1 = <4.5,0.5,0>;
        #declare d2 = <3.5,5.5,0>;
        #declare d3 = <5.5,3.5,0>; 
        #declare d4 = <0.5+(myclock-3.5),6.5-(myclock-3.5),2.1>;
    #break
    #range (4.5, 5)
        #declare d1 = <4.5,0.5,0>;
        #declare d2 = <3.5,5.5,0>;
        #declare d3 = <5.5,3.5,0>; 
        #declare d4 = <1.5,5.5,2.1-((myclock-4.5)*4.2)>;
    #break
    #range (5, 6)
        #declare d1 = <4.5,0.5,0>;
        #declare d2 = <3.5,5.5,0>;
        #declare d3 = <5.5,3.5,0>; 
        #declare d4 = <1.5,5.5,0>;
        #declare d5 = d5_curve (myclock); 
    #break
    #range (6, 6.2)
        #declare d1 = <4.5,0.5,0>;
        #declare d2 = <3.5,5.5,0>;
        #declare d3 = <5.5,3.5,0>; 
        #declare d4 = <1.5,5.5,0>;
        #declare d5 = <6.5, 0.5, 0>; 
    #break
#end


/////////////////////////////// CREATIONS ET PLACEMENT DES PIECES /////////////////////////////// 

// Camp des pieces dorees
#declare campA = 
union {
    object { tour( <0.5,0.5,0>, Gold_Metal ) }
    object { tour( <0.5,7.5,0>, Gold_Metal ) }
    object { fou( <0.5,1.5,0>, <0,0,-90>, Gold_Metal ) }
    object { fou( d4, <0,0,-90>, Gold_Metal ) }
    object { cavalier( <0.5,2.5,0>,<0,0,90>, Gold_Metal ) }
    object { cavalier( <0.5,5.5,0>,<0,0,90>, Gold_Metal ) }
    object { roi( <0.5,3.5,0>, Gold_Metal ) }
    object { dame( <0.5,4.5,0>, Gold_Metal ) }
    object { pion( d2, Gold_Metal ) }                     
#for (i, 0, 4)
    object { pion( <1.5,0.5+i,0>, Gold_Metal ) }
#end 
#for (i, 6, 7)
    object { pion( <1.5,0.5+i,0>, Gold_Metal ) }
#end 
}

// Camp des pieces chromees
#declare campB = 
union {
    object { tour( <7.5,0.5,0>, Chrome_Metal ) } 
    object { tour( <7.5,7.5,0>, Chrome_Metal ) }
    object { fou( <7.5,1.5,0>, <0,0,90>, Chrome_Metal ) }
    object { fou( <7.5,6.5,0>, <0,0,90>, Chrome_Metal ) }
    object { cavalier( d5,<0,0,-90>, Chrome_Metal ) }
    object { cavalier( <7.5,5.5,0>,<0,0,-90>, Chrome_Metal ) }
    object { roi( <7.5,4.5,0>, Chrome_Metal ) }
    object { dame( <7.5,3.5,0>, Chrome_Metal ) }
    object { pion( d1, Chrome_Metal ) }
    object { pion( <6.5,1.5,0>, Chrome_Metal ) }
    object { pion( d3, Chrome_Metal ) }
    #for (i, 3, 7)
        object { pion(<6.5,0.5+i,0>, Chrome_Metal) }
    #end 
}

// Affichage des camps
object { campA }
object { campB }
