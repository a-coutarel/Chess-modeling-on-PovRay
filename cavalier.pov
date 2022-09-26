#macro cavalier(transl,rot,textr)
     #local cavalier_piece = object {
        difference {
            union {
                cylinder { <0,0,0>, <0,0,0.4>, 1 } // Cy1 : bas du socle 
                torus { 0.4, 0.25 scale <1,1,1> rotate <90,0,0> translate <0,0,1.4> }  // T2 : 1er anneau sur le haut du socle 
                cone { <0,0,0.4>, 1, <0,0,1.6>, 0.5 } // Co1 : cone du socle
                torus { 0.3, 0.25 scale <1,0.6,1> rotate <90,0,0> translate <0,0,1.7> } // T3 : 2eme anneau sur le haut du socle
                prism { 
                    quadratic_spline // Voir capture d'ecran geogebra dans le rapport pour les points
                    0, 0.25, 15
                    <0.2, 1.9>
                    <0.4, 0> // A
                    <0.4, 0.6> // B
                    <0.6, 1.6> // C
                    <0.36, 1.9> // D
                    <0.05, 1.9> // E
                    <0.1, 1.82> // F
                    <-0.07, 1.6> // G
                    <-0.05, 1.4> // H
                    <-0.34, 0.94> // I
                    <-0.15, 0.75> // J
                    <0.1, 0.9>   // K
                    <0, 0.6> // L
                    <0,0> // M
                    <0.4,0> // A
                    scale 2
                    rotate <0,0,90>
                    translate <0.25, -0.4, 1.65>
                }     
                sphere { <0.25,-0.25,4.75> 0.06 } // S3 : Oeil
                sphere { <-0.25,-0.25,4.75> 0.06 } // S4 : Oeil 
            }            
            union {           
                torus { 1 ,0.15 scale <1,0.6,1> rotate <90,0,0> translate <0,0,0.4> } // T1 : Demarcation creuse du socle
                sphere { <0.12,-1,3.28> 0.10 } // S1 : trou pour le nez
                sphere { <-0.12,-1,3.28> 0.10 } // S2 : trou pour le nez   
            }                  
        }   
        rotate rot 
        texture{ textr finish {specular 0.5} }
        scale 0.3
        translate transl  
    }
    cavalier_piece
#end
