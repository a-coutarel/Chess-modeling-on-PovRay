#macro dame(transl,textr)
    #local dame_piece = object {
        difference {
            union {
                cylinder { <0,0,0>, <0,0,0.4>, 1 } // Cy1 : bas du socle 
                torus { 0.4, 0.25 scale <1,1,1> rotate <90,0,0> translate <0,0,1.40> } // T2 : anneau sur le haut du socle
                cone { <0,0,0.4>, 1, <0,0,1.6>, 0.5 } // Co1 : cone du socle
                cone { <0,0,1.6>, 0.55, <0,0,3.2>, 0.4 } // Co2 : corps de la piece
                torus { 0.3, 0.2 scale <1,0.5,1> rotate <90,0,0> translate <0,0,3> } // T3 : anneau sur le haut de la piece
                cone { <0,0,3.2>, 0.4, <0,0,4>, 0.8 } // Co3 : Haut de la piece
                sphere { <0,0,4>, 0.5 }  // S11 : sphere sur la tete de la piece
                sphere { <0,0,4.75> 0.25 } // S12 : Sphere tout en haut de la piece
            }   
            union {      
                torus { 1, 0.15 scale <1,0.6,1> rotate <90,0,0> translate <0,0,0.4> } // T1 : Demarcation creuse du socle
                #for (i, 1, 10)
                    sphere { <cos(i*Pi/5)*0.8/cos(0), sin(i*Pi/5)*0.8/sin(Pi/2), 4>, 0.2 } // S1-10 : spheres qui vont creuser Co3 pour creer la couronne
                #end 
            }
        }   
        texture{ textr finish {specular 0.5} }
        scale 0.38
        translate transl
    }
    dame_piece
#end