//
//  main.swift
//  tpRPG
//
//  Created by MAHHA on 08/03/2017.
//  Copyright © 2017 MAHHA. All rights reserved.
//


func input() -> Int {
    
    let clv : String? = readLine()
    
    return Int(clv!)!
    
    
}

class Personnage: protocolPesonnage{
    
    
    let nom:String
    let classe:Classe
    var arme:Arme
    var vie:Int
    
    init(nom: String,classe: Classe) {
        self.nom = nom
        self.classe = classe
        
        
        //Initialisation de l'Arme et la Vie selon la classe du personnage
        
        switch self.classe {
            
        case .Archer:
            self.arme = Arc()
            self.vie = 100
            
        case .Guerier:
            self.arme = Epee()
            self.vie = 120
            
            
        case .Mage:
            self.arme = Sceptre()
            self.vie = 140
            
        }
        
    }
    
    func play(adversaire : Personnage) {
        
        var choixStrategie:Int
        
        self.showDesc()
        print("Quel choix ?")
        print("1. Attaquer")
        print("2. Améliorer son arme")
        
        choixStrategie=input()
        
        switch(choixStrategie){
            
        case 1:
            self.kill(personnage: adversaire)
            
        case 2:
            
            self.ameliorerArme()
            
        default:
            
            break
            
        }
    }
    
    func kill(personnage:Personnage) {
        
        personnage.getDamage(damage: self.arme.nbDegats)
        
    }
    
    func getDamage(damage : Int){
        
        vie -= damage;
        
        
    }
    
    func isKilled() -> Bool {
        
        if(vie<=0){
            return true
        }
        else
        {
            return false
        }
    }
    
    
    internal func ameliorerArme() {
        
        switch self.classe {
            
        case .Archer:
            self.arme.nbDegats+=3
            
        case .Guerier:
            self.arme.nbDegats+=5
            
        case .Mage:
            self.arme.nbDegats+=4
            
        }
    }
    
    func showDesc() {
        print("Nom : \(nom)")
        print("Vie : \(vie)")
        print("Dégâts de son arme \(arme.nbDegats)");
        
    }
    
    
    
}

protocol protocolPesonnage {
    func ameliorerArme()
    
}

enum Classe {
    
    case Archer, Guerier, Mage
    
}


class Arme{
    
    
    let nom:String
    var nbDegats:Int
    
    init(nom:String, nbDegats:Int) {
        self.nom = nom
        self.nbDegats = nbDegats
        
    }
    
}

class Epee: Arme {
    
    init(){
        
        super.init(nom: "Epee", nbDegats: 7)
        
    }
    
    
    
}

class Sceptre: Arme {
    
    init(){
        
        super.init(nom: "Sceptre", nbDegats: 14)
        
    }
    
    
    
}

class Arc: Arme {
    
    init(){
        
        super.init(nom: "Arc", nbDegats: 10)
        
    }
    
    
}

var classe1:Classe! // classe1 doit contenir une valeur, sinon problème lors de l'init de Personnage1
var classe2:Classe! // pareil

var choixClasse1:Int
var choixClasse2:Int
var gameOver:Bool = false

repeat {
    
    print("Classe du personnage 1 :")
    
    print("1. Archer")
    
    print("2. Guerrier")
    
    print("3. Mage")
    
    print("Quel choix ?")
    
    choixClasse1=input()
    
} while choixClasse1 != 1 && choixClasse1 != 2 && choixClasse1 != 3



switch(choixClasse1){
    
case 1:
    
    classe1 = .Archer
    
case 2:
    
    classe1 = .Guerier
    
    
case 3:
    
    classe1 = .Mage
    
default:
    
    break
    
}


repeat {
    
    print("Classe du personnage 2 :")
    
    print("1. Archer")
    
    print("2. Guerrier")
    
    print("3. Mage")
    
    print("Quel choix ?")
    
    choixClasse2=input()
    
} while choixClasse2 != 1 && choixClasse2 != 2 && choixClasse2 != 3



switch(choixClasse2){
    
case 1:
    
    classe2 = .Archer
    
case 2:
    
    classe2 = .Guerier
    
    
case 3:
    
    classe2 = .Mage
    
default:
    
    break
    
}

var Personnage1 = Personnage(nom: "Personnage 1 : ", classe : classe1)
var Personnage2 = Personnage(nom: "Personnage 2 : ", classe : classe2)


while Personnage1.vie>0 && Personnage2.vie>0 {
    
    Personnage1.play(adversaire: Personnage2)
    
    if(Personnage2.vie>0){
        
        Personnage2.play(adversaire: Personnage1)
        
    }
    
    
}


if(Personnage1.isKilled()){
    
    print("Personnage 2 est le vainqueur!")
    
}
    
else {
    
    print("Personnage 1 est le vainqueur!")
    
}






