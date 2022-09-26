#macro roi(transl,textr)
    #local roi_piece = object {
        difference {
            union {
                cylinder { <0,0,0>, <0,0,0.4>, 1 } // Cy1 : bas du socle
                torus { 0.4 ,0.25 scale <1,1,1> rotate <90,0,0> translate <0,0,1.40> } // T2 : anneau sur le haut du socle 
                cone { <0,0,0.4>, 1, <0,0,1.6>, 0.5 } // Co1 : cone du socle
                cone { <0,0,1.6>, 0.55, <0,0,3.2>, 0.4 } // Co2 : corps de la piece
                torus { 0.3 ,0.2 scale <1,0.5,1> rotate <90,0,0> translate <0,0,3> } // T3 : anneau sur le haut de la piece  
                cone { <0,0,3.2>, 0.4, <0,0,4>, 0.8 } // Co3 : 1er cone de la tete de la piece
                cone { <0,0,4>, 0.8, <0,0,4.3> 0.6 } // Co4 : 2eme cone de la tete de la piece
                box { <-0.1,-0.1,4.3>, <0.1,0.1,5.1> } // B2 : box vericale de la croix
                box { <-0.1,-0.3,4.55>, <0.1,0.3,4.85> } // B1 : box horizontale de la croix
                sphere { <0,0,5.22> 0.12 } // S1 : Sphere en haut de la croix
            }
            torus { 1 ,0.15 scale <1,0.6,1> rotate <90,0,0> translate <0,0,0.4> } // T1 : Demarcation creuse du socle
        }   
        texture{ textr finish {specular 0.5} }
        scale 0.38
        translate transl
    }
    roi_piece
#end