#macro tour(transl,textr)
     #local tour_piece = object {
        difference { 
            union {
                cylinder { <0,0,0>, <0,0,0.4>, 1 } // Cy1 : bas du socle 
                torus { 0.4, 0.25 scale <1,1,1> rotate <90,0,0> translate <0,0,1.40> } // T2 : anneau sur le haut du socle 
                cone { <0,0,0.4>, 1, <0,0,1.6>, 0.5 } // Co1 : cone du socle
                cone { <0,0,1.6>, 0.55, <0,0,3.2>, 0.4 } // Co2 : corps de la piece
                torus { 0.3 ,0.2 scale <1,0.5,1> rotate <90,0,0> translate <0,0,3> } // T3 : anneau sur le haut de la piece
                cylinder { <0,0,3.2>, <0,0,4>, 0.8 } // Cy2 : cylindre formant la tete de la tour
            }
            union {    
                torus { 1 ,0.15 scale <1,0.6,1> rotate <90,0,0> translate <0,0,0.4> } // T1 : Demarcation creuse du socle
                cylinder { <0,0,3.4>, <0,0,4.1>, 0.65 } // Cy3 : creuse Cy2
                box { <-0.15,-0.8,3.6>, <0.15,0.8,4.1> } // B2 : Creneaux en haut de la tour
                box { <0.8,0.15,3.6>, <-0.8,-0.15,4.1> } // B1 : Creneaux en haut de la tour 
            } 
        } 
        texture{ textr finish {specular 0.5} }
        scale 0.35
        translate transl
    }
    tour_piece
#end 