#macro pion(transl,textr)
    #local pion_piece = object {
        union {
            cylinder{ <0,0,0>, <0,0,0.2>, 0.6 } // Socle de la piece
            lathe {
                bezier_spline 4,
                < 0.6, 0.2>, < 0.6, 0.3>, < 0.5, 0.3>, < 0.5, 0.4>
                rotate <90,0,0>   
            } // Haut du socle de la piece
            lathe {
                bezier_spline 4,
                < 0.5, 0.4>, < 0.5, 0.5>, < 0.3, 0.6>, < 0.3, 1.4> 
                rotate <90,0,0>  
            } // Corps de la piece
            lathe {
                bezier_spline 4,
                < 0.3, 1.4>, < 0.3, 1.46>, < 0.38, 1.55>, < 0.38, 1.6> 
                rotate <90,0,0>  
            } // Bas de la partie qui tient la sphere
            lathe {
                bezier_spline 4,
                < 0.38, 1.6>, < 0.38, 1.65>, < 0.22, 1.74>, < 0.3, 1.82> 
                rotate <90,0,0>  
            } // Haut de la partie qui tient la sphere
            sphere { <0,0,2.15> 0.45 } // Sphere tout en haut de la piece
        }         
        texture{ textr finish {specular 0.5} }
        scale 0.5
        translate transl
    }
    pion_piece
#end 
