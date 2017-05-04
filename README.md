Enigma Machine

Aim: To build a ruby-based enigma machine

Description: The enigma machine was a cypher machine used in the early 20th century, for both military and commercial purposes. Widely known for its use by the German military to encrypt their radio transmissions, during the Second World War. The enigma code worked off a series of letter substitutions to encrypt the plaintext into cyphertext. Its strength was derived from the numerous substitutions which resulted in around fifteen billion billion letter combinations. In addition to its cryptographic strength, the use of the reflector meant that entering the cyphertext back into the enigma machine would decrypt the message and return the plaintext - provided the settings were exactly the same for both encryption and decryption. Most variants of the enigma machine had three rotors, but the Kriegsmarine M4 and Abwehr variants had four rotors, for added security.

Process: The operator would enter a letter which was first substituted by the plugboard and would then pass through three rotors, being substituted each time. As the letter passed through the first rotor it would shift one position in order to scramble the potential letters further. Once the first rotor had completed one full revolution, it would trigger the second rotor to shift once. After passing through all the rotors, the signal would hit the reflector and be reflected back through the rotors to be substituted a further three times. Finally, the letter would be substituted once more by the plugboard, with the final encrypted letter illuminated on the lampboard.

Letter = "A"
Plugboard ( "A" => "G")

Letter = "G"
Rotor 3 ("G" => "D")

Letter = "D"
Rotor 2 ("D" => "W")

Letter = "W"
Rotor 1 ("W" => "Q")

Letter = "Q"
Reflector ("Q" = > "H")

Letter = "H"
Rotor 1 ("H" => "P")

Letter = "P"
Rotor 2 ("P" => "Z")

Letter = "Z"
Rotor 3 ("Z" => "R")

Letter = "R"
Plugboard ("R" => "U")
Final letter = "U"

In the above example, the letter "A" is substituted for the letter "U" but, due to the turnover of the rotors, if the operator was to press "A" again a different letter could light up.

Objectives:

1) As a user, I can encrypt a plaintext message
2) As a user, I can decrypt a cyphertext message
3) As a user, I can set the Rotor settings
4) As a user, I can set the Plugboard settings
