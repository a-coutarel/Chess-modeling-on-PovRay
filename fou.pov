#macro fou(transl, rot, textr)
object {
    blob {
        sphere { <0,0,-2.8>, 3.4, -1.1 scale <1,1,0.2> rotate <0,0,0> } // Coupe pour rendre le socle droit
        sphere { <0,0,0>, 4, 1.2} // Socle de la piece
        sphere { <0,0,4>, 1, 1.1 scale <1,1,0.2> rotate <0,0,0> }// Relief en dessous du creu en bas
        cylinder { <0,0,2>, <0,0,4.6>, 1, 1.2 } // Corps bas de la piece
        sphere { <0,0,2.5 >, 1, 1.2 scale <1,1,0.5> } // Deborderment sur le bas du corps
        sphere { <0,0,13.5>, 1, 1.1 scale <1,1,0.2> rotate <0,0,0> } // Debordement sur le milieu
        sphere { <0,0,23>, 1.7, 1.2 scale <1,1,0.2> } // Debordement sur le haut  
        cylinder { <0,0,3>, <0,0,4.5>, 0.6, 1.2 } // Corps haut de la piece
        sphere { <0,0,5.6>, 1, 5 } // Tete du fou
        sphere { <0,0,6.5>, 0.2, 5 } // Sphere tout en haut du fou
        sphere { <0,5.5,18.8>, 1.5, -10 scale <1,1,0.2> rotate <45,0,0> } // Breche sur la tete du fou
    }
    rotate rot
    texture{ textr finish {specular 0.5} }
    scale <0.29,0.29,0.24>
    translate transl
}
#end   